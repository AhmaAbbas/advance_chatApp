import 'package:chatappadvanced/core/utls/AppStrings.dart';
import 'package:chatappadvanced/features/home/model/messegemodel.dart';
import 'package:flutter/material.dart';

Align chatbuble({required MessageModel massege}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      padding: EdgeInsets.only(left: 10,top: 32,bottom: 32,right: 16),
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration: BoxDecoration(
          color: AppStrings.kprimarycolor,
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(25),
            topRight:Radius.circular(25),
            bottomRight:Radius.circular(25),
          )
      ),
      child: Text('${massege.content.toString()}',style: TextStyle(fontSize: 15,color: Colors.white,),),
    ),
  );
}