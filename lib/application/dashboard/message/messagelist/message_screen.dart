import 'package:spark_app/application/dashboard/message/components/chat.dart';
import 'package:spark_app/application/dashboard/message/models/chat_users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark_app/theme/app_theme.dart';


class MessageScreen extends StatefulWidget {
  static final String routeName = "/message";

  final String text;

  MessageScreen({this.text}) : super();

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with SingleTickerProviderStateMixin {

  TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(text: 'Chats'),
    Tab(text: 'Notifications'),
  ];

  List<ChatUsers> chatUsers = [
    ChatUsers(text: "Jude", secondaryText: "Great App", image: "assets/images/default-profile.png", time: "Now"),
    ChatUsers(text: "Cjoy", secondaryText: "That's Great", image: "assets/images/default-profile.png", time: "Yesterday"),
    ChatUsers(text: "Paulo", secondaryText: "Hey where are you?", image: "assets/images/default-profile.png", time: "31 Mar"),
    ChatUsers(text: "Crystal", secondaryText: "Busy! Call me in 20 mins", image: "assets/images/default-profile.png", time: "28 Mar"),
    ChatUsers(text: "Jherzey", secondaryText: "Okay tong Spark", image: "assets/images/default-profile.png", time: "28 Mar"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          onTap: (index) {
            // Should not used it as it only called when tab options are clicked,
            // not when user swapped
          },
          controller: _controller,
          tabs: list,
          indicatorColor: HexColor('#19BA19'),
          labelColor: HexColor('#19BA19'),
          labelStyle: TextStyle(fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500),
          unselectedLabelColor: HexColor('#525252'),
        ),

        title:
        Align(
          alignment: Alignment.center,
          child: Text('Messages', textAlign: TextAlign.center, style: TextStyle(color: HexColor('#525252'),
              fontSize: 18,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500
          ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: HexColor('#FFFFFF'),
      ),
      body:
      TabBarView(
      controller: _controller,
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  ListView.builder(
                    itemCount: chatUsers.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return ChatUsersList(
                        text: chatUsers[index].text,
                        secondaryText: chatUsers[index].secondaryText,
                        image: chatUsers[index].image,
                        time: chatUsers[index].time,
                        isMessageRead: (index == 0 || index == 3)?true:false,
                      );
                    },
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // SafeArea(
                  //   child: Padding(
                  //     padding: EdgeInsets.only(left: 16,right: 16,top: 16),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: <Widget>[
                  //         Text("Messages",style: TextStyle(
                  //
                  //         color: HexColor('#525252'),
                  //         fontSize: 20,
                  //         fontFamily: 'Montserrat',
                  //         fontWeight: FontWeight.w500),
                  //     ),
                  //
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // ListView.builder(
                  //   itemCount: chatUsers.length,
                  //   shrinkWrap: true,
                  //   padding: EdgeInsets.only(top: 16),
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemBuilder: (context, index){
                  //     return ChatUsersList(
                  //       text: chatUsers[index].text,
                  //       secondaryText: chatUsers[index].secondaryText,
                  //       image: chatUsers[index].image,
                  //       time: chatUsers[index].time,
                  //       isMessageRead: (index == 0 || index == 3)?true:false,
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
    ],
      ),
    );
  }
}