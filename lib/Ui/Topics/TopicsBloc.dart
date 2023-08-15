import 'dart:convert';
import 'package:bloc/DataProvider.dart';
import 'package:bloc/Factory.dart';
import 'package:bloc/Models/TopicsResponse.dart';
import 'package:bloc/ProgressDialogListener.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dio/dio.dart';


import '../../Code.dart';
class TopicsBloc implements ProgressDialogListener{

final BuildContext context;
   final topics=BehaviorSubject<List<Topic>>();


  TopicsBloc(this.context);
  

getTopics(){
  DataProvider().getTopics(this,context);
  //
}

  @override
  void dismiss(String? error) {
    // TODO: implement dismiss
  }

  @override
  void hide(Object data) {
    // TODO: implement hide
    Factory().dismissProgressDialog(context);
    var res=data as TopicsResponse;

    topics.sink.add(res.payLoad!.topic!);
  }

  @override
  void show() {
  Factory().showProgressDialog(context);
    // TODO: implement show
  }


}