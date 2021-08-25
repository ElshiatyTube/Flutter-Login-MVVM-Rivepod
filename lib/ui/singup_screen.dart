import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterlogintaskbyriverpod/model/user_model.dart';
import 'package:flutterlogintaskbyriverpod/shared/commponents/commponents.dart';
import 'package:flutterlogintaskbyriverpod/shared/validator.dart';
import 'package:flutterlogintaskbyriverpod/state/state_managment.dart';
import 'package:flutterlogintaskbyriverpod/viewmodels/signup/singup_view_model_imp.dart';

class SignUpScreen extends StatelessWidget {
  final signUpViewModel = SignUpViewModelImp();

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var phoneController = TextEditingController();
  var birthController = TextEditingController();

  @override
  Widget build(BuildContext context) {

   //var userInfoWatch = watch(userInfo).state;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          ///    flex: 2,
                          child: Text(
                            'Sing Up',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                              color: Colors.black,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        Expanded(
                          /// flex: 4,
                          child: Container(
                            height: 120,
                            padding: const EdgeInsets.all(18.0),
                            child: Image.asset('assets/images/logonew.jpg'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    sharedFormField(
                      controller: nameController,
                      textInputType: TextInputType.name,
                      validator: Validator.validateName,
                      label: 'Name',
                      prefixIcon: Icons.account_circle_outlined,
                    ),
                    const SizedBox(
                      height: 15.0,
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
                    Consumer(
                      builder: (context, watch, child) {
                        return sharedFormField(
                            controller: passController,
                            textInputType: TextInputType.visiblePassword,
                            isPassword: watch(isPass).state,
                            onSubmit: (value) {},
                            validator:Validator.validatePassword,
                            label: 'Password',
                            prefixIcon: Icons.lock_open,
                            suffixIcon: watch(passSuffix).state,
                            suffixIconPressed: (){
                                signUpViewModel.changePassVisibility(context);
                            }
                        );
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    sharedFormField(
                        controller: birthController,
                        textInputType: TextInputType.text,
                        validator: Validator.validateDate,
                        label: 'BirthDate',
                        prefixIcon: Icons.date_range,
                        readOnly: true,
                        suffixIcon: Icons.edit,
                        suffixIconPressed: () {
                          DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime(1930, 1, 1),
                              maxTime: DateTime.now(),
                              onConfirm: (date){
                                birthController.text = '${date.year}-${date.month}-${date.day}';
                                print('${date}');
                              }
                          );
                        }),
                    const SizedBox(
                      height: 15.0,
                    ),
                    sharedFormField(
                      controller: phoneController,
                      textInputType: TextInputType.phone,
                      validator: Validator.validatePhone,
                      label: 'Phone number',
                      prefixIcon: Icons.phone,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    defaultButton(
                        function: () {
                          if (formKey.currentState.validate()) {
                            var userModel = UserModel(birthdate: birthController.text,uId: UniqueKey().hashCode.toString(),email: emailController.text,
                            password: passController.text,phone: phoneController.text,name: nameController.text);
                            signUpViewModel.userSignUp(context, userModel);
                          }
                        },
                        text: 'Sign Up',
                        isUpperCase: true,
                        radius: 10.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
