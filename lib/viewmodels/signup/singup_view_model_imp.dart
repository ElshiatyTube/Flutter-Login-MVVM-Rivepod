import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterlogintaskbyriverpod/model/user_model.dart';
import 'package:flutterlogintaskbyriverpod/shared/commponents/commponents.dart';
import 'package:flutterlogintaskbyriverpod/state/state_managment.dart';
import 'package:flutterlogintaskbyriverpod/ui/home_screen.dart';
import 'package:flutterlogintaskbyriverpod/viewmodels/signup/singup_view_model.dart';

class SignUpViewModelImp implements SignUpViewModel{
  @override
  void userSignUp(BuildContext context, UserModel userModel) {
    context.read(userInfo).state = userModel;
    navigateTo(context, HomeScreen(isSignUp: true));

  }

  @override
  void changePassVisibility(BuildContext context) {
    context.read(isPass).state =  !context.read(isPass).state;
    context.read(passSuffix).state = context.read(isPass).state ? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined;
  }

}