import 'package:flutter/material.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class BannerShimmer extends StatelessWidget {
  const BannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: AppColors.black.withValues(alpha: 0.3),
        highlightColor: AppColors.black.withValues(alpha: 0.1),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.black.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

