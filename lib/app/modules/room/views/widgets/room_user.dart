import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toplive/app/modules/room/views/widgets/user_bottom_sheet.dart';
import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';
import '../../../../../core/resourses/values_manger.dart';
import '../../../../../core/services/chat/room_chat.dart';
import '../../controllers/room_controller.dart';

/* RoomChatService()
        .getChatUsersStream(room.id.toString(), room.microphones ?? 5);*/
class RoomUsers extends GetWidget<RoomController> {
  const RoomUsers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          StreamBuilder(
            stream: RoomChatService().getChatUsersStream(
                controller.room.id.toString(),
                controller.room.microphones ?? 5,
                context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List hosts = snapshot.data.docs;
                hosts = hosts
                    .where(
                      (element) =>
                          element["role"] == "owner" ||
                          element["role"] == "admin",
                    )
                    .toList();
                return Container(
                  child: Wrap(
                    runAlignment: WrapAlignment.start,
                    alignment: WrapAlignment.start,
                    runSpacing: AppSize.size8,
                    spacing: AppSize.size8,
                    children: List.generate(
                        hosts.length,
                        (index) => GestureDetector(
                              onTap: () {
                                Get.bottomSheet(UserBottomSheet(
                                    hosts[index]["id"] ?? "",
                                    hosts[index]["name"] ?? "",
                                    hosts[index]["image"] ?? ""));
                              },
                              child: Container(
                                height: 70,
                                child: Column(
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
                                    Expanded(
                                      child: Text(
                                        hosts[index]["name"] ?? "$index",
                                        style: getMediumTextStyle(
                                            color: ColorsManger.grey1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          Wrap(
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.start,
            runSpacing: AppSize.size8,
            spacing: AppSize.size8,
            children: List.generate(
                controller.room.joinedUsers!.length >= 10
                    ? 10
                    : controller.room.joinedUsers!.length,
                (index) => GestureDetector(
                      onTap: () {
                        Get.bottomSheet(UserBottomSheet(
                            controller.room.joinedUsers?[index].userId ?? "",
                            controller.room.joinedUsers?[index].name ?? "",
                            controller.room.joinedUsers?[index].image ?? ""));
                      },
                      child: Container(
                        height: 80,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                controller.room.joinedUsers!
                                    .elementAt(index)
                                    .image
                                    .toString(),
                                width: MediaQuery.of(context).size.width / 7,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                  height: MediaQuery.of(context).size.width / 7,
                                  width: MediaQuery.of(context).size.width / 7,
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
                                controller.room.joinedUsers!
                                        .elementAt(index)
                                        .name ??
                                    "$index",
                                style: getMediumTextStyle(
                                    color: ColorsManger.grey1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
