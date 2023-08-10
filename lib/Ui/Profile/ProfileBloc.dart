import 'package:bloc/DataProvider.dart';
import 'package:bloc/Factory.dart';
import 'package:bloc/Models/loginResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBloc {
  BuildContext context;

  ProfileBloc(this.context);

  final profile = BehaviorSubject<PayLoad>(
  );

   getProfileData()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    LoginResponse user =  DataProvider().getProfile(sharedPreferences);
    if (user.payLoad != null) {
      profile.sink.add(user.payLoad!);
    }
  }
}
