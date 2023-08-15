import 'package:bloc/DataProvider.dart';
import 'package:bloc/Factory.dart';
import 'package:bloc/Models/ChatHistoryResponse.dart';
import 'package:bloc/ProgressDialogListener.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HistoryScreen.dart';

class HistoryBloc implements ProgressDialogListener {
  final chat = BehaviorSubject<List<Messages>>();
  final chatname=BehaviorSubject<String>();

  BuildContext context;

  HistoryBloc(this.context);

  getChatHistory(int? topicId) async {
    DataProvider().getChatHistory(context, this, topicId);
  }

  @override
  void dismiss(String? error) {
    // TODO: implement dismiss
  }

  @override
  void hide(Object data) {
    Factory().dismissProgressDialog(context);
    final res = data as ChatHistory;
    //final chatList = [];
    for(int i=0;i<res.messages!.length;i++){
     print(res.messages!.elementAt(i).auditLog.toString()) ;
    }
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => History(),
    //     ));

    chat.sink.add(res.messages!);
  }

  @override
  void show() {
    Factory().showProgressDialog(context);
    // TODO: implement show
  }
}
