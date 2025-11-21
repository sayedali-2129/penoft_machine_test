import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:penoft_machine_test/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:penoft_machine_test/features/materials/data/material_model.dart';
import 'package:penoft_machine_test/features/materials/repo/i_materials_impl.dart';
import 'package:penoft_machine_test/general/widgets/custom_toast.dart';
import 'package:penoft_machine_test/main.dart';
import 'package:provider/provider.dart';

class MaterialsProvider extends ChangeNotifier {
  final IMaterialsImpl _materialsImpl = IMaterialsImpl();
  List<MaterialModel> _materials = [];
  List<MaterialModel> get materials => _materials;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getMaterials() async {
    _clearMaterials();
    _isLoading = true;
    notifyListeners();

    final email = navigatorKey.currentContext
        ?.read<AuthenticationProvider>()
        .currentUser
        ?.email;

    final result = await _materialsImpl.getMaterials(email: email!);
    result.fold(
      (failure) {
        log('failure: ${failure.errorMsg}');
        CToast.error(msg: failure.errorMsg);
        _isLoading = false;
        notifyListeners();
      },
      (data) {
        _materials = data;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  void _clearMaterials() {
    _materials = [];
    _isLoading = false;
    notifyListeners();
  }
}
