import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:toplive/app/data/models/user_model.dart';
import 'package:toplive/app/data/remote_data_sources/profile_apis.dart';
import 'package:toplive/app/modules/profile/views/widgets/block_list.dart';
import 'package:toplive/app/modules/profile/views/widgets/block_list_button.dart';
import 'package:toplive/app/modules/profile/views/widgets/editable_text_field.dart';
import 'package:toplive/app/modules/profile/views/widgets/profile_image.dart';
import 'package:toplive/app/routes/app_pages.dart';
import 'package:toplive/core/resourses/assets.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/styles_manger.dart';
import 'package:toplive/core/resourses/values_manger.dart';
import 'package:flutter/services.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          titleSpacing: 5,
          title: Text('Profile',
              style: getBoldTextStyle(
                  fontSize: AppSize.size20, color: ColorsManger.primary)),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.assetsImagesWhiteBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: FutureBuilder<UserModel?>(
                future: ProfileApis().getUserProfile(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    UserModel? user = snapshot.data;
                    controller.name.text = user?.data!.name ?? " ";
                    controller.birthDate.text = user?.data!.birthDate ?? " ";
                    controller.gender.text = user?.data!.gender ?? " ";
                    controller.status.text = user!.data!.profileStatus ?? " ";
                    controller.email.text = user.data!.email ?? " ";
                    controller.country.text = user.data!.country!.name ?? " ";
                    controller.countryFlag = user.data!.country!.flag ?? "";
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.padding12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProfileImage(user.data!.image.toString()),
                            const SizedBox(height: AppSize.size8),
                            Text(user.data!.name ?? "N/a",
                                style: getMediumTextStyle(
                                  fontSize: AppSize.size20,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SelectableText(
                                    "id: " + user.data!.userId.toString(),
                                    style: getMediumTextStyle(
                                        fontSize: AppSize.size20,
                                        color: ColorsManger.primary)),
                                IconButton(
                                  icon: Icon(Icons.copy,
                                      color: ColorsManger.primary),
                                  onPressed: () {
                                    Get.snackbar(
                                        "Copied", user.data!.userId.toString());
                                    Clipboard.setData(ClipboardData(
                                        text: user.data!.userId.toString()));
                                  },
                                )
                              ],
                            ),
                            const SizedBox(height: AppSize.size12),
                            EditableTextField(
                              controller: controller.name,
                            ),
                            EditableTextField(
                              controller: controller.email,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  child: EditableTextField(
                                    controller: controller.gender,
                                    onChanged: (value) {
                                      controller.isEditing.value = true;
                                    },
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  child: EditableTextField(
                                    controller: controller.country,
                                    prfixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(2),
                                        child: CachedNetworkImage(
                                          imageUrl: controller.countryFlag,
                                          width: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            EditableTextField(
                              controller: controller.birthDate,
                            ),
                            OpenContainer(
                              closedBuilder: (context, action) =>
                                  BlockListButton(),
                              openBuilder: (context, action) => BlockList(),
                              closedElevation: 0,
                              closedShape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.size12)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(AppSize.size12)),
                              child: ListTile(
                                onTap: () async {
                                  await FirebaseAuth.instance.signOut().then(
                                      (value) => Get.toNamed(Routes.AUTH));
                                },
                                title: Text(
                                  "Sign out",
                                  style: getBoldTextStyle(
                                      color: ColorsManger.error, fontSize: 18),
                                ),
                                leading: Icon(
                                  Icons.logout,
                                  color: ColorsManger.error,
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: ColorsManger.error,
                                ),
                              ),
                            ),
                            Obx(() {
                              if (!controller.isEditing.value) {
                                return FadeInUpBig(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            AppSize.size12)),
                                    child: ListTile(
                                      onTap: () async {
                                        await FirebaseAuth.instance
                                            .signOut()
                                            .then((value) =>
                                                Get.toNamed(Routes.AUTH));
                                      },
                                      title: Text(
                                        "Sign out",
                                        style: getBoldTextStyle(
                                            color: ColorsManger.error,
                                            fontSize: 18),
                                      ),
                                      leading: Icon(
                                        Icons.logout,
                                        color: ColorsManger.error,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: ColorsManger.error,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            })
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                })));
  }
}
