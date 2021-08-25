import 'package:flutter/cupertino.dart';
import 'package:flutterlogintaskbyriverpod/model/user_model.dart';

abstract class SignUpViewModel {
  void userSignUp(BuildContext context,UserModel userModel);
  void changePassVisibility(BuildContext context);
}