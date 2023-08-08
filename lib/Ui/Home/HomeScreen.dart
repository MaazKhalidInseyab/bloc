import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(color: Colors.red, elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Daata"),
                  ),
                ),Card(color: Colors.lightGreenAccent, elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Data"),
                  ),
                ),Card(
                  elevation: 8,
                  child: Container(color: Colors.lightGreenAccent,width:80.0 ,height:80.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text("Data")),
                    ),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
