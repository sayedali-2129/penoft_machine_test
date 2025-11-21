import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:penoft_machine_test/features/authentication/data/model/user_model.dart';
import 'package:penoft_machine_test/features/authentication/repo/i_auth_impl.dart';
import 'package:penoft_machine_test/general/core/failures/failures.dart';
import 'package:penoft_machine_test/general/widgets/custom_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends ChangeNotifier {
  final IAuthImpl _authImpl = IAuthImpl();
  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  String? profilePicture;
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? profilePictureFile;

  bool isLoading = false;
  Future<void> sendOtp({required VoidCallback onSuccess}) async {
    isLoading = true;
    notifyListeners();
    final result = await _authImpl.sendOtp(emailController.text.trim());
    result.fold(
      (failure) {
        log('Error: ${failure.errorMsg}');
        CToast.error(msg: failure.errorMsg);
      },
      (data) {
        CToast.success(msg: data);
        onSuccess.call();
      },
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> verifyOtp({required Function(String token) onSuccess}) async {
    isLoading = true;
    notifyListeners();
    final result = await _authImpl.verifyOtp(
      emailController.text.trim(),
      otpController.text.trim(),
    );
    result.fold(
      (failure) {
        CToast.error(msg: failure.errorMsg);
      },
      (data) async {
        CToast.success(msg: data['message']);
        await saveUserToSharedPreferences(emailController.text.trim());
        onSuccess.call(data['token']);
      },
    );
    isLoading = false;
    notifyListeners();
  }

  bool isGoogleLoading = false;
  Future<void> signInWithGoogle({
    required void Function(bool isNewUser) success,
    required void Function() failure,
  }) async {
    isGoogleLoading = true;
    notifyListeners();
    final result = await _authImpl.signInWithGoogle();
    result.fold(
      (l) {
        l.maybeMap(
          orElse: () {},
          serverFailure: (value) {
            log(value.errorMsg);
            CToast.error(msg: value.errorMsg);
          },
          generalFailure: (value) {
            log(value.errorMsg);
            CToast.error(msg: value.errorMsg);
          },
        );
        failure.call();
      },
      (r) async {
        await saveUserToSharedPreferences(r['email']);
        await getUser();
        if (currentUser == null) {
          profilePicture = r['image'];
          usernameController.text = r['name'] ?? '';
          emailController.text = r['email'] ?? '';
          success.call(true);
        } else {
          success.call(false);
        }
      },
    );
    isGoogleLoading = false;
    notifyListeners();
  }

  bool isCreatingUser = false;
  Future<void> createUser({required VoidCallback onComplete}) async {
    isCreatingUser = true;
    notifyListeners();
    final result = await _authImpl.createUser(
      UserModel(
        fullname: usernameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneNumberController.text.trim(),
        picture: profilePicture,
      ),
    );
    result.fold(
      (failure) {
        CToast.error(msg: failure.errorMsg);
      },
      (success) {
        CToast.success(msg: 'User created successfully');
        _currentUser = success;
        onComplete.call();
      },
    );
    isCreatingUser = false;
    notifyListeners();
  }

  Future<void> getUser({String? token}) async {
    final email = await getUserFromSharedPreferences();
    log('email: $email');
    if (email == null) {
      _currentUser = null;
      notifyListeners();
      return;
    }
    final result = await _authImpl.getUser(email: email, token: token);
    result.fold(
      (failure) {
        log('Error: ${failure.errorMsg}');
        // CToast.error(msg: failure.errorMsg);
      },
      (success) {
        _currentUser = success;
        notifyListeners();
      },
    );
  }

  Future<void> saveUserToSharedPreferences(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  Future<String?> getUserFromSharedPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('email');
    } catch (e) {
      return null;
    }
  }

  Future<void> removeUserFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
  }

  Future<void> logOut({required VoidCallback onSuccess}) async {
    final result = await _authImpl.logOut();
    result.fold(
      (failure) {
        CToast.error(msg: failure.errorMsg);
      },
      (success) {
        removeUserFromSharedPreferences();
        _currentUser = null;
        onSuccess.call();
        notifyListeners();
      },
    );
    notifyListeners();
  }

  void clearFields() {
    emailController.clear();
    otpController.clear();
    usernameController.clear();
    phoneNumberController.clear();
    profilePicture = null;
  }

  bool isUploadingProfilePicture = false;
  Future<void> uploadProfilePicture(VoidCallback onSuccess) async {
    log('uploadProfilePicture');
    isUploadingProfilePicture = true;
    notifyListeners();
    if (profilePictureFile == null) {
      isUploadingProfilePicture = false;
      notifyListeners();
      return;
    }

    final result = await _authImpl.uploadProfilePicture(
      email: emailController.text.trim(),
      imageFile: profilePictureFile!,
    );
    result.fold(
      (failure) {
        CToast.error(msg: failure.errorMsg);
      },
      (success) {
        profilePicture = success;
        onSuccess.call();
      },
    );
    isUploadingProfilePicture = false;
    notifyListeners();
  }

  Future<void> getGalleryImage() async {
    try {
      final pickedImageFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImageFile != null) {
        profilePictureFile = File(pickedImageFile.path);
        notifyListeners();
      } else {
        profilePictureFile = null;
        notifyListeners();
      }
    } catch (e) {
      profilePictureFile = null;
      notifyListeners();
    }
  }

  Future<void> saveFullName({
    String? token,
    required VoidCallback onSuccess,
  }) async {
    isLoading = true;
    notifyListeners();
    final result = await _authImpl.saveFullName(
      email: emailController.text.trim(),
      fullname: usernameController.text.trim(),
      token: token,
    );
    result.fold(
      (failure) {
        CToast.error(msg: failure.errorMsg);
        isLoading = false;
        notifyListeners();
      },
      (success) {
        CToast.success(msg: 'Full name saved successfully');
        _currentUser = _currentUser?.copyWith(fullname: success);
        isLoading = false;
        notifyListeners();
        onSuccess.call();
      },
    );
  }

  void setData() {
    usernameController.text = _currentUser?.fullname ?? '';
    emailController.text = _currentUser?.email ?? '';
    phoneNumberController.text = _currentUser?.phone ?? '';
    profilePicture = _currentUser?.picture;
    notifyListeners();
  }
}
