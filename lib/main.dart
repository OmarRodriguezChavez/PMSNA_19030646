import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psmna10/provider/theme_provider.dart';
import 'package:psmna10/routes.dart';
import 'package:psmna10/screens/onBoarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
  final id_tema=sharedPreferences.getInt('id_tema')??0;
  runApp(MyApp( id_tema :id_tema));
}

class MyApp extends StatelessWidget {
  final int id_tema;
  const MyApp({super.key, required this.id_tema});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(id_tema, context)),
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
      theme: theme.getThemeData(),
      routes: getApplicationRoutes(),
      home: OnboardingPage(),
    );
  }
}
