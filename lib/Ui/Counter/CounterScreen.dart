import 'package:bloc/Ui/Counter/CounterBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text("History")],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Result",
              style: TextStyle(fontSize: 40),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
             onTap: (){}, child: SizedBox(

                height: 80,
                width: 80,
                child: Card(child: Center(child: Text("1",style: TextStyle(fontSize: 20),)),elevation: 10.0,)
              ),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "8",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "9",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "/",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    "7",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "8",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "9",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "*",
                    style: TextStyle(fontSize: 30),
                  )),
            ),
          ],
        ),Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "5",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "6",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "-",
                    style: TextStyle(fontSize: 30),
                  )),
            ),
          ],
        ),Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "2",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "+",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    ".",
                    style: TextStyle(fontSize: 30),
                  )),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "0",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "%",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "=",
                    style: TextStyle(fontSize: 40),
                  )),
            ),
          ],
        )
      ]),
    ));
  }
}

// class CounterScreen extends StatefulWidget {
//   const CounterScreen({super.key});
//
//   @override
//   State<CounterScreen> createState() => _CounterScreenState();
// }
//
// class _CounterScreenState extends State<CounterScreen> {
//   late CounterBloc bloc;
//
//   @override
//   void initState() {
//     bloc = CounterBloc();
//     bloc.counter.sink.add(0);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.only(top: 18.0),
//           child: Column(
//             children: [
//               StreamBuilder(
//                 stream: bloc.counter.stream,
//                 builder:
//                     (BuildContext context, AsyncSnapshot<int> counterValue) {
//                   return Text(
//                     counterValue.hasData ? counterValue.data.toString() : '0',
//                     style: TextStyle(fontSize: 40, color: Colors.black),
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           FloatingActionButton(
//             heroTag: "btn1",
//             onPressed: () => bloc.plus(),
//             child: Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             heroTag: "btn2",
//             onPressed: () => bloc.minus(),
//             child: Icon(CupertinoIcons.minus),
//           ),
//         ],
//       ),
//     );
//   }
// }
