import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:penoft_machine_test/features/subjects/data/subject_model.dart';
import 'package:penoft_machine_test/general/core/failures/failures.dart';
import 'package:penoft_machine_test/general/core/typedef.dart';
import 'package:penoft_machine_test/general/services/get_token.dart';

class ISubjectImpl {
  final Dio dio = Dio();
  FutureResult<List<SubjectModel>> getSubjects({required String email}) async {
    try {
      final token = await GetToken.getJwtToken(email: email);
      final response = await dio.get(
        'https://machinetest.flutter.penoft.com/api/data/subjects',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final data = response.data['data'] as List;
      final subjects = data
          .map((e) => SubjectModel.fromMap(e as Map<String, dynamic>))
          .toList();
      return right(subjects);
    } on DioException catch (e) {
      return left(
        MainFailure.serverFailure(errorMsg: e.response?.data['error']),
      );
    } catch (e) {
      return left(MainFailure.serverFailure(errorMsg: e.toString()));
    }
  }
}
