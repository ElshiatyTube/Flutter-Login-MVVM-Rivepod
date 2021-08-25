import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterlogintaskbyriverpod/model/user_model.dart';
import 'package:flutterlogintaskbyriverpod/shared/commponents/commponents.dart';
import 'package:flutterlogintaskbyriverpod/state/state_managment.dart';
import 'package:flutterlogintaskbyriverpod/ui/home_screen.dart';

import 'login_view_model.dart';

class LoginViewModelImp implements LoginViewModel{
  @override
  void uerLogin(BuildContext context, UserModel userModel) {
    context.read(userInfo).state = userModel;
    navigateTo(context, HomeScreen(isSignUp: false));

  }

}