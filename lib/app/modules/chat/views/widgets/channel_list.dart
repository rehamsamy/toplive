import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:flutter/material.dart';
import 'package:toplive/app/modules/chat/views/widgets/channel_page.dart';

class ChannelListPage extends StatelessWidget {
  const ChannelListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChannelsBloc(
        child: ChannelListView(
          swipeToAction: true,
          /*  filter: Filter.in_(
            'members',
            [StreamChat.of(context).currentUser!.id],
          ),*/
          //sort: const [SortOption('last_message_at')],
          limit: 20,
          channelWidget: const ChannelPage(),
        ),
      ),
    );
  }
}
