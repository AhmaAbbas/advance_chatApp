// import 'package:flutter/material.dart';
// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chat with John'),
//       ),
//       body: ListView.builder(
//         itemCount: messages.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             padding:
//             const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
//             child: Align(
//               alignment: (messages[index].messageType == "receiver"
//                   ? Alignment.topLeft
//                   : Alignment.topRight),
//               child: Row(
//                 children: [
//                   messages[index].messageType == "receiver"
//                       ? Container(
//                     width: 50.0,
//                     height: 55.0,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: NetworkImage(
//                             'https://cdn.britannica.com/35/238335-050-2CB2EB8A/Lionel-Messi-Argentina-Netherlands-World-Cup-Qatar-2022.jpg'),
//                       ),
//                     ),
//                   )
//                       : const Spacer(),
//                   17.pw,
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: (messages[index].messageType == "receiver"
//                           ? Colors.grey.shade200
//                           : LColorsManager.primary),
//                     ),
//                     padding:
//                     const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//                     child: Text(
//                       messages[index].messageContent,
//                       style: TextStyle(
//                           fontSize: 15,
//                           color: (messages[index].messageType == "receiver"
//                               ? LColorsManager.black
//                               : LColorsManager.white)),
//                     ),
//                   ),
//                   7.pw,
//                   messages[index].messageType == "receiver"
//                       ? Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       20.ph,
//                       const Icon(
//                         size: 20,
//                         Icons.flag,
//                         color: LColorsManager.red,
//                       ),
//                       Text(
//                         messages[index].messageType,
//                         style: const TextStyle(
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   )
//                       : 0.pw,
//
//                   ////
//                 ],
//               ),
//             ),
//           );
//           //   Container(
//           //   padding: EdgeInsets.all(16.0),
//           //   child: Column(
//           //     crossAxisAlignment: CrossAxisAlignment.start,
//           //     children: [
//           //       Row(
//           //         crossAxisAlignment: CrossAxisAlignment.center,
//           //         children: [
//           //           Container(
//           //             width: 50.0,
//           //             height: 55.0,
//           //             decoration: const BoxDecoration(
//           //               shape: BoxShape.circle,
//           //               image: DecorationImage(
//           //                 fit: BoxFit.cover,
//           //                 image: NetworkImage(
//           //                     'https://cdn.britannica.com/35/238335-050-2CB2EB8A/Lionel-Messi-Argentina-Netherlands-World-Cup-Qatar-2022.jpg'),
//           //               ),
//           //             ),
//           //           ),
//           //           17.pw,
//           //           Expanded(
//           //             child: Container(
//           //               padding: EdgeInsets.all(8),
//           //               decoration: BoxDecoration(
//           //                 color: LColorsManager.white4,
//           //                 borderRadius: BorderRadius.circular(8.0),
//           //               ),
//           //               child: Text(messages[index].senderText),
//           //             ),
//           //           ),
//           //           7.pw,
//
//           //       35.ph,
//           //       Row(
//           //         crossAxisAlignment: CrossAxisAlignment.center,
//           //         children: [
//           //
//           //
//           //           Column(crossAxisAlignment: CrossAxisAlignment.start,
//           //             children: [
//           //               20.ph,
//           //
//           //               Text(
//           //                 messages[index].senderTimestamp,
//           //                 style: const TextStyle(
//           //                   color: Colors.grey,
//           //                 ),
//           //               ),
//           //             ],
//           //           ),Expanded(
//           //             child: Container(
//           //               padding: EdgeInsets.all(8),
//           //               decoration: BoxDecoration(
//           //                 color: LColorsManager.white4,
//           //                 borderRadius: BorderRadius.circular(8.0),
//           //               ),
//           //               child: Text(messages[index].senderText),
//           //             ),
//           //           ),
//           //         ],
//           //       ),
//           //     ],
//           //   ),
//           // );
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 16, right: 16, bottom: 14),
//           child: Container(
//             clipBehavior: Clip.hardEdge,
//             padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: LColorsManager.white4,
//             ),
//             child: Row(
//               children: [
//                 Flexible(
//                   child: TextField(
//                     focusNode: FocusNode(),
//                     decoration: const InputDecoration(
//                       fillColor: LColorsManager.white4,
//                       hintText: 'Add comment...',
//                       hintStyle: TextStyle(color: Colors.grey),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () async {},
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 9),
//                     child: SvgPicture.asset(IconsManager.emoji),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () async {},
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 9),
//                     child: SvgPicture.asset(IconsManager.addComment),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ChatMessage {
//   String messageContent;
//   String messageType;
//   ChatMessage({required this.messageContent, required this.messageType});
// }

import 'package:chatappadvanced/features/home/model/messegemodel.dart';

List<MessageModel> messages = [
  MessageModel(content: "Hello, Will", id: "receiver"),
  MessageModel(content: "How have you been?", id: "receiver"),
  MessageModel(
      content: "Hey Kriss, I am doing fine dude. wbu?",
      id: "sender"),
  MessageModel(content: "ehhhh, doing OK.", id: "receiver"),
  MessageModel(
      content: "Is there any thing wrong?", id: "sender"),
];