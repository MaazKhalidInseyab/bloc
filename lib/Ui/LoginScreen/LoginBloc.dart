import 'package:bloc/DataProvider.dart';
import 'package:bloc/ProgressDialogListener.dart';
import 'package:bloc/Ui/Home/HomeScreen.dart';
import 'package:flutter/material.dart';
import '../../Factory.dart';
import '../../Models/loginResponse.dart';
import '../Constants.dart';
import '../Topics/TopicsScreen.dart';


class LoginBloc implements ProgressDialogListener{
  BuildContext context;

  LoginBloc(this.context);

  late LoginResponse res;
  TextEditingController userEmailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void LoginButton()  {

  final String email=userEmailCtrl.text.toString();
  final String pass=passwordCtrl.text.toString();
  DataProvider().login(context,email,pass,formKey,this);

  }



  @override
  void hide(Object data) {
    if (Constants.isShowing) Factory().dismissProgressDialog(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen2(),
        ));
  }

  @override
  void show() {
if(!Constants.isShowing)Factory().showProgressDialog(context);

  }

  @override
  void dismiss(String? error) {
    if (Constants.isShowing) Factory().dismissProgressDialog(context);

    Factory().showSnackbar(context, error!);
  }

}
