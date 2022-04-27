import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

class RoomService {
  static const String _appId = "8c87b5bd9bb74c238838d9a380f6be4f";
  static const String _channelName = "test_room";
  static const String _token =
      "0068c87b5bd9bb74c238838d9a380f6be4fIAC6DS8Wa41k/6JV1OAU1WrqvboPspMXR/O5uyrW53V2oVR75ncAAAAAEADQ1fuzOiFpYgEAAQA6IWli";
  late RtcEngine engine;
  int? remoteUid;

  Future<int?> initAgora({required String channelName}) async {
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
    await engine.setClientRole(ClientRole.Audience);

    // await engine.setDefaultAudioRoutetoSpeakerphone(true);

    await engine.joinChannel(_token, _channelName, null, 0);
    print("user_joined");

    return remoteUid;
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
