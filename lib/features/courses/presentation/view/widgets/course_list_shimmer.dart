import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/features/courses/presentation/view/widgets/course_card_shimmer.dart';

class CourseListShimmer extends StatelessWidget {
  const CourseListShimmer({super.key, this.itemCount = 5});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16),
      separatorBuilder: (context, index) => Gap(16),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) => CourseCardShimmer(),
    );
  }
}
