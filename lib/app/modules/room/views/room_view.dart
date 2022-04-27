import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toplive/app/routes/app_pages.dart';
import 'package:toplive/core/resourses/assets.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/styles_manger.dart';
import 'package:toplive/core/resourses/values_manger.dart';

import '../controllers/room_controller.dart';

class RoomView extends StatefulWidget {
  @override
  State<RoomView> createState() => _RoomViewState();
}

class _RoomViewState extends State<RoomView> {
  RoomController controller = Get.put(RoomController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(Get.arguments);
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.assetsImagesRoomBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
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
                          icon: Icon(Icons.more_horiz_rounded,
                              color: ColorsManger.grey1),
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
                                style: getMediumTextStyle(
                                    color: ColorsManger.grey1),
                              ),
                              SelectableText(
                                  "ID: " + controller.room.id.toString(),
                                  style: getMediumTextStyle(
                                      color: ColorsManger.grey1))
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
                  Wrap(
                    runAlignment: WrapAlignment.start,
                    alignment: WrapAlignment.start,
                    runSpacing: AppSize.size8,
                    spacing: AppSize.size8,
                    children: List.generate(
                        controller.room.joinedUsers!.length,
                        (index) => Container(
                              height: 70,
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      controller.room.joinedUsers!
                                          .elementAt(index)
                                          .image
                                          .toString(),
                                      height: 40,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorsManger.grey1),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Colors.transparent),
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
                                    controller.room.joinedUsers!
                                            .elementAt(index)
                                            .name ??
                                        "$index",
                                    style: getMediumTextStyle(
                                        color: ColorsManger.grey1),
                                  ),
                                ],
                              ),
                            )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
