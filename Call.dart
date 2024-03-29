import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:works/Model/CallModel.dart';

class Call extends StatefulWidget {
  const Call({super.key});
  _CallState createState() => _CallState();
}

class _CallState extends State<Call> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callData != null ? callData.length : 0, // Add itemCount
      itemBuilder: (context, i) {
        if (callData == null || callData.isEmpty) {
          return CircularProgressIndicator(); // Or any other widget to indicate loading or empty state
        }
        return Column(
          children: <Widget>[
            Divider(height: 0.1),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(callData[i].pic),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    callData[i].name,
                    style:
                        TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    (callData[i].name == 'kakashi Sensei' ||
                            callData[i].name == 'Shikamaru' ||
                            callData[i].name == 'Granny' ||
                            callData[i].name == 'Lee')
                        ? Icons.call
                        : Icons.videocam,
                  )
                ],
              ),
              subtitle: Text(
                callData[i].time,
                style: TextStyle(fontSize: 11.0, color: Colors.grey),
              ),
            )
          ],
        );
      },
    );
  }
}
