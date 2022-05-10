import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toplive/app/modules/room/controllers/room_controller.dart';

class RoomService extends GetxService {
  final RoomController controller = Get.find<RoomController>();
  static const String _appId = "900170190e1c44028e728d407abf54a0";

  int? remoteUid;
  bool _isAudioMuted = false;

  Future<List> initAgora(
      {required String channelName, required ClientRole role}) async {
    await [
      Permission.speech,
      Permission.microphone,
      Permission.notification,
    ].request();
    controller.engine = await RtcEngine.create(_appId);
    await controller.engine.leaveChannel();
    controller.engine.setEventHandler(_rtcEventHandler());
    await controller.engine.enableAudio();
    await controller.engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await controller.engine.setEnableSpeakerphone(true);

    await controller.engine.setClientRole(role);

    // await engine.setDefaultAudioRoutetoSpeakerphone(true);

    await controller.engine.joinChannel(null, channelName, null, 0);
    print("user_joined");

    return [remoteUid, controller.engine];
  }

  leaveRoomAndClose() async {
    await controller.engine.leaveChannel();
    await controller.engine.destroy();
  }

  muteAudioSwitcher() async {
    await controller.engine.muteLocalAudioStream(!_isAudioMuted ? true : false);
    _isAudioMuted = !_isAudioMuted;
  }

  speakerAudioSwitcher() async {
    await controller.engine.isSpeakerphoneEnabled() ?? false
        ? await controller.engine.setEnableSpeakerphone(false)
        : await controller.engine.setEnableSpeakerphone(true);
    await controller.engine.isSpeakerphoneEnabled() ?? false
        ? controller.engine.setClientRole(ClientRole.Broadcaster)
        : controller.engine.setClientRole(ClientRole.Audience);
  }

  RtcEngineEventHandler _rtcEventHandler() {
    return RtcEngineEventHandler(
      joinChannelSuccess: (channel, uid, elapsed) {
        print("joinChannelSuccess $channel $uid $elapsed");
      },
      userJoined: (int uid, int elapsed) {
        print("user $uid has Joined channel");
        remoteUid = uid;
      },
      userOffline: (int uid, UserOfflineReason reason) {
        print("user $uid is Offline because of : + $reason  ");
        remoteUid = null;
      },
      userMuteAudio: (int uid, bool muted) {
        print("userMuteAudio");
      },
    );
  }
}
