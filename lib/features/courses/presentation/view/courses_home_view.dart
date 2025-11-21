import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/features/courses/presentation/provider/course_provider.dart';
import 'package:penoft_machine_test/features/courses/presentation/view/widgets/course_card.dart';
import 'package:penoft_machine_test/features/courses/presentation/view/widgets/course_list_shimmer.dart';
import 'package:provider/provider.dart';

class CoursesHomeView extends StatelessWidget {
  const CoursesHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'All Courses',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Gap(12),
        Consumer<CourseProvider>(
          builder: (context, courseProvider, _) {
            return courseProvider.isLoading && courseProvider.courses.isEmpty
                ? CourseListShimmer(itemCount: 5)
                : ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) => Gap(16),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: courseProvider.courses.length,
                    itemBuilder: (context, index) =>
                        CourseCard(course: courseProvider.courses[index]),
                  );
          },
        ),
      ],
    );
  }
}
