import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:penoft_machine_test/features/authentication/presentation/view/user_profile_screen.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:penoft_machine_test/general/widgets/custom_button.dart';
import 'package:penoft_machine_test/general/widgets/custom_textfield.dart';
import 'package:penoft_machine_test/main.dart';
import 'package:provider/provider.dart';

class UsernameScreen extends StatelessWidget {
  const UsernameScreen({super.key, this.token});
  final String? token;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 52.0),
        child: Form(
          key: formKey,
          child: Consumer<AuthenticationProvider>(
            builder: (context, state, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(32),
                  Text(
                    'What’s your name?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Gap(40),
                  Text(
                    'Full Name',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Gap(12),
                  CustomTextField(
                    hintText: 'Enter your full name',
                    textCapitalization: TextCapitalization.words,
                    controller: state.usernameController,
                    validator: (value) => value?.isNotEmpty ?? false
                        ? null
                        : 'Full name is required',
                  ),
                  Gap(20),

                  CustomGradientButton(
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
                      if (formKey.currentState!.validate()) {
                        state.saveFullName(
                          token: token,
                          onSuccess: () {
                            Navigator.push(
                              navigatorKey.currentContext!,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserProfileScreen(isGoogleSignIn: false),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
