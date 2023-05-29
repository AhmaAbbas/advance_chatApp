

import 'package:chatappadvanced/core/utls/AppStrings.dart';
import 'package:chatappadvanced/features/home/presntation/manger/layoutstates.dart';
import 'package:chatappadvanced/features/user/usermodel/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit():super(InitialLayoutstates());
  UserModel? user;
  void getmydata()async{
    try{
      await FirebaseFirestore.instance.collection('Users').doc(AppStrings.userid!).get().then((value) {
        user=UserModel.fromjson(value.data()!);
      });
      emit(GetMyDataSuccessState());
    }on FirebaseException catch(e){
      emit(GetMyDataFailuresState());
    }
  }
  List<UserModel> users = [];
  void getusers() async{
    users.clear();
    emit(GetUsersLoadingState());
    try{
      await FirebaseFirestore.instance.collection('Users').get().then((value) {
        users.clear();
        for(var item in value.docs){
          if(item.id!=AppStrings.userid){
            users.add(UserModel.fromjson(item.data()!));
          }
        }
      });
      emit(GetUsersDataSuccessState());
    }on FirebaseException catch(e){
      users = [];
      emit(GetUsersDataFailuresState());
    }
  }
  List<UserModel> usersFiltered = [];
  void searchAboutUser({required String query}){
    usersFiltered = users.where((element) => element.username!.toLowerCase().startsWith(query.toLowerCase())).toList();
    emit(FilteredUsersSuccessState());
  }
  bool issearched=false;
  void isserch(){
    issearched=!issearched;
    if( issearched == false ) usersFiltered.clear();
    emit(SearchState());
  }
}