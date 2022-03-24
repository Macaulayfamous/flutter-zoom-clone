import 'package:flutter/material.dart';
import 'package:zoom_clone/controllers/firestore_method.dart';

class HistoryMeeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirestoreMethods().meetingHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
              itemCount: (snapshot.data! as dynamic).docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(
                        'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}'));
              });
        });
  }
}
