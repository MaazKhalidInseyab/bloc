
import 'package:bloc/Ui/Profile/ProfileScreen.dart';
import 'package:bloc/Ui/Topics/TopicsScreen.dart';
import 'package:flutter/material.dart';

import '../../Factory.dart';

class HomeBloc {
  BuildContext context;

  HomeBloc(this.context);

  topicsNavigator() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Topics(),
        ));
  }

  profileNavigator() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        ));
  }
  ChatsNavigator() {
    Factory().showSnackbar(context, 'Please Select a Topic from the Pink Card');
  }
}
