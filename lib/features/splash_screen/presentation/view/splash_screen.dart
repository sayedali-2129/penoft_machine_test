// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:penoft_machine_test/features/app_root/presentation/app_root.dart';
import 'package:penoft_machine_test/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:penoft_machine_test/features/authentication/presentation/view/login_screen.dart';
import 'package:penoft_machine_test/features/authentication/presentation/view/user_profile_screen.dart';
import 'package:penoft_machine_test/features/authentication/presentation/view/username_screen.dart';
import 'package:penoft_machine_test/general/utils/app_images.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.read<AuthenticationProvider>().getUser().then((value) {
        _init();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(AppImages.logo, scale: 5)],
        ),
      ),
    );
  }

  Future<void> _init() async {
    final currentUser = context.read<AuthenticationProvider>().currentUser;

    log('currentUser: $currentUser');

    if (currentUser == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    } else if (currentUser.fullname == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => UsernameScreen()),
        (route) => false,
      );
    } else if (currentUser.picture == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              UserProfileScreen(isGoogleSignIn: false, isEdit: true),
        ),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const AppRoot()),
        (route) => false,
      );
    }
  }
}
