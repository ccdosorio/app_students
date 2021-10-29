import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_students/screens/screens.dart';
import 'package:app_students/theme/theme.dart';
import 'package:flutter/services.dart';
import 'package:app_students/services/services.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new AuthService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Students App',
      initialRoute: 'checking',
      routes: {
        'checking': (_) => CheckAuthScreen(),
        'login': (_) => LoginScreen(),
        'register': (_) => RegisterScreen(),
        'menu': (_) => TabsScreen(),
        'courses': (_) => CoursesScreen(),
        'settings': (_) => SettingsScreen(),
      },
      theme: myThemeLight,
    );
  }
}
