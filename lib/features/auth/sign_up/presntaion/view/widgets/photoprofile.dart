import 'dart:io';

import 'package:chatappadvanced/features/auth/sign_up/presntaion/maneger/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoProfile extends StatelessWidget {
  const PhotoProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.of<RegisterCubit>(context).userimage!=null?
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: FileImage(BlocProvider.of<RegisterCubit>(context).userimage!),
        ),
        SizedBox(height: 15,),
        TextButton(onPressed: (){
          BlocProvider.of<RegisterCubit>(context).get_image();
    }, child: Text("change photo"))

      ],
    ):
    OutlinedButton(
      onPressed: (){
        BlocProvider.of<RegisterCubit>(context).get_image();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image,color: Colors.green,),
          SizedBox(width: 15,),
          Text("select photo"),
        ],
      ),
    )
    ;
  }
}
