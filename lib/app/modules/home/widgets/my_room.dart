import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toplive/app/data/models/my_room_model.dart';
import 'package:toplive/app/data/remote_data_sources/home_apis.dart';
import 'package:toplive/core/constants/app_const.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/values_manger.dart';

import '../../../../core/resourses/styles_manger.dart';
import '../../../data/remote_data_sources/room_apis.dart';

class MyRoom extends StatelessWidget {
  const MyRoom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MyRoomModel?>(
      future: HomeApis().getMyRoom(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          MyRoomModel? myRoom = snapshot.data;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.size12),
                  color: ColorsManger.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20.0,
                      spreadRadius: 5.0,
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                    ),
                  ]),
              child: myRoom?.data != null
                  ? Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(AppSize.size20 * 5),
                              child: Image.network(
                                myRoom?.data?.roomImage.toString() ?? "",
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Center(
                                  child: Icon(
                                    Icons.error,
                                  ),
                                ),
                              )),
                          Spacer(),
                          Text(
                              myRoom?.data?.joinedUsers?.length.toString() ??
                                  "",
                              style: getMediumTextStyle()),
                          Icon(Icons.person,
                              color: ColorsManger.primary,
                              size: AppSize.size20),
                        ],
                      ),
                      const SizedBox(width: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(AppSize.size20 * 5),
                              child: Image.network(
                                myRoom?.data?.roomCountry?.flag.toString() ??
                                    "",
                                height: 15,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                    Center(
                                  child: Icon(
                                    Icons.error,
                                  ),
                                ),
                              )),
                          const SizedBox(width: 8),
                          Text(
                            "${myRoom?.data?.roomName}",
                            style: getMediumTextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        myRoom?.data?.description ?? "",
                        style: getMediumTextStyle(fontSize: 16),
                      ),
                    ])
                  : TextButton(
                      child: Text("Create Room"),
                      onPressed: () => RoomApis()
                          .createRoom()
                          .then((value) => Get.forceAppUpdate()),
                    ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: loading);
      },
    );
  }
}
