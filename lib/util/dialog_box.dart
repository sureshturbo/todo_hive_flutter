import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_button.dart';

class Dialog_box extends StatelessWidget {
final controller;
VoidCallback onSave;
VoidCallback onCancel;
   Dialog_box({Key? key,this.controller,required this.onSave,required this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ///input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add the new task",
              ),
            ),
            //button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Mybutton(text: 'save', onpressed: onSave),
                Mybutton(text: 'delete', onpressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
