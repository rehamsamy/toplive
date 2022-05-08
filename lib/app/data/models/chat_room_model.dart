import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoom {
  String? id, userA, userB, aName, bName, aImage, bImage, lastMsg, lastSender;
  DateTime? lastChat;
  int? aUnReadCount, bUnReadCount;
  List? keywords;

  ChatRoom(
      {this.id,
      this.userA,
      this.keywords,
      this.userB,
      this.lastChat,
      this.aImage,
      this.aName,
      this.bImage,
      this.bName,
      this.lastMsg,
      this.lastSender,
      this.aUnReadCount,
      this.bUnReadCount});

  ChatRoom.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userA = json['userA'],
        userB = json['userB'],
        lastMsg = json['lastMsg'],
        lastSender = json['lastSender'],
        keywords = json['keywords'],
        aName = json['aName'],
        bName = json['bName'],
        aImage = json['aImage'],
        bImage = json['bImage'],
        aUnReadCount = json['aUnReadCount'],
        bUnReadCount = json['bUnReadCount'],
        lastChat = json['lastChat'].toDate();

  List<ChatRoom> fromQuery(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return ChatRoom(
        userA: doc.get('userA') ?? '',
        userB: doc.get('userB') ?? '',
        keywords: doc.get('keywords') ?? [],
        aName: doc.get('aName') ?? '',
        lastSender: doc.get('lastSender') ?? '',
        lastMsg: doc.get('lastMsg') ?? '',
        bName: doc.get('bName') ?? '',
        aImage: doc.get('aImage') ?? '',
        bImage: doc.get('bImage') ?? '',
        lastChat: doc.get('lastChat') != null
            ? doc.get('lastChat').toDate()
            : DateTime.now(),
        aUnReadCount: doc.get('aUnReadCount') ?? 0,
        bUnReadCount: doc.get('bUnReadCount') ?? 0,
      );
    }).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userA": userA,
      "userB": userB,
      "aName": aName,
      "keywords": keywords,
      "bName": bName,
      "lastSender": lastSender,
      "lastMsg": lastMsg,
      "aImage": aImage,
      "bImage": bImage,
      "lastChat": lastChat,
      "aUnReadCount": aUnReadCount,
      "bUnReadCount": bUnReadCount
    };
  }
}
