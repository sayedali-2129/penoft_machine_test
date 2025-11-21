import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:penoft_machine_test/features/app_root/presentation/provider/app_root_provider.dart';
import 'package:penoft_machine_test/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:penoft_machine_test/features/banner/presentation/provider/banner_provider.dart';
import 'package:penoft_machine_test/features/cart/presentation/provider/cart_provider.dart';
import 'package:penoft_machine_test/features/courses/presentation/provider/course_provider.dart';
import 'package:penoft_machine_test/features/materials/presentation/provider/materials_provider.dart';
import 'package:penoft_machine_test/features/splash_screen/presentation/view/splash_screen.dart';
import 'package:penoft_machine_test/features/subjects/presentation/provider/subjects_provider.dart';
import 'package:penoft_machine_test/firebase_options.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:penoft_machine_test/general/utils/app_fonts.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => AppRootProvider()),
        ChangeNotifierProvider(create: (context) => SubjectsProvider()),
        ChangeNotifierProvider(create: (context) => BannerProvider()),
        ChangeNotifierProvider(create: (context) => CourseProvider()),
        ChangeNotifierProvider(create: (context) => MaterialsProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        builder: (context, child) {
          return Overlay(
            initialEntries: [
              if (child != null)
                OverlayEntry(
                  builder: (context) => MediaQuery(
                    data: MediaQuery.of(
                      context,
                    ).copyWith(textScaler: const TextScaler.linear(1)),
                    child: child,
                  ),
                ),
            ],
          );
        },
        navigatorKey: navigatorKey,
        title: 'Penoft Machine Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: AppFonts.inter,
          scaffoldBackgroundColor: AppColors.white,
          primaryColor: AppColors.primary,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
