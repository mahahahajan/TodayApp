import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:today_app/components/task_component.dart';
import 'package:today_app/components/custom_today_card_widget.dart';
import 'package:today_app/constants.dart';

class TodoListComponent extends StatefulWidget {
  final bool newDay;
  const TodoListComponent({Key? key, required this.newDay}) : super(key: key);

  @override
  State<TodoListComponent> createState() => _TodoListComponentState();
}

class _TodoListComponentState extends State<TodoListComponent> {
  late bool newDay;

  @override
  Widget build(BuildContext context) {
    newDay = widget.newDay;
    if (newDay) {
      return Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 22.0, bottom: 10.0),
                child: Text(
                  'Today\'s Todo\'s',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: (() {
                  print("Task list pressed ");
                }),
                child: CustomTodayCard(
                  cardColor: weatherCardBackgroundColor,
                  elevation: 10,
                  margin: cardEdges,
                  borderRadius: 25,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          height: 200,
                          child: Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.green,
                            size: 100,
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          )
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 22.0, bottom: 10.0),
                child: Text(
                  'Today\'s Todo\'s',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Column(
            children: const [
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
}
