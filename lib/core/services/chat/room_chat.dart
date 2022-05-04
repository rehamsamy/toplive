import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:toplive/app/data/models/chat_message_firebase_model.dart';

class RoomChatService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  CollectionReference rooms = FirebaseFirestore.instance.collection('rooms');

  Future<String> _uploadFile(File image, String fileName) async {
    Reference reference = firebaseStorage.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(image);
    String downloadLink = await uploadTask.snapshot.ref.getDownloadURL();
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
        //.orderBy("timestamp", descending: true)
        .limit(limit)
        .snapshots();
  }

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
      chatImage: chatImage,
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
