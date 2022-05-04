import 'dart:io';

import 'package:animations/animations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:toplive/app/data/models/all_countries.dart';
import 'package:toplive/app/data/models/user_model.dart';
import 'package:toplive/app/data/remote_data_sources/home_apis.dart';
import 'package:toplive/app/data/remote_data_sources/profile_apis.dart';
import 'package:toplive/app/modules/profile/views/widgets/block_list.dart';
import 'package:toplive/app/modules/profile/views/widgets/block_list_button.dart';
import 'package:toplive/app/modules/profile/views/widgets/dropdown.dart';
import 'package:toplive/app/modules/profile/views/widgets/editable_text_field.dart';
import 'package:toplive/app/modules/profile/views/widgets/profile_image.dart';
import 'package:toplive/app/routes/app_pages.dart';
import 'package:toplive/core/constants/app_const.dart';
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
                    controller.name.text = user?.data!.name ?? "name";

                    controller.birthDate.value =
                        DateTime.parse(user?.data!.birthDate ?? "1999-10-9");
                    controller.gender.value =
                        controller.genderItems.elementAt(0);
                    controller.status.text =
                        user!.data!.profileStatus ?? "status ";
                    controller.email.text = user.data!.email ?? "email ";
                    controller.country.value =
                        user.data!.country!.name ?? " country";
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
                              prfixIcon: Image.asset(
                                Assets.assetsImagesUser,
                              ),
                            ),
                            EditableTextField(
                              controller: controller.status,
                              prfixIcon: Image.asset(
                                Assets.assetsImagesStatus,
                              ),
                            ),
                            EditableTextField(
                              controller: controller.email,
                              prfixIcon: Image.asset(
                                Assets.assetsImagesEmail,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DropDown(
                                  hintText: user.data?.gender ?? "Gender",
                                  image: Assets.assetsImagesGender,
                                  items: controller.genderItems,
                                  onChanged: (val) {
                                    controller.gender.value = val.toString();
                                  },
                                ),
                                FutureBuilder<AllCountriesModel?>(
                                  future: HomeApis().getAllCountries(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      AllCountriesModel? allCountries =
                                          snapshot.data;
                                      return DropDown(
                                        hintText: user.data?.country?.name ??
                                            "Country",
                                        image: controller.countryFlag,
                                        items: allCountries!.data!
                                            .map((e) => e.name.toString())
                                            .toList(),
                                        onChanged: (val) {
                                          controller.country.value =
                                              val.toString();
                                        },
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text("${snapshot.error}");
                                    }
                                    return Center(child: loading);
                                  },
                                )
                              ],
                            ),
                            const SizedBox(height: AppSize.size12),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: ColorsManger.white,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.size12)),
                                child: Obx(() {
                                  return ListTile(
                                    onTap: () async {
                                      final DateTime? selected =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: controller.birthDate.value,
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime(2010),
                                      );
                                      if (selected != null &&
                                          selected !=
                                              controller.birthDate.value) {
                                        controller.birthDate.value = selected;
                                      }
                                    },
                                    leading: Image.asset(
                                      Assets.assetsImagesCalender,
                                    ),
                                    trailing: Icon(Icons.edit),
                                    title: Text(
                                        controller.getFormattedDate(
                                            controller.birthDate.toString()),
                                        style: getMediumTextStyle(
                                            fontSize: AppSize.size16,
                                            color: ColorsManger.darkGrey)),
                                  );
                                }),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(AppSize.size12)),
                              child: ListTile(
                                onTap: () => () async {
                                  File profileImagex =
                                      File(controller.profileImage!.path);
                                  await ProfileApis()
                                      .updateProfile(
                                          name: controller.name.text,
                                          email: controller.email.text,
                                          gender: controller.gender.value,
                                          countryId: int.parse(
                                              controller.country.value),
                                          birthDate: controller.birthDate.value,
                                          profileImage: profileImagex)
                                      .then((value) => Get.snackbar("Updated",
                                          "Profile updated successfully"));
                                },
                                title: Text(
                                  "Update profile",
                                  style: getBoldTextStyle(
                                      color: ColorsManger.success,
                                      fontSize: 18),
                                ),
                                leading: Icon(
                                  CupertinoIcons.person_add_solid,
                                  color: ColorsManger.success,
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: ColorsManger.success,
                                ),
                              ),
                            ),
                            const SizedBox(height: AppSize.size12),
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
