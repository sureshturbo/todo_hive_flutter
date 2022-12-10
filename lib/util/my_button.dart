import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
   Mybutton({Key? key, required this.text,required this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onpressed,
    color: Colors.yellow,
    child: Text(text),);
  }
}
