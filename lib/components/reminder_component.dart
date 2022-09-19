import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:today_app/components/custom_today_card_widget.dart';
import 'package:today_app/constants.dart';

class ReminderComponent extends StatefulWidget {
  ReminderComponent({Key? key}) : super(key: key);

  @override
  State<ReminderComponent> createState() => _ReminderComponentState();
}

class _ReminderComponentState extends State<ReminderComponent> {
  late final prefs;
  ValueNotifier<double> currWaterCount = ValueNotifier(0.0);
  @override
  void initState() {
    super.initState();
    loadPrefs();
  }

  void loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      currWaterCount.value = (prefs.getDouble(waterCountKey) ?? 0.0);
    });
    print(currWaterCount.value);
  }

  void addWaterUnit() {
    // currWaterCount++;
    if (currWaterCount.value < 8) {
      setState(() {
        currWaterCount.value++;
        prefs?.setDouble(waterCountKey, currWaterCount.value);
      });
    } else {
      resetWaterUnits();
    }
  }

  void resetWaterUnits() {
    setState(() {
      currWaterCount.value = 0;
      prefs?.setDouble(waterCountKey, currWaterCount.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: (() {
        print("long press");
        addWaterUnit();
      }),
      child: CustomTodayCard(
        //TODO: set this card Color to be a constant so it can be edited easier
        cardColor: reminderCardBackgroundColor,
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
                animationDuration: 3,
                backColor: Color(0xFF91C5F8), //lighter colored full circle
                backStrokeWidth: 10,
                progressStrokeWidth: 12,
                mergeMode: true,
                progressColors: [
                  // Colors.red,
                  // Colors.yellow,
                  // Colors.green,
                  Colors.white
                ],
                valueNotifier: currWaterCount,
                onGetText: (value) {
                  return Text(
                    '${currWaterCount.value.toInt()}/8',
                    style: waterReminderCounterTextStyle,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
