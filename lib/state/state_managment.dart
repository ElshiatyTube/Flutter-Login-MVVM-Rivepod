import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterlogintaskbyriverpod/model/user_model.dart';

final userInfo = StateProvider((ref) => UserModel());
final passSuffix = StateProvider((ref) => Icons.remove_red_eye_outlined);
final isPass = StateProvider<bool>((ref) => true);