import 'dart:io';
import 'package:chatappadvanced/core/utls/AppStrings.dart';
import 'package:chatappadvanced/features/auth/sign_up/presntaion/maneger/register-states.dart';
import 'package:chatappadvanced/features/user/usermodel/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(InitialRegister_states());
  bool inAsyncCall=false;
  String? username;
  String? email;
  String? passwoord;
  File? userimage;
  void register()async {
    try {
      final usercredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: passwoord!,
      );
      if( usercredential.user?.uid != null )
      {
        // save id cache
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setString('userID', usercredential.user!.uid);
        AppStrings.userid = sharedPref.getString('userID');
      }
      String imgurl= await uploadimagetofirestor();
      await senduserdata(email: email!,id:usercredential.user!.uid,imgurl: imgurl,name: username!);
      emit(SuccessRegister_states(massege: "Success Register"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //print('The password provided is too weak.');
        emit(FailureRegister_states(massege:'The password provided is too weak.' ));
      } else if (e.code == 'email-already-in-use') {
        //print('The account already exists for that email.');
        emit(FailureRegister_states(massege:'The account already exists for that email.' ));
      }
    } catch (e) {
      emit(FailureRegister_states(massege:e.toString()));
      //print("error: $e");
    }
  }
  void get_image()async{
    final pickeimage=await ImagePicker().pickImage(source:ImageSource.gallery);
    if(pickeimage!=null)
      {
        userimage=File(pickeimage.path);
        emit(SuccessUserImage_states());
      }
    else
      {
        emit(FailedUserImage_states());
      }
  }
  Future<String> uploadimagetofirestor() async {
    Reference imgref=await FirebaseStorage.instance.ref(basename(userimage!.path));
   await imgref.putFile(userimage!);
   return await imgref.getDownloadURL();
  }
   Future<void> senduserdata({required String name,required String id,
    required String email,required String imgurl})async{
    UserModel user=UserModel(username: name, email: email, url: imgurl, id: id);
    try{
      await FirebaseFirestore.instance.collection("Users").doc(id).set(
          {
            'name':name,
            'imgurl':imgurl,
            'email':email,
            'id':id,
          });
      emit(SuccessSendingUSerData());
    } on FirebaseException catch(e) {
      emit(FailedSendingUSerData(error: e.toString()));
    }

  }

}