import 'package:chatappadvanced/features/auth/sign_up/presntaion/view/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/log_in/presentaion/view/log_in.dart';
import '../../features/auth/sign_up/presntaion/view/register_feilds.dart';
import '../../features/home/presntation/view/home.dart';

abstract class AppRouters{
  static String  Klogin='/';
  static String  Kregister='/register';
  static String  Khomechat='/homechat';
  static final router=GoRouter(routes: [
    GoRoute(
      path: Klogin,
      builder: (context, state)=>Log_in(),
  ),
    GoRoute(
      path: Kregister,
      builder: (context, state)=>Register(),
    ),
    GoRoute(
      path:Khomechat,
      builder: (context, state)=>Home(),
    ),
  ]);
}