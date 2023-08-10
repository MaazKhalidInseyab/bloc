import 'package:bloc/Ui/History/HistoryBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/ChatHistoryResponse.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late HistoryBloc hb;

  @override
  void initState() {
    hb = HistoryBloc(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("C H A T"),
              ),
            ),
            Flexible(
              child: StreamBuilder(
                stream: hb.chat.stream,
                builder:
                    (BuildContext context, AsyncSnapshot<String> chat) {
                  return  Card(

                        child: Column(
                          children: [
                            Text(chat.hasData
                                ? chat.data.toString()
                                : "No dataaa"),
                          ],
                        ),
                      );
                    },
                  )

            )],
        ),
      ),
    );
  }
}
