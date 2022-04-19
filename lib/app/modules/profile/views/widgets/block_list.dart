import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toplive/app/data/models/blocked_users.dart';
import 'package:toplive/app/data/remote_data_sources/block_apis.dart';
import 'package:toplive/core/resourses/styles_manger.dart';
import 'package:toplive/core/resourses/values_manger.dart';

class BlockList extends StatelessWidget {
  const BlockList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BlockedUsersModel?>(
      future: BlockUserApis().getBlockedUsers(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          BlockedUsersModel? blockedUsers = snapshot.data;
          return RefreshIndicator(
            onRefresh: () => Get.forceAppUpdate(),
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            displacement: 10,
            child: Container(
              height: Get.height,
              width: Get.width,
              child: ListView.separated(
                itemCount: blockedUsers?.data?.length ?? 0,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                        blockedUsers?.data?.elementAt(index).name ?? "No name",
                        style: getBoldTextStyle(
                          fontSize: 20,
                        )),
                    trailing: TextButton(
                      child: Text(
                        "Unblock",
                        style: getMediumTextStyle(
                          fontSize: AppSize.size20,
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () async {
                        BlockUserApis()
                            .unblockUser(
                                userId:
                                    blockedUsers?.data?.elementAt(index).id ??
                                        0)
                            .then((value) => Get.forceAppUpdate());
                      },
                    ),
                    leading: CircleAvatar(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl:
                            blockedUsers?.data?.elementAt(index).image ?? "",
                        errorWidget: (context, string, dynamic) =>
                            Icon(Icons.person),
                      ),
                    )),
                  );
                },
              ),
            ),
          );
        } else {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }
      },
    );
  }
}
