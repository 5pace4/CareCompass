import 'dart:js';

import 'package:doctors_consulatcy/constants/global_variables.dart';
import 'package:doctors_consulatcy/features/auth/screens/auth_screen.dart';
import 'package:doctors_consulatcy/features/auth/services/auth_services.dart';
import 'package:doctors_consulatcy/features/home/screens/home_screen.dart';
import 'package:doctors_consulatcy/providers/user_provider.dart';
import 'package:doctors_consulatcy/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.secondaryColor),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const HomeScreen()
          : const AuthScreen(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('HELLO.'),
      //   ),
      //   body: Column(
      //     children: [
      //       const Center(
      //         child: Text('Flutter Demo Home Page'),
      //       ),
      //       Builder(builder: (context) {
      //         return ElevatedButton(
      //           onPressed: () {
      //             Navigator.pushNamed(context, AuthScreen.routeName);
      //           },
      //           child: Text('click'),
      //         );
      //       })
      //     ],
      //   ),
      // ),
    );
  }
}
