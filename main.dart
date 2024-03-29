import 'package:flutter/material.dart';
import 'package:works/Tabs/Call.dart';
import 'package:works/Tabs/Camera.dart';
import 'package:works/Tabs/Chats.dart';
import 'package:works/Tabs/Status.dart';

void main() => runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Color(0xff075e54), // Your primary color
      // Your accent color
    ),
    home: Homepage()));

class Homepage extends StatefulWidget {
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {
      // Update the FloatingActionButton based on the current tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff075e54),
        actions: <Widget>[
          IconButton(
              onPressed: () {}, icon: Icon(Icons.search), color: Colors.white),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              color: Colors.white),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab(
              child: Icon(Icons.camera_alt, color: Color(0xfff8f2f2)),
            ),
            Tab(
                child: Text(
              'CHATS',
              style: TextStyle(color: Color(0xfff8f2f2)),
            )),
            Tab(
                child: Text(
              'STATUS',
              style: TextStyle(color: Color(0xfff8f2f2)),
            )),
            Tab(
                child: Text(
              'CALL',
              style: TextStyle(color: Color(0xfff8f2f2)),
            ))
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Camera(),
          Chats(),
          Status(),
          Call(),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
              backgroundColor: Color(0xff075e54),
              child: Icon(Icons.camera_alt, color: Color(0xfff8f2f2)),
              onPressed: () {},
            )
          : _tabController.index == 1
              ? FloatingActionButton(
                  backgroundColor: Color(0xff075e54),
                  child: Icon(Icons.message, color: Color(0xfff8f2f2)),
                  onPressed: () {},
                )
              : _tabController.index == 2
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FloatingActionButton(
                          backgroundColor: Color(0xfff8f2f2),
                          child: Icon(Icons.edit,
                              color: Colors
                                  .blueGrey), // Closing parenthesis added here
                          onPressed: () {},
                        ),
                        SizedBox(height: 7),
                        FloatingActionButton(
                          backgroundColor: Color(0xff075e54),
                          child: Icon(Icons.camera_alt,
                              color: Color(
                                  0xfff8f2f2)), // Closing parenthesis added here
                          onPressed: () {},
                        )
                      ],
                    )
                  : _tabController.index == 3
                      ? FloatingActionButton(
                          backgroundColor: Color(0xff075e54),
                          child: Icon(Icons.add_call,
                              color: Color(
                                  0xfff8f2f2)), // Closing parenthesis added here
                          onPressed: () {},
                        )
                      : null,
    ); // Added null condition for other tab indices
  }
}
