import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/features/home/presentation/view/widgets/subject_card_shimmer.dart';

class SubjectListShimmer extends StatelessWidget {
  const SubjectListShimmer({super.key, this.itemCount = 5});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (context, index) => Gap(8),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) => SubjectCardShimmer(),
      ),
    );
  }
}
