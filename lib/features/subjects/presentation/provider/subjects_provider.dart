import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:penoft_machine_test/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:penoft_machine_test/features/subjects/data/subject_model.dart';
import 'package:penoft_machine_test/features/subjects/repo/i_subject_impl.dart';
import 'package:penoft_machine_test/general/widgets/custom_toast.dart';
import 'package:penoft_machine_test/main.dart';
import 'package:provider/provider.dart';

class SubjectsProvider extends ChangeNotifier {
  final ISubjectImpl _subjectImpl = ISubjectImpl();

  List<SubjectModel> _subjects = [];
  List<SubjectModel> get subjects => _subjects;

  bool _isSubjectsLoading = false;
  bool get isLoading => _isSubjectsLoading;

  Future<void> getSubjects() async {
    _clearSubjects();
    _isSubjectsLoading = true;
    notifyListeners();

    final email = navigatorKey.currentContext
        ?.read<AuthenticationProvider>()
        .currentUser
        ?.email;

    final result = await _subjectImpl.getSubjects(email: email!);
    result.fold(
      (failure) {
        log('failure: ${failure.errorMsg}');
        CToast.error(msg: failure.errorMsg);
        _isSubjectsLoading = false;
        notifyListeners();
      },
      (data) {
        _subjects = data;
        _isSubjectsLoading = false;
        notifyListeners();
      },
    );
  }

  void _clearSubjects() {
    _subjects = [];
    _isSubjectsLoading = false;
    notifyListeners();
  }
}
