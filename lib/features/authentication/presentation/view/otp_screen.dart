// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/features/app_root/presentation/app_root.dart';
import 'package:penoft_machine_test/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:penoft_machine_test/features/authentication/presentation/view/user_profile_screen.dart';
import 'package:penoft_machine_test/features/authentication/presentation/view/username_screen.dart';
import 'package:penoft_machine_test/features/authentication/presentation/view/widgets/otp_pinput.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:penoft_machine_test/general/utils/app_fonts.dart';
import 'package:penoft_machine_test/general/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 52.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(32),
            Text(
              'Enter verification code',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Gap(12),
            Text(
              'Enter the verification code sent to your email',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            Gap(40),
            OtpPinput(otpController: authenticationProvider.otpController),
            Gap(30),
            Consumer<AuthenticationProvider>(
              builder: (context, state, _) {
                return CustomGradientButton(
                  buttonWidth: double.infinity,
                  buttonHeight: 50,
                  borderRadius: 10,
                  buttonColors: [Color(0x809B4AE8), Color(0xFF8932EB)],
                  buttonWidget: state.isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                            strokeWidth: 1.5,
                          ),
                        )
                      : Text(
                          'Continue',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  onPressed: () {
                    state.verifyOtp(
                      onSuccess: (token) {
                        state.getUser(token: token).then((_) {
                          if (state.currentUser?.fullname == null) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UsernameScreen(token: token),
                              ),
                              (route) => false,
                            );
                          } else if (state.currentUser?.picture == null) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserProfileScreen(isGoogleSignIn: false),
                              ),
                              (route) => false,
                            );
                          } else {
                            state.clearFields();

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AppRoot(),
                              ),
                              (route) => false,
                            );
                          }
                        });
                      },
                    );
                  },
                );
              },
            ),
            Gap(20),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Didn\'t receive the code? ',
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.inter,
                      ),
                    ),
                    TextSpan(
                      text: 'Resend',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.inter,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
