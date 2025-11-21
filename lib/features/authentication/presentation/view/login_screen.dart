import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/features/app_root/presentation/app_root.dart';
import 'package:penoft_machine_test/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:penoft_machine_test/features/authentication/presentation/view/otp_screen.dart';
import 'package:penoft_machine_test/features/authentication/presentation/view/user_profile_screen.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:penoft_machine_test/general/utils/app_fonts.dart';
import 'package:penoft_machine_test/general/utils/app_icons.dart';
import 'package:penoft_machine_test/general/widgets/custom_button.dart';
import 'package:penoft_machine_test/general/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 52.0),
        child: Form(
          key: authenticationProvider.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(32),
              Text(
                'Enter your email',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Gap(12),
              Text(
                'Enter your email to receive verification code.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Gap(40),
              CustomTextField(
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                controller: authenticationProvider.emailController,
                prefixIcon: Icon(Icons.email_outlined),
                validator: (value) => EmailValidator.validate(value ?? '')
                    ? null
                    : 'Please enter a valid email',
              ),
              Gap(20),
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
                      if (state.isLoading) return;
                      if (state.formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        state.sendOtp(
                          onSuccess: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OtpScreen(),
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
              Gap(34),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                          fontFamily: AppFonts.inter,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                          fontFamily: AppFonts.inter,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(30),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: AppColors.neutral, thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                        fontFamily: AppFonts.inter,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: AppColors.neutral, thickness: 1),
                  ),
                ],
              ),
              Gap(30),
              Consumer<AuthenticationProvider>(
                builder: (context, state, _) {
                  return CustomOutlineButton(
                    buttonColor: AppColors.white,
                    borderColor: AppColors.neutral,
                    buttonHeight: 50,
                    buttonWidth: double.infinity,
                    borderRadius: 10,
                    buttonWidget: state.isGoogleLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: AppColors.neutral500,
                              strokeWidth: 1.5,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppIcons.google, scale: 4),
                              Gap(10),
                              Text(
                                'Continue with Google',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.neutral500,
                                ),
                              ),
                            ],
                          ),
                    onPressed: () {
                      if (state.isGoogleLoading) return;
                      state.signInWithGoogle(
                        success: (isNewUser) {
                          if (isNewUser == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserProfileScreen(isGoogleSignIn: true),
                              ),
                            );
                          } else {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AppRoot(),
                              ),
                              (route) => false,
                            );
                          }
                        },
                        failure: () {},
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
