import 'package:chatappadvanced/core/utls/approuters.dart';
import 'package:chatappadvanced/features/auth/log_in/presentaion/manger/login_cubit.dart';
import 'package:chatappadvanced/features/auth/log_in/presentaion/manger/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utls/customs/customs_button.dart';
import '../../../../../core/utls/customs/customs_texformfeild.dart';
import '../../../../../core/utls/customs/snackbar.dart';
import 'login_feilds.dart';

class Log_in extends StatelessWidget {
  Log_in({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LoginFeilds(),
    );
  }


}
