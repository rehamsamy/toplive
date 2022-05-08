import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toplive/app/modules/room/views/widgets/user_bottom_sheet.dart';
import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';
import '../../../../../core/resourses/values_manger.dart';
import '../../controllers/room_controller.dart';

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
                    Get.bottomSheet(UserBottomSheet(
                        controller.room.joinedUsers?[index].userId ?? "",
                        controller.room.joinedUsers?[index].name ?? "",
                        controller.room.joinedUsers?[index].image ?? ""));
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
