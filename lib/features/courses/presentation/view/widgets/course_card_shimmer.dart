import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CourseCardShimmer extends StatelessWidget {
  const CourseCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Shimmer.fromColors(
              baseColor: AppColors.black.withValues(alpha: 0.3),
              highlightColor: AppColors.black.withValues(alpha: 0.1),
              child: Container(
                width: 144,
                constraints: BoxConstraints(minHeight: 100),
                decoration: BoxDecoration(
                  color: AppColors.black.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Gap(12),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: AppColors.black.withValues(alpha: 0.3),
                    highlightColor: AppColors.black.withValues(alpha: 0.1),
                    child: Container(
                      width: double.infinity,
                      height: 16,
                      decoration: BoxDecoration(
                        color: AppColors.black.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Gap(4),
                  Shimmer.fromColors(
                    baseColor: AppColors.black.withValues(alpha: 0.3),
                    highlightColor: AppColors.black.withValues(alpha: 0.1),
                    child: Container(
                      width: 120,
                      height: 14,
                      decoration: BoxDecoration(
                        color: AppColors.black.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Divider(
                      color: AppColors.black.withValues(alpha: 0.5),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                        baseColor: AppColors.black.withValues(alpha: 0.3),
                        highlightColor: AppColors.black.withValues(alpha: 0.1),
                        child: Container(
                          width: 80,
                          height: 14,
                          decoration: BoxDecoration(
                            color: AppColors.black.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      Shimmer.fromColors(
                        baseColor: AppColors.black.withValues(alpha: 0.3),
                        highlightColor: AppColors.black.withValues(alpha: 0.1),
                        child: Container(
                          width: 60,
                          height: 14,
                          decoration: BoxDecoration(
                            color: AppColors.black.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(8),
                  Shimmer.fromColors(
                    baseColor: AppColors.black.withValues(alpha: 0.3),
                    highlightColor: AppColors.black.withValues(alpha: 0.1),
                    child: Container(
                      width: 70,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.black.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
