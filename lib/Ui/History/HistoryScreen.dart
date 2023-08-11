import 'package:bloc/Ui/History/HistoryBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/ChatHistoryResponse.dart';

class History extends StatefulWidget {

  final int topic;
  History(this.topic);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late HistoryBloc hb;

  @override
  void initState() {
    hb = HistoryBloc(context);
    hb.getChatHistory(widget.topic);
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
                    (BuildContext context, AsyncSnapshot<List<Messages>> chat) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount:chat.hasData? chat.data!.length:0,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Card(

                                color: Colors.amberAccent,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(chat.hasData
                                      ? "Prompt: "+ chat.data!.elementAt(index).auditLog.toString()
                                      : "No dataaa"),
                                ),
                              ),
                            ],
                          ),Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Card(

                                  color: Colors.lightBlueAccent[100],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(chat.hasData
                                        ? chat.data!.elementAt(index).auditLogResponse.toString()
                                        : "No dataaa"),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
