import 'package:flutter/material.dart';
import 'package:penoft_machine_test/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:penoft_machine_test/features/splash_screen/presentation/view/splash_screen.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:penoft_machine_test/general/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomOutlineButton(
          buttonHeight: 50,
          buttonWidth: double.infinity,
          borderRadius: 10,
          buttonColor: Colors.transparent,
          borderColor: AppColors.primary,

          buttonWidget: Text(
            'Log Out',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          onPressed: () {
            context.read<AuthenticationProvider>().logOut(
              onSuccess: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SplashScreen()),
                  (route) => false,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
