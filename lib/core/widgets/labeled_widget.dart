import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LabeledWidget extends StatefulWidget {

  final String title;
  final String subtitle;
  final Widget child;

  LabeledWidget({
    @required this.title,
    this.subtitle,
    @required this.child
  });

  @override
  State<StatefulWidget> createState() => _LabeledWidget();

}

class _LabeledWidget extends State<LabeledWidget> {

  bool _hasSubtitle;

  @override
  void initState() {
    super.initState();

    if(widget.subtitle != null) {
      _hasSubtitle = widget.subtitle.isNotEmpty;
    } else _hasSubtitle = false;
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              widget.title,
              style: TextStyle(color: Colors.black87, fontSize: 16),
            )
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Visibility(child: Text(
              _hasSubtitle ? widget.subtitle : "",
            style: TextStyle(color: Colors.grey),
          ), visible: _hasSubtitle,),
        ),
        widget.child
      ],
    );
  }

}