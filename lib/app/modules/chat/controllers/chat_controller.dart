import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:toplive/core/services/chat/chat_service.dart';
import 'package:toplive/main.dart';

class ChatController extends GetxController {
  final Channel channel = ChatService.instance.chatClient.channel(
    "messaging",
    id: "toplive",
  );
  @override
  void onInit() {
    super.onInit();
    channel.watch();
  }
}
