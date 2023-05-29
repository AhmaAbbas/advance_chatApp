import 'package:chatappadvanced/features/auth/sign_up/presntaion/maneger/register_cubit.dart';
import 'package:chatappadvanced/features/auth/sign_up/presntaion/view/register_feilds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utls/customs/customs_texformfeild.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Register")),
          body:Register_Feilds(),
        ),
      ),
    );
  }
}