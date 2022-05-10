import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:toplive/app/data/models/chat_message_firebase_model.dart';
import 'package:flutter/material.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/styles_manger.dart';

enum userRoles { owner, admin, member, visiter }

class RoomChatService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  CollectionReference rooms = FirebaseFirestore.instance.collection('rooms');

  Future<String> _uploadFile(File image, String fileName) async {
    Reference reference =
        firebaseStorage.ref().child("room_messages/$fileName");
    TaskSnapshot uploadTask = await reference.putFile(image);
    String downloadLink = await uploadTask.ref.getDownloadURL();
    return downloadLink;
  }

  Future<void> updateDataFirestore(String collectionPath, String docPath,
      Map<String, dynamic> dataNeedUpdate) {
    return firebaseFirestore
        .collection(collectionPath)
        .doc(docPath)
        .update(dataNeedUpdate);
  }

  Stream<QuerySnapshot> getChatStream(String roomId, int limit) {
    return firebaseFirestore
        .collection("rooms")
        .doc(roomId)
        .collection("messages")
        // .orderBy("time", descending: true)
        .limit(limit)
        .snapshots();
  }

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>> getNewlyJoinedUsers(
      String roomId, int limit, BuildContext ctx) {
    return firebaseFirestore
        .collection("rooms")
        .doc(roomId)
        .collection("users")
        // .orderBy("time", descending: true)
        .limit(limit)
        .snapshots()
        .listen((event) {
      MotionToast.info(
              height: MediaQuery.of(ctx).size.height * 0.1,
              animationType: ANIMATION.fromLeft,
              enableAnimation: true,
              position: MOTION_TOAST_POSITION.center,
              animationDuration: Duration(milliseconds: 500),
              toastDuration: Duration(seconds: 1),
              description: Text("Joined the room"),
              title: Text(event.docs.map((e) => e.data()['name']).toString()))
          .show(ctx);
    });
  }

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>> getFlyingStream(
      String roomId, int limit, BuildContext ctx) {
    return firebaseFirestore
        .collection("flying_messages")
        .orderBy("time", descending: true)
        .limit(1)
        .snapshots()
        .listen((event) {
      MotionToast.info(
          height: MediaQuery.of(ctx).size.height * 0.1,
          animationType: ANIMATION.fromLeft,
          enableAnimation: true,
          position: MOTION_TOAST_POSITION.center,
          animationCurve: Curves.easeIn,
          animationDuration: Duration(milliseconds: 500),
          toastDuration: Duration(seconds: 1),
          description: Text("Joined the room"),
          title: Text(
            event.docs.map((e) => e.data()['name']).toString(),
            style: getBoldTextStyle(color: ColorsManger.white),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          )).show(ctx);
    });
  }

  Stream<QuerySnapshot> getChatUsersStream(
      String roomId, int limit, BuildContext ctx) {
    return firebaseFirestore
        .collection("rooms")
        .doc(roomId)
        .collection("users")
        .orderBy("lastActiveAt", descending: true)
        .limit(limit)
        .snapshots();
  }

  void addOrUpdateUser(
      {required String roomId, required FirebaseChatUser user}) async {
    DocumentReference documentReference = firebaseFirestore
        .collection("rooms")
        .doc(roomId)
        .collection("users")
        .doc(user.id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
        documentReference,
        user.toMap(),
      );
    });
    print("sent");
  }

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>> getAllSpeakerRequests(
    String roomId,
  ) {
    return firebaseFirestore
        .collection("rooms")
        .doc(roomId)
        .collection("users")
        .where("role", whereIn: ["admin", "owner"])
        .snapshots()
        .listen((event) {
          Get.defaultDialog(
              title: "Speaker request",
              middleText: event.docs.first.data()['name'] +
                  " Has Requested to be a speaker  ",
              textConfirm: "Accept",
              onConfirm: () {},
              textCancel: "Reject",
              onCancel: () => Get.closeAllSnackbars());
          print(event.docs.map((e) {
            print(e.data()['name']);
          }).toString());
        });
  }

  void sendSpeakerRequest(
    String roomId,
    String currentUserId,
  ) {}

  void sendMessage(
      {String? chatMessage,
      required String roomId,
      required String currentUserId,
      File? image,
      String? fileName,
      String? userImage,
      String? userName}) async {
    DocumentReference documentReference = firebaseFirestore
        .collection("rooms")
        .doc(roomId)
        .collection("messages")
        .doc(DateTime.now().millisecondsSinceEpoch.toString());
    String? chatImage;
    if (image != null && fileName != null) {
      chatImage = await _uploadFile(image, fileName);
    }
    FirebaseChatMessageModel messageChat = FirebaseChatMessageModel(
      roomId: currentUserId,
      userImage: userImage,
      userName: userName,
      chatMessage: chatMessage,
      chatImage: chatImage ?? "",
      messageTime: DateTime.now(),
    );

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(
        documentReference,
        messageChat.toMap(),
      );
    });
    print("sent");
  }
}
