import 'package:chatappadvanced/core/utls/AppStrings.dart';
import 'package:chatappadvanced/features/home/presntation/manger/chat_cubit.dart';
import 'package:chatappadvanced/features/home/presntation/manger/chat_states.dart';
import 'package:chatappadvanced/features/user/usermodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/messegemodel.dart';
import 'chatpuuble1.dart';
import 'chatpuuble2.dart';

class Chat extends StatelessWidget {
   Chat({Key? key,required this.user}) : super(key: key);
  TextEditingController chat_controller=TextEditingController();
  final UserModel user;
   final controller =ScrollController();
   List<MessageModel> messeges=[];
  @override
  Widget build(BuildContext context) {
    var chatcubit=BlocProvider.of<ChatCubit>(context)..getMessages(receiverID: user.id);
    return Scaffold(
      appBar: AppBar(title: Text(user.username!),elevation:0,automaticallyImplyLeading: false,),
      body: Column(children: [
        Expanded(child: BlocConsumer<ChatCubit,ChatStats>(
          listener: (context,state) {
            if(state is GetMessagesSuccessState)
              {
                messeges=state.messeges;
                chat_controller.clear();
              }
          },
          builder:(context,state){

            return state is GetMessagesLoadingState?const Center(child: CircularProgressIndicator(),):ListView.builder(
                //reverse: true,
                controller: controller,
              itemCount: chatcubit.messages.length,
                itemBuilder: (context,index){
              return chatcubit.messages[index].id==AppStrings.userid?chatbuble(massege: chatcubit.messages[index]):chatbuble2(massege: chatcubit.messages[index]);
            });
          } ,
        )),
        Container(
          padding: EdgeInsets.all(16),
          child: TextField(
            controller:chat_controller ,
            onSubmitted: (data){
              chat_controller.clear();
              controller.animateTo(
                  0,
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn);
            },
            decoration: InputDecoration(
                suffixIcon: IconButton(icon: Icon(Icons.send),onPressed: (){
                  chatcubit.sendmessege(messege: chat_controller.text, reciverid: user.id);
                  chatcubit.getMessages(receiverID: user.id);
                },),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color: Colors.blue
                    )
                )
            ),
          ),
        )
      ],),
    );
  }
}
