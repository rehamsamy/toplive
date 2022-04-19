import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toplive/app/routes/app_pages.dart';

import '../controllers/room_controller.dart';

import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

class RoomView extends GetView<RoomController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () {
            Get.toNamed(Routes.PROFILE);
          },
          child: Text("Profile Widget"),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: _remoteVideo(),
            ),
            Draggable(
              feedback: Container(),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: RtcLocalView.SurfaceView(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _remoteVideo() {
    if (controller.remoteUid != null) {
      return RtcRemoteView.SurfaceView(
        uid: controller.remoteUid!,
        channelId: "test_room",
      );
    } else {
      return Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}
