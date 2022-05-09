import 'package:flutter/material.dart';
import 'package:toplive/app/data/models/private_chat_message.dart';
import 'package:bubble/bubble.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/font_manger.dart';

import '../../../../../core/widgets/image_viewer.dart';

class MessageBuilder extends StatelessWidget {
  final PrivateMessage? msg;
  final bool isMe;

  const MessageBuilder({this.msg, this.isMe = true});

  @override
  Widget build(BuildContext context) {
    return isMe
        ? Bubble(
            margin: const BubbleEdges.only(top: 10),
            alignment: Alignment.topRight,
            padding: const BubbleEdges.only(left: 15, right: 15),
            nip: BubbleNip.rightTop,
            color: ColorsManger.grey2,
            child: msgBuilder(
                context: context, msg: msg as PrivateMessage, isMe: true),
          )
        : Bubble(
            margin: const BubbleEdges.only(top: 10),
            alignment: Alignment.topLeft,
            padding: const BubbleEdges.only(left: 15, right: 15),
            nip: BubbleNip.leftTop,
            child: msgBuilder(
                context: context, msg: msg as PrivateMessage, isMe: false),
          );
  }

  Widget msgBuilder(
      {required PrivateMessage msg,
      bool? isMe,
      required BuildContext context}) {
    //notify user when he get a new message
    //if (!isMe) {}

    int hour = msg.time!.hour;
    String amPm = '';
    if (msg.time!.hour == 0) {
      hour = 12;
      amPm = 'AM';
    } else if (msg.time!.hour == 12) {
      amPm = 'PM';
    } else if (msg.time!.hour > 12) {
      hour = msg.time!.hour - 12;
      amPm = 'PM';
    } else {
      amPm = 'AM';
    }
    if (msg.image == null && msg.text != null && msg.video == null) {
      print('${msg.text} ${msg.video} ${msg.image}');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (msg.image == null || msg.image == 'null') &&
                msg.text != null &&
                (msg.video == null || msg.video == 'null')
            ? Text(
                '${msg.text}',
                style: TextStyle(
                    fontSize: FontSize.large, fontWeight: FontWeight.w500),
              )
            : const SizedBox(),
        msg.image != null &&
                (msg.text == null || msg.text == 'null') &&
                (msg.video == null || msg.video == 'null')
            ? ImageViewer(
                viewImg: true,
                imageUrl: msg.image.toString(),
              )
            : const SizedBox(),
        const SizedBox(
          height: 1,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isMe == true
                ? Icon(
                    Icons.check,
                    //    size: Dimensions.getDesirableWidth(4),
                    color: Colors.grey,
                  )
                : const SizedBox(),
            const SizedBox(
              width: 2,
            ),
            Text(
              '$hour:${msg.time!.minute} $amPm',
              style: TextStyle(
                  //   fontSize: Dimensions.getDesirableWidth(3),
                  color: Colors.grey,
                  fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    );
  }
}
