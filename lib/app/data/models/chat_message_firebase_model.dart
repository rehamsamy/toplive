import 'dart:convert';

class FirebaseChatUser {
  String id;
  String? name;
  String? image;
  String role;
  DateTime lastActiveAt;
  bool isKicked;
  DateTime? kickedAt;

  bool isSpeaker;
  bool isHere;
  bool isblocked;
  FirebaseChatUser({
    required this.id,
    this.name,
    this.image,
    this.role = "visiter",
    required this.lastActiveAt,
    this.isKicked = false,
    this.kickedAt,
    this.isSpeaker = false,
    this.isHere = false,
    this.isblocked = false,
  });

  FirebaseChatUser copyWith({
    String? id,
    String? name,
    String? image,
    String? role,
    DateTime? lastActiveAt,
    bool? isKicked,
    DateTime? kickedAt,
    bool? isSpeaker,
    bool? isHere,
    bool? isblocked,
  }) {
    return FirebaseChatUser(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      role: role ?? this.role,
      lastActiveAt: lastActiveAt ?? this.lastActiveAt,
      isKicked: isKicked ?? this.isKicked,
      kickedAt: kickedAt ?? this.kickedAt,
      isSpeaker: isSpeaker ?? this.isSpeaker,
      isHere: isHere ?? this.isHere,
      isblocked: isblocked ?? this.isblocked,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    if (name != null) {
      result.addAll({'name': name});
    }
    if (image != null) {
      result.addAll({'image': image});
    }
    result.addAll({'role': role});
    result.addAll({'lastActiveAt': lastActiveAt.millisecondsSinceEpoch});
    result.addAll({'isKicked': isKicked});
    if (kickedAt != null) {
      result.addAll({'kickedAt': kickedAt!.millisecondsSinceEpoch});
    } else {
      result.addAll(
          {'kickedAt': DateTime.parse("1970-01-01").millisecondsSinceEpoch});
    }
    result.addAll({'isSpeaker': isSpeaker});
    result.addAll({'isHere': isHere});
    result.addAll({'isblocked': isblocked});

    return result;
  }

  factory FirebaseChatUser.fromMap(Map<String, dynamic> map) {
    return FirebaseChatUser(
      id: map['id'] ?? '',
      name: map['name'],
      image: map['image'],
      role: map['role'] ?? '',
      lastActiveAt: DateTime.fromMillisecondsSinceEpoch(map['lastActiveAt']),
      isKicked: map['isKicked'] ?? false,
      kickedAt: map['kickedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['kickedAt'])
          : null,
      isSpeaker: map['isSpeaker'] ?? false,
      isHere: map['isHere'] ?? false,
      isblocked: map['isblocked'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseChatUser.fromJson(String source) =>
      FirebaseChatUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FirebaseChatUser(id: $id, name: $name, image: $image, role: $role, lastActiveAt: $lastActiveAt, isKicked: $isKicked, kickedAt: $kickedAt, isSpeaker: $isSpeaker, isHere: $isHere, isblocked: $isblocked)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FirebaseChatUser &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.role == role &&
        other.lastActiveAt == lastActiveAt &&
        other.isKicked == isKicked &&
        other.kickedAt == kickedAt &&
        other.isSpeaker == isSpeaker &&
        other.isHere == isHere &&
        other.isblocked == isblocked;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        role.hashCode ^
        lastActiveAt.hashCode ^
        isKicked.hashCode ^
        kickedAt.hashCode ^
        isSpeaker.hashCode ^
        isHere.hashCode ^
        isblocked.hashCode;
  }
}

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
