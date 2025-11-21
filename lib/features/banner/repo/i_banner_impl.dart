import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:penoft_machine_test/general/core/failures/failures.dart';
import 'package:penoft_machine_test/general/core/typedef.dart';
import 'package:penoft_machine_test/general/services/get_token.dart';

class IBannerImpl {
  final Dio dio = Dio();

  FutureResult<String?> getBanner({required String email}) async {
    try {
      final token = await GetToken.getJwtToken(email: email);
      final response = await dio.get(
        'https://machinetest.flutter.penoft.com/api/data/banner',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      log('getBanner response: ${response.data}');
      if (response.statusCode == 200) {
        return right(response.data['data']);
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
