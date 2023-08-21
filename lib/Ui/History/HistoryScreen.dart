import 'dart:async';

import 'package:bloc/Factory.dart';
import 'package:bloc/Ui/History/HistoryBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/ChatHistoryResponse.dart';

class History extends StatefulWidget {
  final int topic;
  final String topicName;

  History(this.topic, this.topicName);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late HistoryBloc bloc;

  @override
  void initState() {
    bloc = HistoryBloc(context);
    bloc.getChatHistory(widget.topic);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(CupertinoIcons.back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                    child: Text(widget.topicName,
                        style: TextStyle(color: Colors.black87))),
              ],
            ),
            Expanded(
              child: StreamBuilder(
                stream: bloc.chat.stream,
                builder:
                    (BuildContext context, AsyncSnapshot<List<Messages>> chat) {
                  return ListView.builder(

                    shrinkWrap: true,
                    controller: bloc.controller,
                    itemCount: chat.hasData ? chat.data!.length : 0,

                    itemBuilder: (BuildContext context, int index) {

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Card(
                                color: Colors.green[600],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    chat.hasData
                                        ? "You: " +
                                            chat.data!
                                                .elementAt(index)
                                                .auditLog
                                                .toString()
                                        : "No dataaa",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Flexible(
                                  child: Card(
                                    color: Colors.green[900],
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          chat.hasData
                                              ? chat.data!
                                                  .elementAt(index)
                                                  .auditLogResponse
                                                  .toString()
                                              : "No dataaa",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom:5.0),
              child: Row(
                children: [
                  IconButton(
                    tooltip: "More Options",
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.teal,
                      )),
                  Expanded(
                    child: Card(
                      elevation: 16,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: bloc.messageField,
                          style: TextStyle(color: Colors.black87),
decoration: InputDecoration(
  hintText: "Type a Message",
hintStyle: TextStyle(color: Colors.black38),
  border: InputBorder.none
),
                        ),
                      ),
                    ),
                  ),IconButton(onPressed: (){bloc.sendMessage(widget.topic.toString());}, icon:Icon(Icons.rocket_launch_sharp,color: Colors.teal,) )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
