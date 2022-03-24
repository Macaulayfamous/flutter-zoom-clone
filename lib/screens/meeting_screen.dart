import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/controllers/jitsi_meet_methods.dart';
import 'package:zoom_clone/screens/videoCall_screen.dart';
import 'package:zoom_clone/screens/widget/homeMeeting_button.dart';

class MeetingScreen extends StatefulWidget {
  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => VidoeCallScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              icon: Icons.videocam,
              text: 'New Meeting',
              onPressed: createNewMeeting,
            ),
            HomeMeetingButton(
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
              onPressed: joinMeeting,
            ),
            HomeMeetingButton(
              icon: Icons.calendar_today,
              text: 'Schedule',
              onPressed: () {},
            ),
            HomeMeetingButton(
              icon: Icons.arrow_upward_rounded,
              text: 'Share Screen',
              onPressed: () {},
            ),
          ],
        ),
        Expanded(
            child: Center(
          child: Text(
            'create/join Meetings with just a single click',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ))
      ],
    );
  }
}
