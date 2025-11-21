import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:penoft_machine_test/features/app_root/presentation/app_root.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:penoft_machine_test/general/utils/app_lotties.dart';
import 'package:penoft_machine_test/general/widgets/custom_button.dart';

class SignupSuccessScreen extends StatelessWidget {
  const SignupSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          children: [
            Center(
              child: FadeIn(
                child: Lottie.asset(repeat: false, AppLotties.signupSuccess),
              ),
            ),
            Center(
              child: ZoomIn(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: AppColors.green,
                      child: Icon(
                        Icons.check,
                        color: AppColors.white,
                        size: 60,
                      ),
                    ),
                    Gap(20),
                    Text(
                      'Congrats!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gap(12),
                    Text(
                      'You have signed up successfully. Go to home & start exploring courses',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
        child: CustomGradientButton(
          buttonWidth: double.infinity,
          buttonHeight: 50,
          borderRadius: 10,
          buttonColors: [Color(0x809B4AE8), Color(0xFF8932EB)],
          buttonWidget: Text(
            'Go to Home',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const AppRoot()),
              (route) => false,
            );
          },
        ),
      ),
    );
  }
}
