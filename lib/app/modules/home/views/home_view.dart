import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:glass_kit/glass_kit.dart';
import 'package:toplive/app/data/models/all_rooms.dart';
import 'package:toplive/app/data/remote_data_sources/home_apis.dart';
import 'package:toplive/app/modules/home/widgets/room_card.dart';
import 'package:toplive/app/routes/app_pages.dart';
import 'package:toplive/core/constants/app_const.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/styles_manger.dart';
import 'package:toplive/core/resourses/values_manger.dart';
import '../controllers/home_controller.dart';
import '../widgets/search_widget.dart';
import '../widgets/tab_bar.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextButton(
            onPressed: () {
              Get.toNamed(Routes.PROFILE);
            },
            child: Text("Profile Widget"),
          ),
        ),
        body: FutureBuilder<AllRoomsModel?>(
          future: HomeApis().getAllRooms(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              AllRoomsModel? allRooms = snapshot.data;
              // return RoomsWidget(allRooms: allRooms);
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .89,
                    width: double.infinity,
                    child: TabBarAndTabViews(tabs: [
                      TabPair(
                        tab: Tab(
                          text: 'Public Rooms',
                        ),
                        view: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: SearchInput(
                                hintText: "Search",
                                onChanged: (String value) {
                                  print(value);
                                },
                                searchController: TextEditingController(),
                              ),
                            ),
                            Expanded(
                              child: RoomsWidget(allRooms: allRooms),
                            ),
                          ],
                        ),
                      ),
                      TabPair(
                        tab: Tab(
                          text: 'Explore',
                        ),
                        view: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: SearchInput(
                                hintText: "Search",
                                onChanged: (String value) {
                                  print(value);
                                },
                                searchController: TextEditingController(),
                              ),
                            ),
                            Expanded(
                              child: RoomsWidget(allRooms: allRooms),
                            ),
                          ],
                        ),
                      ),
                      TabPair(
                        tab: Tab(
                          text: 'My Rooms',
                        ),
                        view: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: SearchInput(
                                hintText: "Search",
                                onChanged: (String value) {
                                  print(value);
                                },
                                searchController: TextEditingController(),
                              ),
                            ),
                            Expanded(
                              child: RoomsWidget(allRooms: allRooms),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ],
              );
            } else {
              return loading;
            }
          },
        ));
  }
}
