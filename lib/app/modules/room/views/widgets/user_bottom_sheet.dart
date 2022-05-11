import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toplive/app/data/models/chat_message_firebase_model.dart';
import 'package:toplive/app/data/remote_data_sources/friends_apis.dart';
import 'package:toplive/app/modules/home/controllers/home_controller.dart';
import 'package:toplive/app/modules/profile/views/other_profile_view.dart';
import 'package:toplive/app/modules/room/controllers/room_controller.dart';
import 'package:toplive/app/modules/room/views/widgets/bottom_sheet_action_button.dart';
import 'package:toplive/core/services/chat/room_chat.dart';

import '../../../../../core/resourses/assets.dart';
import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/font_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';
import '../../../../../core/resourses/values_manger.dart';
import 'bottom_sheet_action_button_bottom.dart';

class UserBottomSheet extends GetWidget<RoomController> {
  const UserBottomSheet(this.userId, this.userName, this.userImage, {Key? key})
      : super(key: key);
  final String userId;

  final String userName;
  final String userImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2D0861),
      height: context.height / 2.2,
      width: context.width,
      child: Column(children: [
        const SizedBox(
          height: AppSize.size8,
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => OtherProfileView(int.parse(userId)));
          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30,
            backgroundImage: NetworkImage(
              userImage,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          userName,
          style: getBoldTextStyle(
              color: ColorsManger.white, fontSize: FontSize.xxlarge),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'ID : $userId',
          style: getBoldTextStyle(
              color: ColorsManger.white, fontSize: FontSize.xxlarge),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomSheetActionButton(
              image: Assets.assetsImagesGiftbox,
              title: "gift",
            ),
            BottomSheetActionButton(
              image: Assets.assetsImagesMagiccard,
              title: "Magic card",
            ),
            BottomSheetActionButton(
              image: Assets.assetsImagesMessaging,
              title: "Message ",
            ),
          ],
        ),
        Spacer(
          flex: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomSheetActionButtonBottom(
                icon: Icon(
                  Icons.person_add,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await FriendsApis().sendFriendRequest(int.parse(userId));
                }),
            BottomSheetActionButtonBottom(
                onPressed: () {
                  RoomChatService().addOrUpdateUser(
                      roomId: controller.room.id.toString(),
                      user: FirebaseChatUser(
                          id: user?.data?.userId.toString() ?? "",
                          lastActiveAt: DateTime.now(),
                          isSpeaker: false));
                },
                icon: Icon(
                  Icons.mic_rounded,
                  color: Colors.white,
                )),
            BottomSheetActionButtonBottom(
                icon: Icon(
              Icons.block,
              color: Colors.white,
            )),
            BottomSheetActionButtonBottom(
                icon: Icon(
              Icons.logout,
              color: Colors.white,
            )),
          ],
        ),
        const SizedBox(
          height: AppSize.size20,
        )
      ]),
    );
  }
}
