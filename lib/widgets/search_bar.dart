import 'package:flutter/material.dart';

class SerachBar extends StatelessWidget {
  const SerachBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(onChanged: (text) {
      print("Texto é $text");
    });
  }
}
