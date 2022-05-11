import 'package:get/state_manager.dart';
import 'package:toplive/app/data/models/friend_requests.dart';
import 'package:toplive/app/data/remote_data_sources/friends_apis.dart';
import 'package:toplive/app/data/remote_data_sources/profile_apis.dart';
import 'package:toplive/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:toplive/core/constants/app_const.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/styles_manger.dart';

import '../../../../core/resourses/values_manger.dart';

class OtherProfileView extends GetView<ProfileController> {
  const OtherProfileView(this.userId, {Key? key}) : super(key: key);
  final int userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            style: getBoldTextStyle(color: ColorsManger.primary)),
        elevation: 0,
      ),
      body: FutureBuilder<FriendRequestsModel?>(
          future: FriendsApis().searchForFriends(userId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                  child: Column(children: [
                const SizedBox(
                  height: AppSize.size8,
                ),
              ]));
            } else {
              return loading;
            }
          }),
    );
  }
}
