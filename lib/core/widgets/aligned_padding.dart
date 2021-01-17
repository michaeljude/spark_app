import 'package:flutter/cupertino.dart';

class AlignedPadding extends StatelessWidget {

  final Widget child;
  final EdgeInsets edgeInsets;
  final Alignment alignment;

  AlignedPadding({
    this.child,
    this.edgeInsets,
    this.alignment
});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: this.alignment,
      child: Padding(
        padding: this.edgeInsets,
        child: this.child
      ),
    );
  }


}