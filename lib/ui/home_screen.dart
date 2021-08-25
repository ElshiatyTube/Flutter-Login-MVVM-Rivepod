import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterlogintaskbyriverpod/state/state_managment.dart';

class HomeScreen extends ConsumerWidget {
   bool isSignUp;


   HomeScreen({@required this.isSignUp});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var userInfoWatch = watch(userInfo).state;
   return Scaffold(
     appBar: AppBar(),
     body:  Center(child: isSignUp ? Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text('Hello ${userInfoWatch.name} From Sign Up Page'),
         Text('Your Email: ${userInfoWatch.email}'),
         Text('Your Phone: ${userInfoWatch.phone}'),
         Text('Your BirthDate: ${userInfoWatch.birthdate}')
       ],
     ) : Text('Welcome back ${userInfoWatch.email} From Login Page')),
   );
  }


}
