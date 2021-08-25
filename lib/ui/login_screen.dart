import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterlogintaskbyriverpod/model/user_model.dart';
import 'package:flutterlogintaskbyriverpod/shared/commponents/commponents.dart';
import 'package:flutterlogintaskbyriverpod/shared/validator.dart';
import 'package:flutterlogintaskbyriverpod/state/state_managment.dart';
import 'package:flutterlogintaskbyriverpod/ui/singup_screen.dart';
import 'package:flutterlogintaskbyriverpod/viewmodels/login/login_view_model_imp.dart';
import 'package:flutterlogintaskbyriverpod/viewmodels/signup/singup_view_model_imp.dart';

class LoginScreen extends ConsumerWidget {
  final signUpViewModel = SignUpViewModelImp();
  final loginViewModel = LoginViewModelImp();

  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: true,
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black,
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Welcome back',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.grey,
                        fontSize: 25.0,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 150,
                        padding: const EdgeInsets.all(24),
                        child: Image.asset('assets/images/logonew.jpg'),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    sharedFormField(
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      validator: Validator.validateEmail,
                      label: 'Email address',
                      prefixIcon: Icons.email_outlined,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    sharedFormField(
                        controller: passController,
                        textInputType: TextInputType.visiblePassword,
                        isPassword: watch(isPass).state,
                        onSubmit: (value) {
                          if (formKey.currentState.validate()) {
                            loginIn(context);
                          }
                        },
                        validator: Validator.validatePassword,
                        label: 'Password',
                        prefixIcon: Icons.lock_outline_rounded,
                        suffixIcon: watch(passSuffix).state,
                        suffixIconPressed: () {
                          signUpViewModel.changePassVisibility(context);
                        }),
                    const SizedBox(
                      height: 15.0,
                    ),

                    defaultButton(
                        function: () {
                          if (formKey.currentState.validate()) {
                           loginIn(context);
                          }
                        },
                        text: 'Login',
                        isUpperCase: true,
                        radius: 10.0),

                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have account?"),
                        defaultTextButton(
                            textStyle: const TextStyle(fontSize: 18.0),
                            text: 'Create one',
                            function: () {
                              navigateTo(context, SignUpScreen());
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginIn(context) {
    var userModel = UserModel(email: emailController.text);
    loginViewModel.uerLogin(context, userModel);
  }


}
