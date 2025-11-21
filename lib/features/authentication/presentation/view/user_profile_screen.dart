import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:penoft_machine_test/features/authentication/presentation/view/signup_success_screen.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:penoft_machine_test/general/utils/app_icons.dart';
import 'package:penoft_machine_test/general/widgets/custom_button.dart';
import 'package:penoft_machine_test/general/widgets/custom_network_image.dart';
import 'package:penoft_machine_test/general/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({
    super.key,
    required this.isGoogleSignIn,
    this.isEdit = false,
  });
  final bool isGoogleSignIn;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    if (isEdit) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        context.read<AuthenticationProvider>().setData();
      });
    }
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                  Gap(8),
                  Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Consumer<AuthenticationProvider>(
              builder: (context, state, _) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Profile',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(12),
                    Text(
                      'If needed you can change the details by clicking on them',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Gap(40),
                    Text(
                      'Profile Picture',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(12),
                    if (state.profilePicture != null)
                      GestureDetector(
                        onTap: () {
                          state.getGalleryImage();
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: CNetworkImage(
                            boxFit: BoxFit.cover,
                            url: state.profilePicture!,
                          ),
                        ),
                      )
                    else if (state.profilePictureFile != null)
                      GestureDetector(
                        onTap: () {
                          state.getGalleryImage();
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.file(
                            state.profilePictureFile!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    else
                      GestureDetector(
                        onTap: () {
                          state.getGalleryImage();
                        },
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(AppIcons.addImage, scale: 4),
                        ),
                      ),

                    Gap(20),
                    Text(
                      'Full Name',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
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
                    Gap(12),
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(12),
                    CustomTextField(
                      readOnly: true,
                      hintText: 'Enter your email',
                      textCapitalization: TextCapitalization.words,
                      controller: state.emailController,
                      validator: (value) => EmailValidator.validate(value ?? '')
                          ? null
                          : 'Please enter a valid email',
                    ),
                    Gap(20),
                    if (isGoogleSignIn == true) ...[
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(12),
                      CustomTextField(
                        hintText: 'Enter your phone number',
                        controller: state.phoneNumberController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone number is required';
                          } else if (value.contains(RegExp(r'[^0-9+]'))) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      Gap(20),
                    ],
                    CustomGradientButton(
                      buttonWidth: double.infinity,
                      buttonHeight: 50,
                      borderRadius: 10,
                      buttonColors: [Color(0x809B4AE8), Color(0xFF8932EB)],
                      buttonWidget: state.isUploadingProfilePicture
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
                        if (state.isCreatingUser ||
                            state.isUploadingProfilePicture) {
                          return;
                        }
                        if (formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          if (isGoogleSignIn == true) {
                            state.createUser(
                              onComplete: () {
                                state.clearFields();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SignupSuccessScreen(),
                                  ),
                                  (route) => false,
                                );
                              },
                            );
                          } else {
                            state.uploadProfilePicture(() {
                              state.clearFields();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SignupSuccessScreen(),
                                ),
                                (route) => false,
                              );
                            });
                          }
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
