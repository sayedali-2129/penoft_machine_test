import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:penoft_machine_test/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:penoft_machine_test/features/courses/data/course_model.dart';
import 'package:penoft_machine_test/features/courses/repo/i_courses_impl.dart';
import 'package:penoft_machine_test/general/widgets/custom_toast.dart';
import 'package:penoft_machine_test/main.dart';
import 'package:provider/provider.dart';

class CourseProvider extends ChangeNotifier {
  final ICoursesImpl _coursesImpl = ICoursesImpl();
  List<CourseModel> _courses = [];
  List<CourseModel> get courses => _courses;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getCourses() async {
    _clearCourses();
    _isLoading = true;
    notifyListeners();

    final email = navigatorKey.currentContext
        ?.read<AuthenticationProvider>()
        .currentUser
        ?.email;

    final result = await _coursesImpl.getCourses(email: email!);
    result.fold(
      (failure) {
        log('failure: ${failure.errorMsg}');
        CToast.error(msg: failure.errorMsg);
        _isLoading = false;
        notifyListeners();
      },
      (data) {
        log('data: ${data.length}');
        _courses = data;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  void _clearCourses() {
    _courses = [];
    _isLoading = false;
    notifyListeners();
  }
}
