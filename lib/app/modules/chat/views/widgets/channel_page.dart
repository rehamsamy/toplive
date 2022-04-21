import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../../../../../core/services/chat/chat_service.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  @override
  void initState() {
    super.initState();
    var channel = ChatService.instance.chatClient.channel(
      "messaging",
      id: "NewChannel",
    );
    // channel.watch();
  }

  @override
  Widget build(BuildContext context) {
    return 
       Column(
        children: const <Widget>[
          Expanded(
            child: MessageListView(),
          ),
          MessageInput(),
        ],
      
    );
  }
}
