import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psmna10/provider/flags_provider.dart';
import 'package:psmna10/provider/theme_provider.dart';
import 'package:psmna10/routes.dart';
import 'package:psmna10/screens/onBoarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
  final theme = sharedPreferences.getString('theme') ?? 'light';
  await Firebase.initializeApp();
  runApp(MyApp( theme :theme));
}

class MyApp extends StatelessWidget {
  final String theme;
  const MyApp({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(theme)),
        ChangeNotifierProvider(create: (_) => FlagsProvider()),
      ],
      child: PMSNApp(),
    );
  }
}

class PMSNApp extends StatelessWidget {
  const PMSNApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: theme.currentTheme,
      routes: getApplicationRoutes(),
      home: OnboardingPage(),
    );
  }
}
