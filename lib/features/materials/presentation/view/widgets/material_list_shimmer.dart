import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/features/materials/presentation/view/widgets/material_card_shimmer.dart';

class MaterialListShimmer extends StatelessWidget {
  const MaterialListShimmer({super.key, this.itemCount = 5});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16),
      separatorBuilder: (context, index) => Gap(17),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) => MaterialCardShimmer(),
    );
  }
}
