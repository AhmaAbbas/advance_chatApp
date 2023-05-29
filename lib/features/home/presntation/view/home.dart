import 'package:chatappadvanced/core/utls/customs/customs_texformfeild.dart';
import 'package:chatappadvanced/features/home/presntation/manger/layoutcubit.dart';
import 'package:chatappadvanced/features/home/presntation/manger/layoutstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var layoutCubit = BlocProvider.of<LayoutCubit>(context)
      ..getmydata()
      ..getusers();
    return SafeArea(
        child: BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: layoutCubit.issearched?CustomTextFormFeild(
                label_text: 'serach',
                onchaged: (value){
                  layoutCubit.searchAboutUser(query: value);
                },
              ):const Text("Chat"),
              actions: [IconButton(onPressed: (){
                layoutCubit.isserch();
              }, icon: layoutCubit.issearched?Icon(Icons.clear):Icon(Icons.search))],
            ),
            body: layoutCubit.users.isEmpty
                ? const Center(
                    child: Text("Net users"),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: layoutCubit.users.isEmpty?const Center(child: CircularProgressIndicator(),):ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 18,
                        ),
                        itemCount: layoutCubit.usersFiltered.isEmpty?layoutCubit.users.length:layoutCubit.usersFiltered.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return Chat(user:layoutCubit.usersFiltered.isEmpty?layoutCubit.users[index]:layoutCubit.usersFiltered[index],);
                              }));
                            },
                            child: item_use(
                              user: layoutCubit.usersFiltered.isEmpty?layoutCubit.users[index].username:layoutCubit.usersFiltered[index].username,
                              imguser: layoutCubit.usersFiltered.isEmpty?layoutCubit.users[index].url:layoutCubit.usersFiltered[index].url,
                            ),
                          );
                        }),
                  ));
      },
    ));
  }
}

class item_use extends StatelessWidget {
  const item_use({
    super.key,
    required this.user,
    required this.imguser
  });
  final String user;
  final String imguser;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(user),
        leading: CircleAvatar(
          radius: 35,
          backgroundImage:
              NetworkImage(imguser),
        ));
  }
}
