import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

class RoomService {
  static const String _appId = "900170190e1c44028e728d407abf54a0";

  late RtcEngine engine;
  int? remoteUid;
  bool _isAudioMuted = false;

  Future<int?> initAgora(
      {required String channelName, required ClientRole role}) async {
    await [
      Permission.speech,
      Permission.microphone,
      Permission.notification,
    ].request();
    engine = await RtcEngine.create(_appId);
    await engine.leaveChannel();
    engine.setEventHandler(_rtcEventHandler());
    await engine.enableAudio();
    await engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await engine.setEnableSpeakerphone(true);

    await engine.setClientRole(role);

    // await engine.setDefaultAudioRoutetoSpeakerphone(true);

    await engine.joinChannel(null, channelName, null, 0);
    print("user_joined");

    return remoteUid;
  }

  leaveRoomAndClose() async {
    await engine.leaveChannel();
    await engine.destroy();
  }

  muteAudioSwitcher() async {
    await engine.muteLocalAudioStream(!_isAudioMuted ? true : false);
    _isAudioMuted = !_isAudioMuted;
  }

  speakerAudioSwitcher() async {
    await engine.isSpeakerphoneEnabled() ?? true
        ? await engine.setEnableSpeakerphone(false)
        : await engine.setEnableSpeakerphone(true);
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
