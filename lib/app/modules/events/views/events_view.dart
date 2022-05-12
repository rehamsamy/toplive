import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toplive/app/modules/home/controllers/home_controller.dart';
import 'package:toplive/app/routes/app_pages.dart';
import 'package:toplive/core/resourses/assets.dart';
import '../controllers/events_controller.dart';
import 'Widgets/jewels_count_widget.dart';
import 'Widgets/settings_button.dart';

class EventsView extends GetView<EventsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.toNamed(Routes.PROFILE),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                user?.data?.image.toString() ?? "",
              ),
            )),
          ),
        ),
        actions: [
          JewelsCountWidget(),
          SettingsWidget(
            controller: controller,
          ),
        ],
        title: Image.asset(Assets.assetsImagesLogo, height: 40),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Soon...',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
