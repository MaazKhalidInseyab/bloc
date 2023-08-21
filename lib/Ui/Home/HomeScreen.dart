import 'package:bloc/Ui/Home/HomeBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   late HomeBloc homeBloc;
//
//   @override
//   void initState() {
//     homeBloc = HomeBloc(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           //mainAxisAlignment: MainAxisAlignment.spaceAround,
//           //mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 18.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   GestureDetector(
//                     onTap: () => homeBloc.topicsNavigator(),
//                     child: Card(
//                       elevation: 8,
//                       child: Container(
//                         width: 130.0,
//                         height: 140.0,
//                         decoration: ShapeDecoration(
//                             color: Colors.redAccent,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0))),
//                         child: Center(
//                             child: Text(
//                           "Topics",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20.0),
//                         )),
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () => homeBloc.profileNavigator(),
//                     child: Card(
//                       elevation: 8,
//                       child: Container(
//                         width: 140.0,
//                         height: 100.0,
//                         decoration: ShapeDecoration(
//                             color: Colors.yellowAccent.shade700,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0))),
//                         child: Center(
//                             child: Text("Profile",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20.0))),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20.0),
//                   child: GestureDetector(
//                     child: Card(
//                       elevation: 8,
//                       child: Container(
//                         width: 100.0,
//                         height: 140.0,
//                         decoration: ShapeDecoration(
//                             color: Colors.greenAccent.shade200,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0))),
//                         child: Center(
//                             child: Text(
//                           "History",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20.0),
//                         )),
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   child: Card(
//                     elevation: 8,
//                     child: Container(
//                       width: 180.0,
//                       height: 140.0,
//                       decoration: ShapeDecoration(
//                           color: Colors.limeAccent[700],
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0))),
//                       child: Center(
//                           child: Text(
//                         "Data",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20.0),
//                       )),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = HomeBloc(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       // backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center
            ,
            //mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  GestureDetector(
                    child: Card(
                      elevation: 8,
                      child: Container(
                        width: 180.0,
                        height: 250.0,
                        decoration: ShapeDecoration(
                            color: Colors.greenAccent.shade200,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        child: Center(
                            child: Text(
                          "HISTORY",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0),
                        )),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => homeBloc.topicsNavigator(),
                        child: Card(
                          elevation: 8,
                          child: Container(
                            width: 180.0,
                            height: 140.0,
                            decoration: ShapeDecoration(
                                color: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            child: Center(
                                child: Text(
                              "TOPICS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            )),
                          ),
                        ),
                      ),
                      Row(
                        children:[ GestureDetector(
                          onTap: () => homeBloc.CalculatorNavigator(),
                          child: Card(
                            elevation: 8,
                            child: Container(
                              width: 85.0,
                              height: 100.0,
                              decoration: ShapeDecoration(
                                  color: Colors.yellowAccent.shade700,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0))),
                              child: Center(
                                  child: Text("Some\nButton",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0))),
                            ),
                          ),
                        ),GestureDetector(
                          onTap: () => homeBloc.profileNavigator(),
                          child: Card(
                            elevation: 8,
                            child: Container(
                              width: 85.0,
                              height: 100.0,
                              decoration: ShapeDecoration(
                                  color: Colors.deepPurpleAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0))),
                              child: Center(
                                  child: Text("PROFILE",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0))),
                            ),
                          ),
                        )]
                      )
                    ],
                  )
                ],
              ),
              GestureDetector(
                onTap:()=> homeBloc.ChatsNavigator(),
                child: Card(
                  elevation: 8,
                  child: Container(
                    width: 370.0,
                    height: 140.0,
                    decoration: ShapeDecoration(
                        color: Colors.limeAccent[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: Center(
                        child: Text(
                      "CHATS",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
