import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resourses/assets.dart';
import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';
import '../../../../../core/resourses/values_manger.dart';
import '../../controllers/room_controller.dart';

class RoomAppBar extends GetWidget<RoomController> {
  const RoomAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSize.size8,
        ),
        Row(
          children: [
            IconButton(
              icon: Image.asset(Assets.assetsImagesLogout),
              onPressed: () {
                Get.back();
              },
            ),
            Container(
              //padding: EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                icon: Icon(Icons.more_horiz_rounded, color: ColorsManger.grey1),
                onPressed: () {},
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
              ),
              child: Row(children: [
                IconButton(
                  icon: Icon(
                    Icons.add_circle_rounded,
                    color: ColorsManger.grey1,
                  ),
                  onPressed: () {},
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.room.roomName.toString(),
                      style: getMediumTextStyle(color: ColorsManger.grey1),
                    ),
                    SelectableText("ID: " + controller.room.id.toString(),
                        style: getMediumTextStyle(color: ColorsManger.grey1))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    controller.room.roomImage.toString(),
                    width: 50,
                    errorBuilder: (context, url, error) {
                      return Icon(Icons.error);
                    },
                  ),
                ),
              ]),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
