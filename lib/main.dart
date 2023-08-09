import 'package:bloc/Ui/Home/HomeScreen.dart';
import 'package:bloc/Ui/LoginScreen/LoginScreen.dart';
import 'package:bloc/Ui/Profile/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:bloc/Ui/Counter/CounterBloc.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home:  LoginScreen(),
    );
  }
}

