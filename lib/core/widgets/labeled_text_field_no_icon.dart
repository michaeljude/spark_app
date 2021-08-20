import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:spark_app/theme/app_theme.dart';

class LabeledTextFieldNoIcon extends StatefulWidget {

  final String title;
  final String subtitle;
  final String hint;

  final bool isRequired;
  final bool isTappable;
  final bool isMultiline;
  final TextFieldType textFieldType;
  final TextEditingController textController;

  LabeledTextFieldNoIcon({
    @required this.title,
    this.subtitle,
    @required this.hint,

    this.isRequired = false,
    this.isTappable = false,
    this.isMultiline = false,
    this.textFieldType = TextFieldType.PASSWORD,
    this.textController,
  });

  @override
  State<StatefulWidget> createState() => _LabeledTextField();

}

enum TextFieldType {
  PASSWORD,
  BIRTHDATE
}

class _LabeledTextField extends State<LabeledTextFieldNoIcon> {

  bool _hasSubtitle;
  String _value;
  bool passwordObscure = false;
  TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();

    if(widget.subtitle != null) {
      _hasSubtitle = widget.subtitle.isNotEmpty;
    } else _hasSubtitle = false;
    if (widget.isTappable && widget.textFieldType == TextFieldType.PASSWORD) {
      passwordObscure = true;
    }
    this.textEditingController = widget.textController;
    this.textEditingController??=TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: RichText(
              text: TextSpan(style: TextStyle(color: HexColor('#525252'), fontSize: 14, fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,),
                  children: <TextSpan> [
                    TextSpan(text: widget.title),
                    TextSpan(
                        text: widget.isRequired ? " *" : "",
                        style: TextStyle(
                            color: Colors.red
                        )
                    )
                  ]
              ),
            )
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Visibility(child: Text(
              _hasSubtitle ? widget.subtitle : ""
          ), visible: _hasSubtitle,),
        ),
        getTextField()
      ],
    );
  }

  TextField getTextField() {
    if(widget.isMultiline) {
      return TextField(
        onTap: () {
          if (widget.textFieldType == TextFieldType.BIRTHDATE) {
            _getDate();
          }
        },
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        readOnly: readOnly(),
        controller: this.textEditingController,
        cursorColor: Colors.black26,
        obscureText: passwordObscure,
        decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: widget.isTappable ? GestureDetector(
              onTap: () {
                if (widget.textFieldType == TextFieldType.BIRTHDATE) {
                  _getDate();
                }
                else if (widget.textFieldType == TextFieldType.PASSWORD) {
                  setState(() {
                    passwordObscure = !passwordObscure;
                  });
                }
              },
              child: _getIcon(),
            ) : null,
            focusColor: Colors.black54,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black,
                    width: 2
                ),
                borderRadius: BorderRadius.circular(5)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.green,
                    width: 2
                ),
                borderRadius: BorderRadius.circular(5)
            )
        ),
        onChanged: (value) {
          _value = value;
        },
      );
    } else {
      return TextField(
        onTap: () {
          if (widget.textFieldType == TextFieldType.BIRTHDATE) {
            _getDate();
          }
        },
        style: TextStyle(fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500, color: HexColor('#525252'),),
        readOnly: readOnly(),
        controller: this.textEditingController,
        cursorColor: Colors.black26,
        obscureText: passwordObscure,
        decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: widget.isTappable ? GestureDetector(
              onTap: () {
                if (widget.textFieldType == TextFieldType.BIRTHDATE) {
                  _getDate();
                }
                else if (widget.textFieldType == TextFieldType.PASSWORD) {
                  setState(() {
                    passwordObscure = !passwordObscure;
                  });
                }
              },
              child: _getIcon(),
            ) : null,
            focusColor: Colors.black54,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: HexColor('#626262'),
                    width: 2
                ),
                borderRadius: BorderRadius.circular(5)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.green,
                    width: 2
                ),
                borderRadius: BorderRadius.circular(5)
            )
        ),
        onChanged: (value) {
          _value = value;
        },
      );
    }
  }

  Future<String> _getDate() async {
    DateTime currentDate = DateTime.now();
    DateTime selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2070),
    );

    if (selectedDate != null && selectedDate != currentDate) {
      setState(() {
        this.textEditingController.text = "${selectedDate?.month}/${selectedDate?.day}/${selectedDate?.year}";
      });
    }

  }

  bool readOnly() {
    if (widget.textFieldType == TextFieldType.BIRTHDATE) {
      return true;
    } else return false;
  }

  Icon _getIcon() {
    if (widget.textFieldType == TextFieldType.BIRTHDATE) {
      return Icon(Icons.calendar_today, color: Colors.green,);
    }
    else if (widget.textFieldType == TextFieldType.PASSWORD) {
      return Icon(passwordObscure
          ? FeatherIcons.eyeOff
          : FeatherIcons.eye, size: 20,);
    }
    else return null;
  }
}