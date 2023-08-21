import 'package:bloc/Ui/Counter/CounterScreen.dart';
import 'package:bloc/Ui/LoginScreen/LoginScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:null,
        useMaterial3: true,
      ),
      home:  LoginScreen(),
    );
  }
}

