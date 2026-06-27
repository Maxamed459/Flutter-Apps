import 'package:flutter/material.dart';
import 'package:todo_app/widgets/dialog_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback oncancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.oncancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue.shade100,
      content: Container(
        height: 150,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // text input field
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add new task",
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 10,
              children: [
                DialogButton(text: "Save", onPressed: onSave),

                // cancel button
                DialogButton(text: "Cancel", onPressed: oncancel),
              ],
            ),

            // save button
          ],
        ),
      ),
    );
  }
}
