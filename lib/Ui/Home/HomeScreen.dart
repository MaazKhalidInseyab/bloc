import 'package:bloc/Ui/Home/HomeBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = HomeBloc(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: ()=>homeBloc.topicsNavigator(),
                    child: Card(
                      elevation: 8,
                      child: Container(
                        width: 130.0,
                        height: 140.0,
                        decoration: ShapeDecoration(
                            color: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        child: Center(
                            child: Text(
                          "Topics",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap:()=> homeBloc.profileNavigator(),
                    child: Card(
                      elevation: 8,
                      child: Container(
                        width: 140.0,
                        height: 100.0,
                        decoration: ShapeDecoration(
                            color: Colors.yellowAccent.shade700,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        child: Center(
                            child: Text("Profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Card(
                    elevation: 8,
                    child: Container(
                      width: 100.0,
                      height: 140.0,
                      decoration: ShapeDecoration(
                          color: Colors.greenAccent.shade200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      child: Center(
                          child: Text(
                        "History",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      )),
                    ),
                  ),
                ),
                Card(
                  elevation: 8,
                  child: Container(
                    width: 180.0,
                    height: 140.0,
                    decoration: ShapeDecoration(
                        color: Colors.limeAccent[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: Center(
                        child: Text(
                      "Data",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
