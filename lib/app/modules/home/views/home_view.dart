import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toplive/app/data/models/all_rooms.dart';
import 'package:toplive/app/data/remote_data_sources/home_apis.dart';
import 'package:toplive/app/modules/home/widgets/carousel.dart';
import 'package:toplive/app/modules/home/widgets/categories_list.dart';
import 'package:toplive/app/modules/home/widgets/countries_list.dart';
import 'package:toplive/app/modules/home/widgets/my_room.dart';
import 'package:toplive/app/modules/home/widgets/room_card.dart';
import 'package:toplive/core/constants/app_const.dart';
import '../controllers/home_controller.dart';
import '../widgets/search_widget.dart';
import '../widgets/tab_bar.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.onInit();

    return Scaffold(
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
                    //*PUBLICROOMS TAB
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
                    //* EXPLORE Tab
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
                    //* MYROOMS Tab
                    TabPair(
                      tab: Tab(
                        text: 'My Rooms',
                      ),
                      view: Column(
                        children: [
                          MyRoom(),
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
