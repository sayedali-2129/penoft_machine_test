import 'package:flutter/material.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class SubjectCardShimmer extends StatelessWidget {
  const SubjectCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.black.withValues(alpha: 0.3),
      highlightColor: AppColors.black.withValues(alpha: 0.1),
      child: Container(
        width: 160,
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.black.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              width: 80,
              height: 14,
              decoration: BoxDecoration(
                color: AppColors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
