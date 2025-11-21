import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:penoft_machine_test/features/courses/data/course_model.dart';
import 'package:penoft_machine_test/general/core/failures/failures.dart';
import 'package:penoft_machine_test/general/core/typedef.dart';
import 'package:penoft_machine_test/general/services/get_token.dart';

class ICoursesImpl {
  final Dio dio = Dio();

  FutureResult<List<CourseModel>> getCourses({required String email}) async {
    try {
      final token = await GetToken.getJwtToken(email: email);
      final response = await dio.get(
        'https://machinetest.flutter.penoft.com/api/data/courses',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        final courses = data
            .map((e) => CourseModel.fromMap(e as Map<String, dynamic>))
            .toList();
        return right(courses);
      } else {
        return left(
          MainFailure.serverFailure(errorMsg: response.data['error']),
        );
      }
    } on DioException catch (e) {
      return left(
        MainFailure.serverFailure(errorMsg: e.response?.data['error']),
      );
    } catch (e) {
      return left(MainFailure.serverFailure(errorMsg: e.toString()));
    }
  }
}
