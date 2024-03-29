import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:works/Model/ChatsModel.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: chatsData.length,
            itemBuilder: (BuildContext context, int i) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(chatsData[i].pic),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          chatsData[i].name,
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          chatsData[i].time,
                          style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      chatsData[i].msg,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11.8,
                      ),
                    ),
                  ),
                  Divider(height: 0.1),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
