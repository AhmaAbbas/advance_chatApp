import 'package:chatappadvanced/features/home/presntation/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utls/approuters.dart';
import '../../../../../core/utls/customs/customs_button.dart';
import '../../../../../core/utls/customs/customs_texformfeild.dart';
import '../../../../../core/utls/customs/snackbar.dart';
import '../manger/login_cubit.dart';
import '../manger/login_states.dart';

class LoginFeilds extends StatelessWidget {
   LoginFeilds({Key? key}) : super(key: key);
   TextEditingController email=TextEditingController();
   TextEditingController passwoord=TextEditingController();
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: BlocConsumer<LoginCubit, Login_states>(
          listener: (context, state) {
            if (state is SuccessLogin_states) {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
              show_snackbar(content: "Sign up Successfully", context: context);
            } else if (state is LoadingLogin_states) {

            } else if (state is FailureLogin_states) {
              show_snackbar(content: state.error.toString(), context: context);
            }
          },
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFormFeild(
                onchaged: (value) {
                  email.text=value;
                },
                label_text: "email",
                icon: Icons.email,
              ),
              CustomTextFormFeild(
                onchaged: (value) {
                  passwoord.text=value;
                },
                label_text: "passwoord",
                icon: Icons.visibility_off,
                obsecure: true,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(onPressed: (){
                  GoRouter.of(context).push(AppRouters.Kregister);
                }, child: Text("I don't have an account")),
              ),
              Custom_Button(
                data: "Sign up",
                ontap: () {
                  BlocProvider.of<LoginCubit>(context).login(email: email.text,passwoord: passwoord.text);
                },
              ),
            ],
          ),
        ),
      );
  }
}
