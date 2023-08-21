import 'dart:async';

import 'package:bloc/DataProvider.dart';
import 'package:bloc/Factory.dart';
import 'package:bloc/Models/ChatHistoryResponse.dart';
import 'package:bloc/ProgressDialogListener.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Code.dart';
import 'HistoryScreen.dart';

class HistoryBloc implements ProgressDialogListener {
  final chat = BehaviorSubject<List<Messages>>();
  final chatname = BehaviorSubject<String>();
  ScrollController controller = new ScrollController();
  BuildContext context;
  TextEditingController messageField = TextEditingController();

  HistoryBloc(this.context);

  getChatHistory(int? topicId) async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    DataProvider().getChatHistory(context, this, topicId);
  }

  sendMessage(String topicId) {
    debugPrint(messageField.text.toString());

    DataProvider()
        .askQuestion(this, context, messageField.text.toString(), topicId);
    messageField.text = "";
    print(topicId);
  }

  @override
  void dismiss(String? error) {
    // TODO: implement dismiss
  }

  @override
  void hide(Object data) {
    Factory().dismissProgressDialog(context);
    final res = data as ChatHistory;

    chat.sink.add(res.messages!);
    goDown();
  }

  @override
  void show() {
    Factory().showProgressDialog(context);
    // TODO: implement show
  }

  goDown() {
    Timer(Duration(milliseconds: 50), () {
      controller.animateTo(
        controller.position.maxScrollExtent,
        duration: Duration(milliseconds: 50),
        curve: Curves.easeOut,
      );
    });
  }
}
