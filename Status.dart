import 'package:flutter/material.dart';
import 'package:works/Model/StatusModel.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            leading: Container(
              width: 50.0,
              child: Stack(
                children: <Widget>[
                  ClipOval(
                    child: Image.network(
                      "https://easydrawingguides.com/wp-content/uploads/2017/05/how-to-draw-naruto-featured-image-1200.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.green,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            title: Text(
              "My Status",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Tap to add Status Update"),
          ),
          SizedBox(
            height: 30.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              color: Colors.grey.shade200,
              child: Text(
                "Recent Update",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey.shade500),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: statusData != null ? statusData.length : 0,
            itemBuilder: (context, i) {
              if (statusData == null || statusData.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: <Widget>[
                  Divider(height: 0.1),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.green[300],
                      child: ClipOval(
                        child: Image.network(
                          statusData[i].pic,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          statusData[i].name,
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      statusData[i].time,
                      style: TextStyle(fontSize: 11.0, color: Colors.grey),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
