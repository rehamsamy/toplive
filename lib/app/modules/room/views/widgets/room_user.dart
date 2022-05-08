import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toplive/core/resourses/font_manger.dart';

import '../../../../../core/resourses/assets.dart';
import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';
import '../../../../../core/resourses/values_manger.dart';
import '../../controllers/room_controller.dart';
import 'bottom_sheet_action_button.dart';
import 'bottom_sheet_action_button_bottom.dart';

class RoomUsers extends GetWidget<RoomController> {
  const RoomUsers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Wrap(
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
                    Get.bottomSheet(Container(
                      color: Color(0xff2D0861),
                      height: context.height / 2.2,
                      width: context.width,
                      child: Column(children: [
                        const SizedBox(
                          height: AppSize.size8,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 30,
                          backgroundImage: NetworkImage(controller
                              .room.joinedUsers![index].image
                              .toString()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${controller.room.joinedUsers![index].name}',
                          style: getBoldTextStyle(
                              color: ColorsManger.white,
                              fontSize: FontSize.xxlarge),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'ID : ${controller.room.joinedUsers![index].id}',
                          style: getBoldTextStyle(
                              color: ColorsManger.white,
                              fontSize: FontSize.xxlarge),
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
                                icon: Icon(Icons.person_add , color: Colors.white,)),
                            BottomSheetActionButtonBottom(
                                icon: Icon(Icons.mic_rounded,
                              color: Colors.white,
                            )),
                            BottomSheetActionButtonBottom(
                                icon: Icon(Icons.block,
                              color: Colors.white,
                            )),
                            BottomSheetActionButtonBottom(
                                icon: Icon(Icons.logout,
                              color: Colors.white,
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ]),
                    ));
                  },
                  child: Container(
                    height: 100,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            controller.room.joinedUsers!
                                .elementAt(index)
                                .image
                                .toString(),
                            width: MediaQuery.of(context).size.width / 6,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              height: MediaQuery.of(context).size.width / 6,
                              width: MediaQuery.of(context).size.width / 6,
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
                          controller.room.joinedUsers!.elementAt(index).name ??
                              "$index",
                          style: getMediumTextStyle(color: ColorsManger.grey1),
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
