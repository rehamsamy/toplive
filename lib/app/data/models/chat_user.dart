
class ChatUser {
  final String id;
  final String photoUrl;
  final String displayName;
  final String phoneNumber;
  final String aboutMe;

//<editor-fold desc="Data Methods">

  const ChatUser({
    required this.id,
    required this.photoUrl,
    required this.displayName,
    required this.phoneNumber,
    required this.aboutMe,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatUser &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          photoUrl == other.photoUrl &&
          displayName == other.displayName &&
          phoneNumber == other.phoneNumber &&
          aboutMe == other.aboutMe);

  @override
  int get hashCode =>
      id.hashCode ^
      photoUrl.hashCode ^
      displayName.hashCode ^
      phoneNumber.hashCode ^
      aboutMe.hashCode;

  @override
  String toString() {
    return 'ChatUser{' ' id: $id,' ' photoUrl: $photoUrl,' ' displayName: $displayName,'
        ' phoneNumber: $phoneNumber,'
        ' aboutMe: $aboutMe,'
        '}';
  }

  ChatUser copyWith({
    String? id,
    String? photoUrl,
    String? displayName,
    String? phoneNumber,
    String? aboutMe,
  }) {
    return ChatUser(
      id: id ?? this.id,
      photoUrl: photoUrl ?? this.photoUrl,
      displayName: displayName ?? this.displayName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      aboutMe: aboutMe ?? this.aboutMe,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'photoUrl': photoUrl,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'aboutMe': aboutMe,
    };
  }

  factory ChatUser.fromMap(Map<String, dynamic> map) {
    return ChatUser(
      id: map['id'] as String,
      photoUrl: map['photoUrl'] as String,
      displayName: map['displayName'] as String,
      phoneNumber: map['phoneNumber'] as String,
      aboutMe: map['aboutMe'] as String,
    );
  }

//</editor-fold>
}