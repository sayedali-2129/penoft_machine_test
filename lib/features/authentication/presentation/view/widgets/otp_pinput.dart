import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:pinput/pinput.dart';

class OtpPinput extends StatelessWidget {
  final TextEditingController otpController;
  const OtpPinput({super.key, required this.otpController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Pinput(
        autofocus: true,
        controller: otpController,
        length: 6,

        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: (value) {
          String val = value ?? "";
          if (val.isEmpty && val.length != 6) {
            return "Please Enter valid No.";
          }
          return null;
        },

        onChanged: (val) {
          if (val.length == 6) {
            if (val.length == 6) {}
          }
        },

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        defaultPinTheme: PinTheme(
          textStyle: TextStyle(
            fontSize: 20,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(width: 1.5, color: AppColors.neutral),
          ),
        ),
        focusedPinTheme: PinTheme(
          textStyle: TextStyle(
            fontSize: 20,
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(width: 1.5, color: AppColors.primary),
          ),
        ),

        submittedPinTheme: PinTheme(
          textStyle: TextStyle(
            fontSize: 20,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.transparent,
                blurRadius: 2.0,
                spreadRadius: 1.0,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(width: 1.5, color: AppColors.neutral),
          ),
        ),
      ),
    );
  }
}
