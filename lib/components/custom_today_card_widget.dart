import 'package:flutter/material.dart';
// import 'package:today_app/constants.dart';

class CustomTodayCard extends StatelessWidget {
  const CustomTodayCard(
      {super.key,
      required this.cardColor,
      required this.elevation,
      required this.margin,
      required this.borderRadius,
      required this.child});

  final Color cardColor;
  final double elevation;
  final EdgeInsets margin;
  final double borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      surfaceTintColor: cardColor,
      color: cardColor,
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
