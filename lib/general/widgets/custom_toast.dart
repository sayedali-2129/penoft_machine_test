import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:penoft_machine_test/general/utils/app_fonts.dart';
import 'package:penoft_machine_test/main.dart';

class CToast {
  static void success({required String msg}) {
    FToast ftoast = FToast();
    ftoast.init(navigatorKey.currentContext!);

    Widget toast = FadeInDown(
      duration: const Duration(milliseconds: 200),
      child: Container(
        // width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: AppColors.white),
            const Gap(5),
            //message
            Flexible(
              child: Text(
                msg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppFonts.inter,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ftoast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 2),
    );
  }

  static void error({required String msg}) {
    FToast ftoast = FToast();
    ftoast.init(navigatorKey.currentContext!);

    Widget toast = FadeInDown(
      duration: const Duration(milliseconds: 200),
      child: Container(
        // width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        decoration: BoxDecoration(
          color: Colors.red[600],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.close, color: AppColors.white),
            const Gap(5),
            //message
            Flexible(
              child: Text(
                msg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: AppFonts.inter,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    ftoast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 2),
    );
  }

  static void infoToast({required String msg}) {
    FToast ftoast = FToast();
    ftoast.init(navigatorKey.currentContext!);

    Widget toast = FadeInDown(
      duration: const Duration(milliseconds: 200),
      child: Container(
        // width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        decoration: BoxDecoration(
          color: const Color(0xff399FFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.info, color: AppColors.white),
            const Gap(10),
            //message
            Flexible(
              child: Text(
                msg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    ftoast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
