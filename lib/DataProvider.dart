import 'dart:convert';

import 'package:bloc/Connection.dart';
import 'package:bloc/ProgressDialogListener.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Code.dart';
import 'Factory.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'Models/TopicsResponse.dart';
import 'Models/loginResponse.dart';

class DataProvider {
  var dio = Dio();

  void login(BuildContext context, String email, String password, formKey,
      ProgressDialogListener progressDialogListener) async {
    if (await Connection().isNotConnected()) {
      Factory().showSnackbar(context, 'NO CONNECTION');
      return;
    }

    if (formKey.currentState!.validate()) {
      progressDialogListener.show(); ////start showing circular progress bar
      var formData = FormData.fromMap({
        'Email': email,
        'PasswordHash': password
      }); ////create data package to pass in the http request
      try {
        final response = await dio.post("https://haji.ai:2053/login",
            data: formData); /////make request and store response in a variable
        print("status code:" + response.statusCode.toString());
        if (response.statusCode == 200) {
          /////check HTTP response status
          LoginResponse res = LoginResponse.fromJson(response.data);

          if (res.code == 200) {
            /////check CRUD status code
            final SharedPreferences storage = await SharedPreferences
                .getInstance(); /////create sharedPreferences Instance
            await storage.setBool(
                Code.LOGIN_STATUS.name, true); // store login state
            await storage.setString(Code.GPT_USER_ID.name,
                res.payLoad!.gptUserId.toString()); //store user id state
            await Factory().saveLoginResponse(jsonEncode(res));
            ////Passing the response as an argument to a method defined in factory that saves the whole response to a state
            //print(res.payLoad!.gptUserId.toString());
            progressDialogListener
                .hide(res); ////stop showing the circular progress bar
          } else if (res.code != null) {
            progressDialogListener.dismiss(res.res);
          } else {
            Factory().showSnackbar(context, 'Something Went wrong');
            progressDialogListener.dismiss(res.res);
          }
        }
      } catch (e) {
        print(e);
        progressDialogListener.dismiss(e.toString());
      }
    }
    debugPrint(email + " " + password + " Logged In ");
  }

  getTopics(ProgressDialogListener progressDialogListener,
      BuildContext context) async {
    if (await Connection().isNotConnected()) {
      Factory().showSnackbar(context, 'NO CONNECTION');
      return;
    }
    final SharedPreferences storage = await SharedPreferences.getInstance();
    var gptUserId = storage.getString(Code.GPT_USER_ID.name);

    progressDialogListener.show();
    var formData = FormData.fromMap({'Gpt_User_Id': gptUserId});
    try {
      final response =
          await dio.post('https://haji.ai:2053/GetTopic', data: formData);

      TopicsResponse res = TopicsResponse.fromJson(response.data);
      // storage.setString(Code.TOPICS.name, jsonEncode(resp))
      progressDialogListener.hide(res);
    } catch (e) {
      print("FOLLOWING ERROR OCCURED: $e");
    }
  }

  getProfile(BuildContext context,
      ProgressDialogListener progressDialogListener) async {
    progressDialogListener.show();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? user =  sharedPreferences.getString(Code.LOGIN_RESPONSE.name);
    LoginResponse data= LoginResponse.fromJson(jsonDecode(user!));
    debugPrint("this is user data: "+user.toString());
    progressDialogListener.hide(data);
  }

}
