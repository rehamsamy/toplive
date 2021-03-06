import 'package:ease/animations/hero_page_route.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toplive/app/data/models/friends_list.dart';
import 'package:toplive/app/data/remote_data_sources/friends_apis.dart';
import 'package:toplive/core/constants/app_const.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/font_manger.dart';
import 'package:toplive/core/resourses/styles_manger.dart';
import 'package:toplive/core/resourses/values_manger.dart';

import '../../chat/views/chat_screen.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/friends_controller.dart';
import 'add_friend.dart';

class FriendsView extends GetView<FriendsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManger.white,
        title: Text(
          'Friends',
          style: getBoldTextStyle(
            color: ColorsManger.primary,
            fontSize: FontSize.xlarge,
          ),
        ),
      ),
      body: Container(
          height: context.height,
          width: context.width,
          decoration: backgroundBoxDectoration,
          child: FutureBuilder<FriendsListModel?>(
            future: FriendsApis().friendsList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                FriendsListModel? friends = snapshot.data;
                return Column(
                  children: [
                    ListView.builder(
                      itemCount: friends?.data?.length ?? 0,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: ColorsManger.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  friends?.data?.elementAt(index).image ?? "",
                                ),
                              ),
                              title: Text(
                                friends?.data?.elementAt(index).name ?? '',
                                style: getBoldTextStyle(
                                  color: ColorsManger.black,
                                  fontSize: FontSize.xlarge,
                                ),
                              ),
                              trailing: Container(
                                  //  width: context.width * 0.2,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(AppSize.size18),
                                      gradient: ColorsManger.buttonGradient),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => ChatScreen(
                                                      myId: user?.data?.userId
                                                              .toString() ??
                                                          "",
                                                      hisId: friends?.data
                                                              ?.elementAt(index)
                                                              .id
                                                              .toString() ??
                                                          '',
                                                      hisName: friends?.data
                                                              ?.elementAt(index)
                                                              .name ??
                                                          ''
                                                              "",
                                                      hisImage: friends?.data
                                                              ?.elementAt(index)
                                                              .image ??
                                                          '',
                                                      myName: user?.data?.name
                                                              .toString() ??
                                                          "",
                                                      myImage: user?.data?.image
                                                              .toString() ??
                                                          "",
                                                    )));
                                      },
                                      child: Text(
                                        "Message",
                                        style: getMediumTextStyle(
                                          color: Colors.white,
                                          fontSize: FontSize.large,
                                        ),
                                      ))),
                            ),
                          ),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: ColorsManger.primary,
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: AppSize.size8,
                              ),
                              Text(
                                "Search",
                                style: getMediumTextStyle(
                                  color: ColorsManger.white,
                                  fontSize: FontSize.large,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Hero(
                          tag: "add_friend",
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: ColorsManger.primary,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  HeroDialogRoute(
                                      builder: (context) => AddFriend()));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_add,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: AppSize.size8,
                                ),
                                Text(
                                  "Add Friends",
                                  style: getMediumTextStyle(
                                    color: ColorsManger.white,
                                    fontSize: FontSize.large,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: loading);
            },
          )),
    );
  }
}
