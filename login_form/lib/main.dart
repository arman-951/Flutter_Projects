import 'package:flutter/material.dart';
import 'package:login_form/features/auth/screens/login_screen.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication',
      home: LoginScreen(),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'features/auth/screens/login_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Login Form',
//       home: LoginScreen(),
//     );
//   }
// }