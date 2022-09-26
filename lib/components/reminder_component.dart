import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:today_app/components/custom_today_card_widget.dart';
import 'package:today_app/constants.dart';
import 'package:flutter/services.dart';

class ReminderComponent extends StatefulWidget {
  final bool newDay;
  ReminderComponent({Key? key, required this.newDay}) : super(key: key);

  @override
  State<ReminderComponent> createState() =>
      _ReminderComponentState(newDay: newDay);
}

class _ReminderComponentState extends State<ReminderComponent> {
  late final prefs;
  bool newDay;
  _ReminderComponentState({required this.newDay});

  ValueNotifier<double> currWaterCount = ValueNotifier(0.0);
  @override
  void initState() {
    super.initState();
    loadPrefs();
    print("Reminder component got newDay: ${widget.newDay}");
  }

  void loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
    var newDayVal = newDay;
    if (newDayVal) {
      prefs.setDouble(waterCountKey, 0.0);
    }
    setState(() {
      currWaterCount.value = (prefs.getDouble(waterCountKey) ?? 0.0);
    });
    print(currWaterCount.value);
  }

  void addWaterUnit() {
    // currWaterCount++;
    HapticFeedback.vibrate();
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
          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: cardHeight,
                width: cardHeight * 1.37,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      AutoSizeText(
                        'Drink your water!',
                        style: waterReminderTitleTextStyle,
                        minFontSize: 23,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        'Your goal is to drink 64oz today',
                        style: waterReminderSubTitleTextStyle,
                        softWrap: true,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
              SimpleCircularProgressBar(
                size: cardHeight / 1.7,
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
