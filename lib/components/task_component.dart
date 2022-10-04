import 'package:flutter/material.dart';
import 'package:today_app/constants.dart';

class TaskComponent extends StatefulWidget {
  const TaskComponent(
      {Key? key,
      this.isChecked = false,
      this.taskTitle = 'TODO',
      this.checkboxCallback,
      this.longPressCallback})
      : super(key: key);

  final bool isChecked;
  final String taskTitle;
  final Function(bool?)? checkboxCallback;
  final Function()? longPressCallback;

  @override
  State<TaskComponent> createState() => _TaskComponentState();
}

class _TaskComponentState extends State<TaskComponent> {
  late String taskTitle;
  late dynamic Function(bool?)? checkboxCallback;
  late dynamic Function()? longPressCallback;

  @override
  void initState() {
    super.initState();
    taskTitle = widget.taskTitle;
    checkboxCallback = widget.checkboxCallback;
    longPressCallback = widget.longPressCallback;
  }

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
            shape: const CircleBorder(),
            side: const BorderSide(
                color: Colors.green, width: 2, style: BorderStyle.solid),
          ),
          horizontalTitleGap: 0,
          contentPadding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
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
