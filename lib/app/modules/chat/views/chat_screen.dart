import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toplive/core/constants/app_const.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/font_manger.dart';

import '../../../../core/services/chat/private_chat.dart';
import '../../../data/models/private_chat_message.dart';
import 'widgets/attachment.dart';
import 'widgets/build_msg.dart';

class ChatScreen extends StatelessWidget {
  String myId, hisId, hisName, hisImage, myName, myImage;

  ChatScreen(
      {this.myId = '',
      this.hisId = '',
      this.hisName = '',
      this.hisImage = '',
      this.myImage = '',
      this.myName = ''});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<PrivateMessage>>.value(
      value: PrivateChatService(
        hisId: hisId,
        myId: myId,
      ).getLivePrivateMessage,
      initialData: [],
      child: ChatScreenX(
        myId: myId,
        hisId: hisId,
        hisName: hisName,
        myImage: myImage,
        myName: myName,
        hisImage: hisImage,
      ),
    );
  }
}

class ChatScreenX extends StatelessWidget {
  String myId, hisId, hisName, hisImage, myName, myImage;

  ChatScreenX(
      {this.myId = '',
      this.hisId = '',
      this.hisName = '',
      this.hisImage = '',
      this.myImage = '',
      this.myName = ''});

  @override
  Widget build(BuildContext context) {
    final getFluffs = Provider.of<List<PrivateMessage>>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          hisName,
          style: TextStyle(
//fontSize: Dimensions.getDesirableWidth(5),
            fontSize: FontSize.xlarge,
            color: ColorsManger.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: backgroundBoxDectoration,
                child: ListView.builder(
                  reverse: true,
                  itemCount: getFluffs != null ? getFluffs.length : 0,
                  padding: EdgeInsets.only(
                      //  bottom: Dimensions.getDesirableHeight(2.2),
                      //  right: Dimensions.getDesirableHeight(1.2),
                      // left: Dimensions.getDesirableHeight(1.2),
                      // top: Dimensions.getDesirableHeight(2.2)),
                      ),
                  itemBuilder: (context, index) {
                    final PrivateMessage? old = index != getFluffs.length - 1
                        ? getFluffs[index + 1]
                        : null;
                    final PrivateMessage msg = getFluffs[index];
                    bool isMe = msg.sender == myId;
                    return Column(
                      children: [
                        ((old != null) &&
                                    (msg.time!.day != old.time!.day ||
                                        msg.time!.month != old.time!.month)) ||
                                (index == getFluffs.length - 1)
                            ? Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Card(
                                    color: ColorsManger.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      child: Text(
                                        '${msg.time!.day}/${msg.time!.month}/${msg.time!.year}',
                                        style: const TextStyle(
                                            color: ColorsManger.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )),
                              )
                            : const SizedBox(),
                        MessageBuilder(
                          msg: msg,
                          isMe: isMe,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Attachment(
              myId: myId,
              hisId: hisId,
              hisName: hisName,
              hisImage: hisImage,
              myImage: myImage,
              myName: myName,
            ).messageComposer(context),
          ],
        ),
      ),
    );
  }
}
