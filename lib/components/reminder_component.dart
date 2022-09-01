import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:today_app/components/today_card_component.dart';
import 'package:today_app/constants.dart';

class ReminderComponent extends StatelessWidget {
  const ReminderComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TodayCard(
      cardColor: Colors.blue,
      elevation: 1,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      borderRadius: 25,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 120,
              width: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Drink your water!',
                      style: waterReminderTitleTextStyle,
                    ),
                    Text(
                      'Your goal is to drink 64oz today',
                      style: waterReminderSubTitleTextStyle,
                      softWrap: true,
                      maxLines: 2,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            SimpleCircularProgressBar(
              size: 90,
              maxValue: 8,
              backColor: Color(0xFF91C5F8),
              backStrokeWidth: 10,
              progressStrokeWidth: 12,
              mergeMode: true,
              progressColors: [Color.fromARGB(255, 255, 255, 255)],
              valueNotifier: ValueNotifier(4.0),
              onGetText: (value) {
                return Text(
                  '4/8',
                  style: waterReminderCounterTextStyle,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
