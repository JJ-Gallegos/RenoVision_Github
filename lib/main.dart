import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:renovision_app/authentication/auth.dart';
import 'package:renovision_app/authentication/login_or_register.dart';
import 'package:renovision_app/firebase_options.dart';
import 'package:renovision_app/pages/home_page.dart';
import 'package:renovision_app/pages/how_to_page.dart';
import 'package:renovision_app/pages/profile_page.dart';
import 'package:renovision_app/pages/contractors_page.dart';
import 'package:renovision_app/theme/dark_mode.dart';
import 'package:renovision_app/theme/light_mode.dart';

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
        theme: lightMode,
        darkTheme: darkMode,
        routes: {
          '/login_register_page': (context) => const LoginOrRegister(),
          '/home_page': (context) => const HomePage(),
          '/profile_page': (context) => ProfilePage(),
          '/contractors_page': (context) => const ContractorsPage(),
          '/how_to_page': (context) => const HowToPage(),
        });
  }
}
