import 'package:get/get.dart';

import '../../../../../core/resourses/color_manger.dart';
import '../../../../../core/resourses/styles_manger.dart';
import '../../../home/widgets/toggle_button.dart';
import '../../controllers/events_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final EventsController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
        });
  }
}
