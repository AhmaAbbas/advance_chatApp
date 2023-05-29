import 'package:chatappadvanced/features/auth/sign_up/presntaion/maneger/register-states.dart';
import 'package:chatappadvanced/features/auth/sign_up/presntaion/maneger/register_cubit.dart';
import 'package:chatappadvanced/features/auth/sign_up/presntaion/view/widgets/photoprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utls/approuters.dart';
import '../../../../../core/utls/customs/customs_button.dart';
import '../../../../../core/utls/customs/customs_texformfeild.dart';
import '../../../../../core/utls/customs/snackbar.dart';
import '../../../../home/presntation/view/home.dart';

class Register_Feilds extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterStates>(
     listener: (context,state){
       if(state is LoadingRegister_states)
         {
           BlocProvider.of<RegisterCubit>(context).inAsyncCall=true;
         }
       else if(state is SuccessRegister_states)
         {
           show_snackbar(context: context,
               content:state.massege! );
           BlocProvider.of<RegisterCubit>(context).inAsyncCall=false;
           GoRouter.of(context).push(AppRouters.Khomechat);
         }
       else if(state is FailureRegister_states)
       {
         show_snackbar(context: context,
             content:state.massege! );
         BlocProvider.of<RegisterCubit>(context).inAsyncCall=false;
       }
     },
      builder:(context,state)
      {
        return  ModalProgressHUD(
          inAsyncCall: BlocProvider.of<RegisterCubit>(context).inAsyncCall,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PhotoProfile(),
              CustomTextFormFeild(
                onchaged: (value)
                {
                  BlocProvider.of<RegisterCubit>(context).username=value;
                },
                label_text: "username",
                icon: Icons.person,
              ),
              CustomTextFormFeild(
                onchaged: (value)
                {
                  BlocProvider.of<RegisterCubit>(context).email=value;
                },
                label_text: "email",
                icon: Icons.email,
              ),
              CustomTextFormFeild(
                onchaged: (value)
                {
                  BlocProvider.of<RegisterCubit>(context).passwoord=value;
                },
                label_text: "passwoord",
                icon: Icons.visibility_off,
                obsecure: true,
              ),
              Custom_Button(
                data: "Sign up",
                ontap: ()
                {
                  BlocProvider.of<RegisterCubit>(context).register();
                  GoRouter.of(context).push(AppRouters.Khomechat);
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(onPressed: (){
                  GoRouter.of(context).push(AppRouters.Klogin);
                }, child: Text("Already have an account")),
              ),
            ],),
        );
      },
    );
  }
}
