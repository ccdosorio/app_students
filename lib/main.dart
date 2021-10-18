import 'package:app_students/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_students/services/services.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Students App',
        initialRoute: 'checking',
        routes: {
          'checking': (_) => CheckAuthScreen(),
          'login': (_) => LoginScreen(),
          'register': (_) => RegisterScreen(),
          'home': (_) => HomeScreen()
        },
        scaffoldMessengerKey: NotificationsService.messengerKey,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
        ));
  }
}
