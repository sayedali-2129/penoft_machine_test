import 'package:dio/dio.dart';

class GetToken {
  static final Dio dio = Dio();

  static Future<String?> getJwtToken({required String email}) async {
    try {
      final response = await dio.get(
        'https://machinetest.flutter.penoft.com/api/user/generate-token',
        data: {'email': email},
      );
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw Exception(response.data['error']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['error']);
    } catch (e) {
      throw Exception(e);
    }
  }
}
