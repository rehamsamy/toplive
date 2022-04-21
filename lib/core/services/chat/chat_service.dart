import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatService {
  ChatService._chatInstance();

  static final ChatService instance = ChatService._chatInstance();

  final chatClient = StreamChatClient(
    "ewmj4qnubjdk",
    logLevel: Level.INFO,
  );
}
