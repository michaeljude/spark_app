import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark_app/core/utils/enums.dart';

class LabeledTextField extends StatefulWidget {

  final String title;
  final String subtitle;
  final String hint;
  final IconData icon;
  final bool isTappable;
  final TextFieldType type;
  final bool isRequired;
  final TextEditingController textController;

  LabeledTextField({
    @required this.title,
    this.subtitle,
    this.icon,
    @required this.hint,
    this.isTappable = false,
    this.isRequired = false,
    this.type,
    this.textController
  });

  @override
  State<StatefulWidget> createState() => _LabeledTextField();

}

class _LabeledTextField extends State<LabeledTextField> {

  bool _hasSubtitle;
  String _value;
  bool passwordObscure = false;

  @override
  void initState() {
    super.initState();

    if(widget.subtitle != null) {
      _hasSubtitle = widget.subtitle.isNotEmpty;
    } else _hasSubtitle = false;

    if (widget.type == TextFieldType.PASSWORD) passwordObscure = true;

  }

  @override
  Widget build(BuildContext context) {

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: widget.isRequired ? _requiredText() : _notRequiredText()
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Visibility(child: Text(
                _hasSubtitle ? widget.subtitle : ""
              ), visible: _hasSubtitle,),
            ),
            TextField(
              controller: widget.textController,
              cursorColor: Colors.black26,
              obscureText: passwordObscure,
              decoration: InputDecoration(
                hintText: widget.hint,
                prefixIcon: Icon(widget.icon),
                suffixIcon: widget.isTappable ? GestureDetector(
                  onTap: () {
                    if (widget.type == TextFieldType.PASSWORD) {
                      setState(() {
                        passwordObscure = !passwordObscure;
                      });
                    }
                    else if (widget.type == TextFieldType.BIRTHDATE) {
                      _showDatePicker(context);
                    }
                  },
                  child: _setIcon(),
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
            ),
        ],
    );
  }

  FocusNode _isBirthday() {
    if (widget.type == TextFieldType.BIRTHDATE) return FocusNode();
    else return null;
  }

  Icon _setIcon() {
    if (widget.type == TextFieldType.PASSWORD) {
      return Icon(passwordObscure
          ? Icons.visibility_off
          : Icons.visibility, color: Colors.green,);
    }
    else if(widget.type == TextFieldType.BIRTHDATE) {
      return Icon(Icons.date_range, color: Colors.green,);
    }
    else return null;
  }

  Future<void> _showDatePicker(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1960),
        lastDate: DateTime(2080)
    );
    if(selectedDate != null && selectedDate != currentDate) {
      setState(() {
        widget.textController.text = "${selectedDate.month}/${selectedDate.day}/${selectedDate.year}";
      });
    }
  }

  Widget _notRequiredText() {
    return Text(
      widget.title,
      style: TextStyle(
          color: Colors.black87,
          fontSize: 16
      ),
    );
  }

  Widget _requiredText() {
    return RichText(
      text: TextSpan(
          style: TextStyle(
              color: Colors.black87,
              fontSize: 16
          ),
          children: <TextSpan> [
            TextSpan(
              text: widget.title,
            ),
            TextSpan(
                text: " *",
                style: TextStyle(
                    color: Colors.red
                )
            ),
          ]
      ),
    );
  }

}