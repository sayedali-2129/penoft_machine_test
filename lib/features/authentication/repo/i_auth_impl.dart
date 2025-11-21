import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:penoft_machine_test/features/authentication/data/model/user_model.dart';
import 'package:penoft_machine_test/general/core/failures/failures.dart';
import 'package:penoft_machine_test/general/core/typedef.dart';
import 'package:penoft_machine_test/general/services/get_token.dart';

class IAuthImpl {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Dio dio = Dio();

  FutureResult<String> sendOtp(String email) async {
    try {
      log('Sending OTP to $email');
      final response = await http.post(
        Uri.parse('https://machinetest.flutter.penoft.com/api/user/send-otp'),
        body: {'email': email},
      );

      final data = jsonDecode(response.body);
      log('Data: ${data.toString()}');
      if (response.statusCode == 200) {
        return right(data['message']);
      } else {
        return left(MainFailure.serverFailure(errorMsg: data['error']));
      }
    } catch (e) {
      return left(MainFailure.serverFailure(errorMsg: e.toString()));
    }
  }

  FutureResult<Map<String, dynamic>> verifyOtp(String email, String otp) async {
    try {
      final response = await http.post(
        Uri.parse('https://machinetest.flutter.penoft.com/api/user/verify-otp'),
        body: {'email': email, 'otp': otp},
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return right(data);
      } else {
        return left(MainFailure.serverFailure(errorMsg: data['error']));
      }
    } catch (e) {
      return left(MainFailure.serverFailure(errorMsg: e.toString()));
    }
  }

  FutureResult<Map<String, dynamic>> signInWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
      final gUser = await GoogleSignIn(
        serverClientId:
            '577755749490-2quctpi3fdr24oraqamhob5lqtkg3i01.apps.googleusercontent.com',
      ).signIn();

      log('gUser: $gUser');

      final gAuth = await gUser?.authentication;
      log('gAuth: $gAuth');

      if (gAuth == null) {
        return left(
          MainFailure.generalFailure(errorMsg: 'Cancelled Google SignIn'),
        );
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      log('credential: $credential');

      await _firebaseAuth.signInWithCredential(credential);

      // final isExisting = await _userExisting();
      // if (isExisting) {
      //   await _updateUser(name: gUser?.displayName, userImage: gUser?.photoUrl);
      // } else {
      //   await _createUser(name: gUser?.displayName, userImage: gUser?.photoUrl);
      // }

      return right({
        'name': gUser?.displayName,
        'email': gUser?.email,
        'image': gUser?.photoUrl,
      });
    } on FirebaseAuthException catch (e) {
      log('signInWithGoogle FirebaseAuthException: $e');
      return left(
        MainFailure.serverFailure(
          errorMsg: 'FirebaseAuthException: ${e.message}',
        ),
      );
    } on Exception catch (e) {
      log('signInWithGoogle Exception: $e');
      return left(MainFailure.serverFailure(errorMsg: '$e'));
    }
  }

  FutureResult<UserModel> createUser(UserModel user) async {
    try {
      log('createUser: ${user.toMap()}');
      final response = await http.post(
        Uri.parse(
          'https://machinetest.flutter.penoft.com/api/user/create-user',
        ),
        body: user.toCreateUserMap(),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return right(
          UserModel(
            id: data['userId'],
            fullname: data['fullname'],
            email: data['email'],
            phone: data['phone'],
            picture: data['picture'],
          ),
        );
      } else {
        return left(MainFailure.serverFailure(errorMsg: data['error']));
      }
    } catch (e, s) {
      log('createUser Exception: $e');
      log('createUser StackTrace: $s');
      return left(MainFailure.serverFailure(errorMsg: '$e'));
    }
  }

  FutureResult<UserModel?> getUser({
    required String email,
    String? token,
  }) async {
    log('getUser email: $email');
    log('getUser token: $token');
    try {
      String? tokenResult;
      if (token == null) {
        tokenResult = await GetToken.getJwtToken(email: email);
      } else {
        tokenResult = token;
      }

      final response = await http.get(
        Uri.parse('https://machinetest.flutter.penoft.com/api/user/get-user'),
        headers: {'Authorization': 'Bearer $tokenResult'},
      );
      log('response: ${response.statusCode}');
      final data = jsonDecode(response.body);
      log('getUser response: $data');
      if (response.statusCode == 200) {
        return right(UserModel.fromMap(data['user']));
      } else {
        return left(MainFailure.serverFailure(errorMsg: data['error']));
      }
    } catch (e) {
      return left(MainFailure.serverFailure(errorMsg: '$e'));
    }
  }

  FutureResult<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
      await GoogleSignIn().signOut();
      return right(null);
    } catch (e) {
      return left(MainFailure.serverFailure(errorMsg: '$e'));
    }
  }

  FutureResult<String> uploadProfilePicture({
    required String email,
    required File imageFile,
  }) async {
    try {
      final token = await GetToken.getJwtToken(email: email);

      final formData = FormData.fromMap({
        "picture": await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
      });

      final response = await dio.post(
        "https://machinetest.flutter.penoft.com/api/user/add-picture",
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'Multipart/form-data',
          },
        ),
      );

      log('uploadProfilePicture response: ${response.data}');

      if (response.statusCode == 200) {
        return right(response.data['picture']);
      } else {
        return left(
          MainFailure.serverFailure(errorMsg: response.data['error']),
        );
      }
    } on DioException catch (e) {
      log('uploadProfilePicture DioException: ${e.response?.data}');
      String errorMsg = 'Failed to upload profile picture';
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          errorMsg = e.response!.data['error'] ?? errorMsg;
        } else if (e.response!.data is String) {
          errorMsg = 'Something went wrong';
        }
      } else {
        errorMsg = e.message ?? errorMsg;
      }
      return left(MainFailure.serverFailure(errorMsg: errorMsg));
    } catch (e) {
      return left(MainFailure.serverFailure(errorMsg: e.toString()));
    }
  }

  FutureResult<String> saveFullName({
    required String email,
    required String fullname,
    String? token,
  }) async {
    final dio = Dio();

    String? tokenResult;
    if (token == null) {
      tokenResult = await GetToken.getJwtToken(email: email);
    } else {
      tokenResult = token;
    }

    try {
      final response = await dio.post(
        'https://machinetest.flutter.penoft.com/api/user/add-fullname',
        options: Options(headers: {'Authorization': 'Bearer $tokenResult'}),
        data: {'fullname': fullname},
      );

      if (response.statusCode == 200) {
        return right(response.data['fullname']);
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
      return left(MainFailure.serverFailure(errorMsg: '$e'));
    }
  }
}
