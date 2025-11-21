import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/features/courses/presentation/provider/course_provider.dart';
import 'package:penoft_machine_test/features/courses/presentation/view/widgets/course_card.dart';
import 'package:penoft_machine_test/general/widgets/home_appbar.dart';
import 'package:provider/provider.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<CourseProvider>(context);
    return CustomScrollView(
      slivers: [
        HomeAppBar(
          isLabelVisible: false,
          title: Text(
            'Courses',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        SliverGap(10),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList.separated(
            separatorBuilder: (context, index) => Gap(16),
            itemCount: courseProvider.courses.length,
            itemBuilder: (context, index) =>
                CourseCard(course: courseProvider.courses[index]),
          ),
        ),
      ],
    );
  }
}
