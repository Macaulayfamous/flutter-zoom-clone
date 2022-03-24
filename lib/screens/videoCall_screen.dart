import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/controllers/auth_controller.dart';
import 'package:zoom_clone/controllers/jitsi_meet_methods.dart';
import 'package:zoom_clone/screens/widget/meeting_option.dart';
import 'package:zoom_clone/utils/colors.dart';

class VidoeCallScreen extends StatefulWidget {
  @override
  _VidoeCallScreenState createState() => _VidoeCallScreenState();
}

class _VidoeCallScreenState extends State<VidoeCallScreen> {
  final AuthController _authController = AuthController();
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  late TextEditingController _meetingIdController;
  late TextEditingController _nameController;

  @override
  void initState() {
    _meetingIdController = TextEditingController();
    _nameController =
        TextEditingController(text: _authController.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _meetingIdController.dispose();
    _nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
        roomName: _meetingIdController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: _nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'Join Meeting',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: _meetingIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Room ID',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: _nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Join',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MeetingOption(
            text: 'Mute Audio  ',
            isMute: isAudioMuted,
            onChange: onAudioMuted,
          ),
          MeetingOption(
            text: 'Turn off my video  ',
            isMute: isVideoMuted,
            onChange: onVideoMuted,
          )
        ],
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
