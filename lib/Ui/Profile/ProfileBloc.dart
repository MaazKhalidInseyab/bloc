

import 'package:bloc/DataProvider.dart';
import 'package:bloc/Factory.dart';
import 'package:bloc/Models/loginResponse.dart';
import 'package:bloc/ProgressDialogListener.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBloc implements ProgressDialogListener{
BuildContext context;

ProfileBloc(this.context);
  final profile=BehaviorSubject<PayLoad>();
  getProfileData(){
   DataProvider().getProfile(context,this,);
  }

  @override
  void dismiss(String? error) {
    // TODO: implement dismiss
  }

  @override
  void hide(Object data) {
    // TODO: implement hide
    Factory().dismissProgressDialog(context);
    final user=data as LoginResponse;
    if(user.payLoad !=null){profile.sink.add(user.payLoad!);}


  }

  @override
  void show() {
    Factory().showProgressDialog(context);
    // TODO: implement show
  }

}