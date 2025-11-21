import 'package:flutter/material.dart';
import 'package:penoft_machine_test/features/app_root/presentation/provider/app_root_provider.dart';
import 'package:penoft_machine_test/features/banner/presentation/provider/banner_provider.dart';
import 'package:penoft_machine_test/features/courses/presentation/provider/course_provider.dart';
import 'package:penoft_machine_test/features/courses/presentation/view/course_screen.dart';
import 'package:penoft_machine_test/features/home/presentation/view/home_screen.dart';
import 'package:penoft_machine_test/features/materials/presentation/provider/materials_provider.dart';
import 'package:penoft_machine_test/features/profile/profile_screen.dart';
import 'package:penoft_machine_test/features/subjects/presentation/provider/subjects_provider.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:penoft_machine_test/general/utils/app_icons.dart';
import 'package:provider/provider.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late List<Widget> _pages;

  @override
  void initState() {
    _pages = [const HomeScreen(), const CourseScreen(), const ProfileScreen()];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppRootProvider>().setCurrentIndex(0);
      _fetchHomeData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appRootProvider = Provider.of<AppRootProvider>(context);
    return Scaffold(
      body: _pages.elementAt(appRootProvider.currentIndex),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.1),
              blurRadius: 5,
              offset: Offset(0, -5),
            ),
          ],
        ),

        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.white,
            type: BottomNavigationBarType.fixed,

            elevation: 4,
            currentIndex: appRootProvider.currentIndex,
            onTap: (index) {
              appRootProvider.setCurrentIndex(index);
            },

            items: [
              BottomNavigationBarItem(
                icon: Image.asset(AppIcons.homeFilled, scale: 4),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppIcons.courses, scale: 4),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppIcons.profile, scale: 4),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetchHomeData() async {
    final subjectsProvider = context.read<SubjectsProvider>();
    final bannerProvider = context.read<BannerProvider>();
    final coursesProvider = context.read<CourseProvider>();
    final materialsProvider = context.read<MaterialsProvider>();
    Future.wait([
      subjectsProvider.getSubjects(),
      coursesProvider.getCourses(),
      bannerProvider.getBanner(),
      materialsProvider.getMaterials(),
    ]);
  }
}
