import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  static final String routeName = "/message";

  final String text;

  MessageScreen({this.text}) : super();

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.3),
                offset: Offset(0, 5),
                blurRadius: 25)
          ],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: CircleAvatar(
                backgroundImage:
                NetworkImage(friendsList[i]['imgUrl']),
              ),
            ),
            friendsList[i]['isOnline']
                ? Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}