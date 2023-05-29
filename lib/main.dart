import 'package:chatappadvanced/core/utls/AppStrings.dart';
import 'package:chatappadvanced/core/utls/approuters.dart';
import 'package:chatappadvanced/features/auth/sign_up/presntaion/maneger/register_cubit.dart';
import 'package:chatappadvanced/features/home/presntation/manger/chat_cubit.dart';
import 'package:chatappadvanced/features/home/presntation/manger/layoutcubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/auth/log_in/presentaion/manger/login_cubit.dart';
import 'features/auth/sign_up/presntaion/view/register.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPref = await SharedPreferences.getInstance();
  AppStrings.userid = sharedPref.getString('userID');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp() );
}
class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>RegisterCubit()),
        BlocProvider(create: (context)=>LoginCubit()),
        BlocProvider(create: (context)=>LayoutCubit()),
        BlocProvider(create: (context)=>ChatCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouters.router,
      ),
    );
  }
}

