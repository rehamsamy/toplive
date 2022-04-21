import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:toplive/app/modules/chat/views/widgets/channel_list.dart';
import 'package:toplive/core/services/chat/chat_service.dart';
import 'package:toplive/main.dart';

import '../controllers/chat_controller.dart';
import 'widgets/channel_page.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return StreamChat(
      client: ChatService.instance.chatClient,
      child: ChannelListPage(),
    );
  }
}
