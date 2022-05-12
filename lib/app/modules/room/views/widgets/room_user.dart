import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toplive/app/data/models/chat_message_firebase_model.dart';
import 'package:toplive/app/modules/home/controllers/home_controller.dart';
import 'package:toplive/app/modules/room/views/widgets/user_bottom_sheet.dart';
import 'package:toplive/core/resourses/font_manger.dart';
import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';
import '../../../../../core/resourses/values_manger.dart';
import '../../../../../core/services/chat/agora_room_service.dart';
import '../../../../../core/services/chat/agora_room_service.dart';
import '../../../../../core/services/chat/room_chat.dart';
import '../../controllers/room_controller.dart';

/* RoomChatService()
        .getChatUsersStream(room.id.toString(), room.microphones ?? 5);*/
class RoomUsers extends GetWidget<RoomController> {
  const RoomUsers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      child: Column(children: [
        StreamBuilder(
          //  initialData: [FirebaseChatUser(id: "", name: "no name ")],
          stream: RoomChatService().getChatUsersStream(
              controller.room.id.toString(),
              controller.room.microphones ?? 5,
              context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List hosts = snapshot.data.docs;
              controller.speakers = hosts
                  .where((element) => (element["isSpeaker"] == true))
                  .toList();
              controller.update;
              controller.isRoomSpeakerPermissionAllowed = hosts
                  .where((element) =>
                      (element["role"] == "owner" ||
                          element["role"] == "admin") &&
                      element["id"].toString() == user?.data?.id.toString())
                  .toList()
                  .length
                  .isGreaterThan(0);
              print(
                  "isRoomSpeaker: ${controller.isRoomSpeakerPermissionAllowed}");
              controller.isRoomJoined = hosts
                  .where((element) =>
                      element["id"].toString() == user?.data?.userId.toString())
                  .toList()
                  .length
                  .isGreaterThan(0);
              print("isRoomMember: ${controller.isRoomJoined}");

              return Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.white.withOpacity(.6),
                                size: 30,
                              ),
                              Text(
                                hosts.length.toString(),
                                style: getBoldTextStyle(
                                  color: Colors.white,
                                  fontSize: FontSize.medium,
                                ),
                              )
                            ]),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white12, shape: BoxShape.circle),
                    ),
                    Expanded(
                      child: Container(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hosts.length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.bottomSheet(UserBottomSheet(
                                    hosts[index]["id"] ?? "",
                                    hosts[index]["name"] ?? "",
                                    hosts[index]["image"] ?? ""));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                ),
                                height: 70,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        hosts[index]["image"].toString(),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                10,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white12),
                                          child: Center(
                                            child: Icon(
                                              Icons.mic,
                                              color: ColorsManger.grey1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      hosts[index]["name"] ?? "$index",
                                      style: getMediumTextStyle(
                                          color: ColorsManger.grey1),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Row(children: []),
                    )
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        const SizedBox(
          height: 5,
        ),
        GetBuilder<RoomController>(
          initState: (_) {},
          builder: (RoomController controller) {
            return Wrap(
                runAlignment: WrapAlignment.start,
                alignment: WrapAlignment.start,
                runSpacing: AppSize.size8,
                spacing: AppSize.size8,
                direction: Axis.horizontal,
                children: [
                  ...List.generate(
                      controller.speakers.length,
                      (index) => GestureDetector(
                            onTap: () {
                              Get.bottomSheet(UserBottomSheet(
                                  controller.speakers[index]['id']! ?? "",
                                  controller.speakers[index]['name']! ?? "",
                                  controller.speakers[index]['image']! ?? ""));
                            },
                            child: ZoomIn(
                              child: Container(
                                height: 80,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        controller.speakers[index]['image']!
                                            .toString(),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                6,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white12),
                                          child: Center(
                                            child: Icon(
                                              Icons.mic,
                                              color: ColorsManger.grey1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        controller.speakers[index]['name']! ??
                                            "",
                                        style: getMediumTextStyle(
                                            color: ColorsManger.grey1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                  ...List.generate(
                      controller.room.microphones!.toInt() -
                          controller.speakers.length,
                      (index) => GestureDetector(
                            onTap: () {
                              controller.isRoomSpeaker = true;
                              controller.update();
                              RoomChatService().updateUser(
                                  roomId: controller.room.id.toString(),
                                  user: FirebaseChatUser(
                                      id: user?.data?.userId.toString() ?? "",
                                      image: user?.data?.image.toString() ?? "",
                                      isHere: true,
                                      isKicked: false,
                                      isSpeaker: true,
                                      isblocked: false,
                                      name: user?.data?.name.toString() ?? "",
                                      role: controller.isRoomOwner
                                          ? "owner"
                                          : "admin",
                                      lastActiveAt: DateTime.now()));

                              controller.update();
                              if (controller.isRoomSpeakerPermissionAllowed) {
                              } else if (controller
                                  .isRoomSpeakerPermissionAllowed) {
                                RoomChatService().getAllSpeakerRequests(
                                    controller.room.id.toString(),
                                    user?.data?.id.toString() ?? "");
                                controller.isRoomSpeaker = true;
                                controller.update();
                              }
                            },
                            child: Container(
                              height: 80,
                              child: Column(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.width / 6,
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white12),
                                    child: Center(
                                      child: Icon(
                                        Icons.mic,
                                        color:
                                            ColorsManger.white.withOpacity(.6),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          )),
                ]);
          },
        )
      ]),
    );
  }
}
