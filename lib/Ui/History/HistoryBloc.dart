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
  final chat = BehaviorSubject<String>();

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
    ChatHistory res = data as ChatHistory;
    print("HistoryBloc " +
        res.messages!.elementAt(0).auditLogResponse.toString());
    chat.sink.add(res.messages!.elementAt(0).auditLogResponse.toString());
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => History(),
        ));
  }

  @override
  void show() {
    Factory().showProgressDialog(context);
    // TODO: implement show
  }
}
