import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/features/materials/presentation/provider/materials_provider.dart';
import 'package:penoft_machine_test/features/materials/presentation/view/widgets/material_card.dart';
import 'package:penoft_machine_test/features/materials/presentation/view/widgets/material_list_shimmer.dart';
import 'package:provider/provider.dart';

class MaterialHomeView extends StatelessWidget {
  const MaterialHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Buy Materials',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Gap(12),
        Consumer<MaterialsProvider>(
          builder: (context, materialsProvider, _) {
            return materialsProvider.isLoading &&
                    materialsProvider.materials.isEmpty
                ? MaterialListShimmer(itemCount: 5)
                : ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) => Gap(17),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: materialsProvider.materials.length,
                    itemBuilder: (context, index) => MaterialCard(
                      material: materialsProvider.materials[index],
                    ),
                  );
          },
        ),
      ],
    );
  }
}
