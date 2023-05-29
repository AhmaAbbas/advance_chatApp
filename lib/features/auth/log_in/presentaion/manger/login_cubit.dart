import 'package:chatappadvanced/features/auth/log_in/presentaion/manger/login_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<Login_states>{
  LoginCubit():super(InitialLogin_states());
  bool loaded = false;
  void login({required email,required passwoord})  async{
    emit(LoadingLogin_states());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: passwoord,
      );
      emit(SuccessLogin_states());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //print('No user found for that email.');
        emit(FailureLogin_states(error: 'No user found for that email'));
      } else if (e.code == 'wrong-password') {
        //print('Wrong password provided for that user.');
        emit(FailureLogin_states(error: 'Wrong password provided for that user'));
      }
    }
  }
  void islodaed(){
    loaded=!loaded;
    emit(SuccessLogin_states());
}

}