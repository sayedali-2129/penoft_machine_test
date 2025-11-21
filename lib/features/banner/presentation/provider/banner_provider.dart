import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:penoft_machine_test/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:penoft_machine_test/features/banner/repo/i_banner_impl.dart';
import 'package:penoft_machine_test/general/widgets/custom_toast.dart';
import 'package:penoft_machine_test/main.dart';
import 'package:provider/provider.dart';

class BannerProvider extends ChangeNotifier {
  final IBannerImpl _bannerImpl = IBannerImpl();

  String? _banner;
  String? get banner => _banner;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getBanner() async {
    _isLoading = true;
    notifyListeners();

    final email = navigatorKey.currentContext
        ?.read<AuthenticationProvider>()
        .currentUser
        ?.email;

    final result = await _bannerImpl.getBanner(email: email!);
    result.fold(
      (failure) {
        log('failure: ${failure.errorMsg}');
        CToast.error(msg: failure.errorMsg);
        _isLoading = false;
        notifyListeners();
      },
      (data) {
        _banner = data;
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
