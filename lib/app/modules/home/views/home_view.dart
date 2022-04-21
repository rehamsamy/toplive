import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:toplive/app/data/models/all_countries.dart';
import 'package:toplive/app/data/models/all_rooms.dart';
import 'package:toplive/app/data/models/room_categories.dart';
import 'package:toplive/app/data/remote_data_sources/home_apis.dart';
import 'package:toplive/app/modules/home/widgets/Carousel.dart';
import 'package:toplive/app/modules/home/widgets/categories_list.dart';
import 'package:toplive/app/modules/home/widgets/countries_list.dart';
import 'package:toplive/app/modules/home/widgets/room_card.dart';
import 'package:toplive/app/modules/home/widgets/toggle_button.dart';
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
    controller.onInit();

    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            leading: IconButton(
                icon: Icon(Icons.settings_rounded),
                onPressed: () {
                  Get.bottomSheet(
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              "Settings",
                              style: getBoldTextStyle(),
                            ),
                            const SizedBox(height: 20),
                            ListTile(
                              leading: Icon(Icons.person),
                              title: Text("Hide profile"),
                              trailing: Obx(() {
                                return CupertinoSwitch(
                                  value: controller.hideProfile.value,
                                  activeColor: ColorsManger.primary,
                                  onChanged: (value) {
                                    controller.hideProfile.value = value;
                                  },
                                );
                              }),
                            ),
                            ListTile(
                              leading: Icon(Icons.person),
                              title: Text("Hide profile"),
                              trailing: Obx(() {
                                return CupertinoSwitch(
                                  value: controller.hideProfile.value,
                                  activeColor: ColorsManger.primary,
                                  onChanged: (value) {
                                    controller.hideProfile.value = value;
                                  },
                                );
                              }),
                            ),
                            ListTile(
                              leading: Icon(Icons.person),
                              title: Text("Hide profile"),
                              trailing: Obx(() {
                                return CupertinoSwitch(
                                  value: controller.hideProfile.value,
                                  activeColor: ColorsManger.primary,
                                  onChanged: (value) {
                                    controller.hideProfile.value = value;
                                  },
                                );
                              }),
                            ),
                            ListTile(
                              leading: Icon(Icons.person),
                              title: Text("Hide profile"),
                              trailing: Obx(() {
                                return CupertinoSwitch(
                                  value: controller.hideProfile.value,
                                  activeColor: ColorsManger.primary,
                                  onChanged: (value) {
                                    controller.hideProfile.value = value;
                                  },
                                );
                              }),
                            ),
                            ToggleBtns(
                                texts: [Text("العربية "), Text("English")],
                                selected: (i) => Get.updateLocale(
                                    i == 0 ? Locale("ar") : Locale("en")))
                          ],
                        ),
                      ),
                      elevation: 8,
                      barrierColor: Colors.transparent);
                }),
            title: CircleAvatar(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    user?.data?.image ?? "",
                    fit: BoxFit.cover,
                  )),
            )),
        body: FutureBuilder<AllRoomsModel?>(
          future: HomeApis().getAllRooms(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              AllRoomsModel? allRooms = snapshot.data;
              // return RoomsWidget(allRooms: allRooms);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .87,
                      width: double.infinity,
                      child: TabBarAndTabViews(tabs: [
                        TabPair(
                          tab: Tab(
                            text: 'Public Rooms',
                          ),
                          view: Column(
                            children: [
                              Carousel(),
                              Expanded(
                                child: SearchInput(
                                  hintText: "Search",
                                  onChanged: (String value) {
                                    print(value);
                                  },
                                  searchController: TextEditingController(),
                                ),
                              ),
                              Expanded(
                                flex: 6,
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
                              AllCountriesList(),
                              CategoriesList(),
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
                ),
              );
            } else {
              return loading;
            }
          },
        ));
  }
}
