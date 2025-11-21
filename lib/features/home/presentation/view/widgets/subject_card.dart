import 'package:flutter/material.dart';
import 'package:penoft_machine_test/features/subjects/data/subject_model.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:penoft_machine_test/general/widgets/custom_network_image.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({super.key, required this.subject});
  final SubjectModel subject;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            hexToColor(subject.mainColor!),
            hexToColor(subject.gradientColor!),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CNetworkImage(url: subject.icon!),
          Text(
            subject.subject!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

Color hexToColor(String hexString) {
  final buffer = StringBuffer();
  final cleanHex = hexString.replaceFirst('#', '');
  if (cleanHex.length == 6) buffer.write('ff');
  buffer.write(cleanHex);
  return Color(int.parse(buffer.toString(), radix: 16));
}
