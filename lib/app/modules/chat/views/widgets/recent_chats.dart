import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/font_manger.dart';
import 'package:toplive/core/resourses/values_manger.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../../data/models/chat_room_model.dart';
import '../../../home/controllers/home_controller.dart';
import '../chat_screen.dart';

class RecentChats extends StatefulWidget {
  String myId;

  RecentChats({this.myId = ""});

  @override
  _RecentChatsState createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  // UserModel? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final getRecentChat = Provider.of<List<ChatRoom>>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'سجل المحادثات',
          style: TextStyle(
            fontSize: FontSize.xlarge,
            color: ColorsManger.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Container(
        decoration: backgroundBoxDectoration,
        child: ListView.builder(
          itemCount: getRecentChat.isNotEmpty ? getRecentChat.length : 0,
          padding: EdgeInsets.only(top: 10),
          itemBuilder: (context, index) {
            final ChatRoom chatRoom = getRecentChat[index];

            return rowChat(context, chatRoom);
          },
        ),
      ),
    );
  }

  /*getUser() async {
    user = await User(serverResponse: []).getUser();
  }*/

  Widget rowChat(BuildContext context, ChatRoom chatRoom) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ChatScreen(
                    hisId: chatRoom.userA.toString() == widget.myId.toString()
                        ? chatRoom.userB.toString()
                        : chatRoom.userA.toString(),
                    myId: widget.myId,
                    myName: user!.data?.name ?? "",
                    myImage: user!.data?.image ?? "",
                    hisName: chatRoom.userA.toString() == widget.myId.toString()
                        ? chatRoom.bName.toString()
                        : chatRoom.aName.toString(),
                    hisImage:
                        chatRoom.userA.toString() == widget.myId.toString()
                            ? chatRoom.bImage.toString()
                            : chatRoom.aImage.toString(),
                  ))),
      child: Container(
          margin: EdgeInsets.only(top: 2, bottom: 4, right: 8, left: 8),
          padding: EdgeInsets.symmetric(
            horizontal: context.width * .04,
            vertical: context.width * .02,
          ),
          decoration: BoxDecoration(
              color: chatRoom.lastSender != widget.myId
                  ? const Color(0xFF84ae1a).withOpacity(0.8)
                  : const Color(0xFFBed87d).withOpacity(0.8),
              borderRadius: BorderRadius.circular(AppSize.size12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                        imageUrl: chatRoom.userA == widget.myId
                            ? chatRoom.bImage.toString()
                            : chatRoom.aImage.toString(),
                        fit: BoxFit.cover,
                        height: context.width * .2,
                        width: context.width * .2,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                                color: ColorsManger.primary),
                        errorWidget: (context, url, error) => CircleAvatar(
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: ColorsManger.primary,
                              ),
                              backgroundColor: Colors.white,
                            )),
                  ),
                  SizedBox(
                    width: context.width * .05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          //    width: Dimensions.getDesirableWidth(45.0),
                          child: Text(
                        chatRoom.userA == widget.myId.toString()
                            ? chatRoom.bName.toString()
                            : chatRoom.aName.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: FontSize.xxlarge,
                            color: ColorsManger.primary,
                            fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                        height: context.width * (.1),
                      ),
                      SizedBox(
                          width: context.width * .2,
                          child: Text('${chatRoom.lastMsg}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: FontSize.xxlarge,
                                  color: ColorsManger.primary,
                                  //           fontSize: Dimensions.getDesirableWidth(4),
                                  //          color: MyColors().textColor,
                                  fontWeight: FontWeight.w500))),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        timeago.format(
                            DateTime.now().subtract(DateTime.now()
                                .difference(chatRoom.lastChat!.toUtc())),
                            locale: 'ar_short'),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: FontSize.medium,
                            color: ColorsManger.grey1,
                            //      fontSize: Dimensions.getDesirableWidth(4),
                            //    color: MyColors().textColor,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: context.height * .05,
                    ),
                    SizedBox(
                      width: context.width * .1,
                      height: context.height * .02,
                      //  height: Dimensions.getDesirableHeight(4.0),
                      //  width: Dimensions.getDesirableWidth(12.0),
                      child: chatRoom.lastSender != widget.myId
                          ? Container(
                              alignment: Alignment.centerLeft,
                              child: Text('New',
                                  style: TextStyle(
                                      // fontSize: Dimensions.getDesirableWidth(4),
                                      color: ColorsManger.grey1,
                                      fontWeight: FontWeight.bold)))
                          : const Text(''),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
