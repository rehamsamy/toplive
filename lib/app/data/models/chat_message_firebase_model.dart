import 'dart:convert';

class FirebaseChatMessageModel {
  String? roomId;
  String? userImage;
  String? userName;
  String? chatMessage;
  String? chatImage;
  DateTime? messageTime;
  FirebaseChatMessageModel({
    this.roomId,
    this.userImage,
    this.userName,
    this.chatMessage,
    this.chatImage,
    this.messageTime,
  });

  FirebaseChatMessageModel copyWith({
    String? roomId,
    String? userImage,
    String? userName,
    String? chatMessage,
    String? chatImage,
    DateTime? messageTime,
  }) {
    return FirebaseChatMessageModel(
      roomId: roomId ?? this.roomId,
      userImage: userImage ?? this.userImage,
      userName: userName ?? this.userName,
      chatMessage: chatMessage ?? this.chatMessage,
      chatImage: chatImage ?? this.chatImage,
      messageTime: messageTime ?? this.messageTime,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (roomId != null) {
      result.addAll({'id': roomId});
    }
    if (userImage != null) {
      result.addAll({'image': userImage});
    }
    if (userName != null) {
      result.addAll({'name': userName});
    }
    if (chatMessage != null) {
      result.addAll({'message': chatMessage});
    }
    if (chatImage != null) {
      result.addAll({'chat_image': chatImage});
    }
    if (messageTime != null) {
      result.addAll({'time': messageTime!.millisecondsSinceEpoch.toString()});
    }

    return result;
  }

  factory FirebaseChatMessageModel.fromMap(Map<String, dynamic> map) {
    return FirebaseChatMessageModel(
      roomId: map['id'],
      userImage: map['image'],
      userName: map['name'],
      chatMessage: map['message'],
      chatImage: map['chat_image'],
      messageTime: map['time'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['messageTime'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseChatMessageModel.fromJson(String source) =>
      FirebaseChatMessageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FirebaseChatMessageModel(roomId: $roomId, userImage: $userImage, userName: $userName, chatMessage: $chatMessage, chatImage: $chatImage, messageTime: $messageTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FirebaseChatMessageModel &&
        other.roomId == roomId &&
        other.userImage == userImage &&
        other.userName == userName &&
        other.chatMessage == chatMessage &&
        other.chatImage == chatImage &&
        other.messageTime == messageTime;
  }

  @override
  int get hashCode {
    return roomId.hashCode ^
        userImage.hashCode ^
        userName.hashCode ^
        chatMessage.hashCode ^
        chatImage.hashCode ^
        messageTime.hashCode;
  }
}
