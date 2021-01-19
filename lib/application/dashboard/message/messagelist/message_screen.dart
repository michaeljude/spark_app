import 'package:spark_app/application/dashboard/message/components/chat.dart';
import 'package:spark_app/application/dashboard/message/models/chat_users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MessageScreen extends StatefulWidget {
  static final String routeName = "/message";

  final String text;

  MessageScreen({this.text}) : super();

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  List<ChatUsers> chatUsers = [
    ChatUsers(text: "Jude", secondaryText: "Great App", image: "assets/images/spark-avatar.png", time: "Now"),
    ChatUsers(text: "Cjoy", secondaryText: "That's Great", image: "assets/images/spark-avatar.png", time: "Yesterday"),
    ChatUsers(text: "Paulo", secondaryText: "Hey where are you?", image: "assets/images/spark-avatar.png", time: "31 Mar"),
    ChatUsers(text: "Crystal", secondaryText: "Busy! Call me in 20 mins", image: "assets/images/spark-avatar.png", time: "28 Mar"),
    ChatUsers(text: "Jherzey", secondaryText: "Okay tong Spark", image: "assets/images/spark-avatar.png", time: "28 Mar"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Message",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                  ],
                ),
              ),
            ),
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
    );
  }
}