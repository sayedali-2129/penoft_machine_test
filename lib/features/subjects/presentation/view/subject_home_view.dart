import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/features/home/presentation/view/widgets/subject_card.dart';
import 'package:penoft_machine_test/features/home/presentation/view/widgets/subject_list_shimmer.dart';
import 'package:penoft_machine_test/features/subjects/presentation/provider/subjects_provider.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:provider/provider.dart';

class SubjectsHomeView extends StatelessWidget {
  const SubjectsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subject Tutoring',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'All Subjects',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                  Gap(8),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(12),
        Consumer<SubjectsProvider>(
          builder: (context, subjectState, _) {
            return subjectState.isLoading && subjectState.subjects.isEmpty
                ? SubjectListShimmer(itemCount: 5)
                : SizedBox(
                    height: 90,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      separatorBuilder: (context, index) => Gap(8),
                      scrollDirection: Axis.horizontal,
                      itemCount: subjectState.subjects.length,
                      itemBuilder: (context, index) {
                        return SubjectCard(
                          subject: subjectState.subjects[index],
                        );
                      },
                    ),
                  );
          },
        ),
      ],
    );
  }
}
