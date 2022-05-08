import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:toplive/app/data/models/chat_room_model.dart';
import 'package:toplive/app/modules/home/controllers/home_controller.dart';

import '../../../app/data/models/chat_message_firebase_model.dart';
import '../../../app/data/models/private_chat_message.dart';

class PrivateChatService {
  final String myId;
  final String? hisId;
  PrivateChatService({required this.myId, this.hisId});
  final CollectionReference chatCollection =
      FirebaseFirestore.instance.collection('Chats');

  // stream for msg tab
  Stream<List<ChatRoom>> get getLastChatUser {
    return chatCollection
        .where('keywords', arrayContains: 'id+$myId+')
        .orderBy('lastChat', descending: true)
        .snapshots()
        .map(ChatRoom().fromQuery);
    /*return chatCollection
        .where('userA', isEqualTo: myId)
        .orderBy('lastChat', descending: true)
        .snapshots()
        .map(ChatRoom().fromQuery);*/
  }

  String getRoomId() {
    String roomId;
    int.parse(myId) > int.parse(hisId == null ? '0' : hisId!)
        ? roomId = 'id:$myId+id:$hisId+'
        : roomId = 'id:$hisId+id:$myId+';
    return roomId;
  }

  // stream for live chat
  Stream<List<PrivateMessage>> get getLivePrivateMessage {
    return chatCollection
        .doc(getRoomId())
        .collection('chat')
        .orderBy('time', descending: true)
        .snapshots()
        .map(PrivateMessage().fromQuery);
  }

  //post PrivateMessage <Message>
  Future<void> postPrivateMessage(
      {PrivateMessage? PrivateMessage,
      String? userA,
      String? userB,
      String? aName,
      String? bName,
      String? aImage,
      String? bImage}) async {
    print('55555555555555 $aImage');
    try {
      final snapShot = await chatCollection.doc(getRoomId()).get();
      final newPrivateMessage =
          chatCollection.doc(getRoomId()).collection('chat').doc();
      if (!snapShot.exists) {
        List keyword = ['id+$userA+', 'id+$userB+'];
        final newChatRoom = chatCollection.doc(getRoomId());
        await newChatRoom
            .set(ChatRoom(
                    id: getRoomId(),
                    userA: userA,
                    aImage: aImage,
                    aName: aName,
                    userB: userB,
                    bImage: bImage,
                    bName: bName,
                    keywords: keyword,
                    lastMsg: PrivateMessage!.text,
                    lastSender: PrivateMessage.sender,
                    lastChat: PrivateMessage.time)
                .toJson())
            .then((doc) async {
          await newPrivateMessage
              .set(PrivateMessage.toJson())
              .then((doc) async {
            print('hop ${newPrivateMessage.id}');
            //update the chat room
            await chatCollection.doc(getRoomId()).update({
              'lastChat': PrivateMessage.time,
              'lastMsg': PrivateMessage.text,
              'lastSender': PrivateMessage.sender,
              'aName': aName,
              'bName': bName,
              'aImage': aImage,
              'bImage': bImage
            });
          }).catchError((error) {
            print(error);
          });

          return true;
        }).catchError((error) {
          print(error);
        });
      } else {
        await newPrivateMessage.set(PrivateMessage!.toJson()).then((doc) async {
          print('hop ${newPrivateMessage.id}');

          //update the chat room
          await chatCollection.doc(getRoomId()).update({
            'lastChat': PrivateMessage.time,
            'lastMsg': PrivateMessage.text,
            'lastSender': PrivateMessage.sender,
            'aName': aName,
            'bName': bName,
            'aImage': aImage,
            'bImage': bImage
          });
        }).catchError((error) {
          print(error);
        });
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
