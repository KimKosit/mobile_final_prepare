import 'package:flutter/material.dart';
import './ui/profile.dart';
import './ui/login.dart';
import './ui/register.dart';

void main() => runApp(MyApp());

const MaterialColor myColor = const MaterialColor(
  0xfffdd835,
  const <int, Color>{
    50: const Color(0xfffdd835),
    100: const Color(0xfffdd835),
    200: const Color(0xfffdd835),
    300: const Color(0xfffdd835),
    400: const Color(0xfffdd835),
    500: const Color(0xfffdd835),
    600: const Color(0xfffdd835),
    700: const Color(0xfffdd835),
    800: const Color(0xfffdd835),
    900: const Color(0xfffdd835),
  },
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Final',
      theme: ThemeData(
        primarySwatch: myColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
