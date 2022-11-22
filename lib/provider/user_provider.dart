import 'package:flutter/material.dart';

import '../features/auth/models/user.dart';

class UserProvider extends ChangeNotifier{

  User _user = User("", "", "", "", "", "", "");

  User get user => _user;

  void setUser(String user){
    _user = User.fromJson(user);
  }

}