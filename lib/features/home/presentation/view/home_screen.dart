import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/features/banner/presentation/view/banner_view.dart';
import 'package:penoft_machine_test/features/courses/presentation/view/courses_home_view.dart';
import 'package:penoft_machine_test/features/materials/presentation/view/material_home_view.dart';
import 'package:penoft_machine_test/features/subjects/presentation/view/subject_home_view.dart';
import 'package:penoft_machine_test/general/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        HomeAppBar(isLabelVisible: true),
        SliverToBoxAdapter(child: SubjectsHomeView()),
        SliverGap(20),
        SliverToBoxAdapter(child: BannerView()),
        SliverGap(20),
        SliverToBoxAdapter(child: CoursesHomeView()),
        SliverGap(20),
        SliverToBoxAdapter(child: MaterialHomeView()),
        SliverGap(20),
      ],
    );
  }
}
