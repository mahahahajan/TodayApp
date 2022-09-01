import 'package:flutter/material.dart';
import 'package:today_app/constants.dart';

class TaskComponent extends StatefulWidget {
  TaskComponent(
      {this.isChecked = false,
      this.taskTitle = 'TODO',
      this.checkboxCallback,
      this.longPressCallback});

  final bool isChecked;
  final String taskTitle;
  final Function(bool?)? checkboxCallback;
  final Function()? longPressCallback;

  @override
  State<TaskComponent> createState() => _TaskComponentState();
}

class _TaskComponentState extends State<TaskComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: Card(
        elevation: 10,
        surfaceTintColor: weatherCardBackgroundColor,
        color: weatherCardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          onLongPress: widget.longPressCallback,
          leading: Checkbox(
            activeColor: Colors.green,
            value: widget.isChecked,
            onChanged: (isChecked) {
              // toggleCheckbox(isChecked!);
              print('test');
              setState(() {
                isChecked != isChecked;
              });
            },
            shape: CircleBorder(),
            side: BorderSide(
                color: Colors.green, width: 2, style: BorderStyle.solid),
          ),
          horizontalTitleGap: 0,
          contentPadding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
          title: Text(
            widget.taskTitle,
            textAlign: TextAlign.left,
            style: TextStyle(
                decoration:
                    widget.isChecked ? TextDecoration.lineThrough : null),
          ),
        ),
      ),
    );
  }
}
