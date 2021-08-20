import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spark_app/theme/app_theme.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";



class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,

    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            // SizedBox(width: 20),
            Expanded(child: Text(text,
            style: TextStyle(color: HexColor('#525252'),
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500),)),
            Icon(FeatherIcons.chevronRight),
          ],
        ),
      ),
    );
  }
}