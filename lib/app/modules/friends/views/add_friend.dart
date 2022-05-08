import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toplive/app/data/remote_data_sources/friends_apis.dart';
import 'package:toplive/core/resourses/font_manger.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../../../../core/resourses/values_manger.dart';

class AddFriend extends StatefulWidget {
  const AddFriend({Key? key}) : super(key: key);

  @override
  State<AddFriend> createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {
  TextEditingController userId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'add_friend',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding20),
          child: Material(
            color: ColorsManger.primary,
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.size12)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorsManger.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSize.size12),
                          topRight: Radius.circular(AppSize.size12)),
                    ),
                    width: context.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Friend request',
                        style: getBoldTextStyle(
                            color: ColorsManger.black, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter user ID",
                    style: getBoldTextStyle(
                        color: ColorsManger.white, fontSize: FontSize.xxlarge),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: userId,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          fillColor: Colors.white54,
                          filled: true),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: ColorsManger.white,
                      minimumSize:
                          Size(context.width * 0.4, context.height * 0.06),
                    ),
                    child: Text(
                      "Send",
                      style: getBoldTextStyle(
                          color: ColorsManger.primary,
                          fontSize: FontSize.xxlarge),
                    ),
                    onPressed: () async {
                      var data = await FriendsApis()
                          .sendFriendRequest(int.parse(userId.text));
                      if (data["success"] == true) {
                        Get.snackbar("Success", data["message"]);
                      } else {
                        Get.snackbar("Failed", data["message"]);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
