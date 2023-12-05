// ignore_for_file: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:renovision_app/authentication/auth.dart';
import 'package:renovision_app/authentication/login_or_register.dart';
import 'package:renovision_app/firebase_options.dart';
import 'package:renovision_app/pages/contractor_register_page.dart';
import 'package:renovision_app/pages/flooring_page.dart';
import 'package:renovision_app/pages/home_page.dart';
import 'package:renovision_app/pages/paint_estimation_page.dart';
import 'package:renovision_app/pages/profile_page.dart';
import 'package:renovision_app/pages/contractors_page.dart';
import 'package:renovision_app/pages/roofing_page.dart';
import 'package:renovision_app/theme/dark_mode.dart';
import 'package:renovision_app/theme/light_mode.dart';
import 'package:renovision_app/theme/purple_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      //theme: purpleMode,
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_register_page': (context) => const LoginOrRegister(),
        '/home_page': (context) => const HomePage(),
        '/profile_page': (context) => ProfilePage(),
        '/contractors_page': (context) => const ContractorsPage(),
        '/paint_page': (context) => PaintEstimationPage(
              onTap: (double resultController) {},
            ),
        '/flooring_page': (context) => FlooringPage(
              onTap: (double resultController) {},
            ),
        '/roofing_page': (context) => RoofingPage(
              onTap: (double resultController) {},
            ),
        '/contractor_register_page': (context) =>
            const ContractorRegisterPage(),
      },
    );
  }
}
