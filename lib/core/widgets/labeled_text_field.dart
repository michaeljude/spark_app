import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LabeledTextField extends StatefulWidget {

  final String title;
  final String subtitle;
  final String hint;
  final IconData icon;
  final bool isPasswordField;
  final TextEditingController textController;

  LabeledTextField({
    @required this.title,
    this.subtitle,
    this.icon,
    @required this.hint,
    this.isPasswordField = false,
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

    passwordObscure = widget.isPasswordField;

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
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16
              ),
            ),
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
                suffixIcon: widget.isPasswordField ? GestureDetector(
                  onTap: () {
                    setState(() {
                      passwordObscure = !passwordObscure;
                    });
                  },
                  child: Icon(passwordObscure
                      ? Icons.visibility_off
                      : Icons.visibility),
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
}