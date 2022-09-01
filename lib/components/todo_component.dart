import 'package:flutter/material.dart';
import 'package:today_app/components/task_component.dart';
import 'package:today_app/components/today_card_component.dart';
import 'package:today_app/constants.dart';

class TodoComponent extends StatelessWidget {
  const TodoComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22.0, bottom: 10.0),
              child: Text(
                'Todo Component Card',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Column(
          children: [
            TaskComponent(
              isChecked: false,
              taskTitle: 'Finish Builder Hub 101',
            ),
            TaskComponent(
              isChecked: false,
              taskTitle: 'Workout',
            ),
            TaskComponent(
              isChecked: false,
              taskTitle: 'Finish weather component',
            ),
          ],
        )
      ],
    );
  }
}
