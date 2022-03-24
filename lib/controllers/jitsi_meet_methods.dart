import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/controllers/auth_controller.dart';
import 'package:zoom_clone/controllers/firestore_method.dart';

class JitsiMeetMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  final AuthController _authController = AuthController();
  void createMeeting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted,
      String username = ''}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String name = '';
      if (username.isEmpty) {
        name = _authController.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name
        ..userEmail = _authController.user.email
        ..userAvatarURL = _authController.user.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
