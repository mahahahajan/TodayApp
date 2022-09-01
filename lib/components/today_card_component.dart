import 'package:flutter/material.dart';
import 'package:today_app/constants.dart';

class TodayCard extends StatelessWidget {
  
  TodayCard({required this.cardColor, required this.elevation, required this.margin, required this.borderRadius, required this.child});
      
  // {
  //   this.elevation = elevation;
  //   this.customMargin = margin;
  //   this.borderRadius = borderRadius;
  //   this.cardPlaceholderText = cardPlaceholderText;
  //   this.child = child;
  // }

  // const TodayCard({});
  final Color cardColor;
  final double elevation;
  final EdgeInsets margin;
  final double borderRadius;
  final Widget child;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: this.elevation,
      surfaceTintColor: this.cardColor,
      color: this.cardColor,
      margin: this.margin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(this.borderRadius),
      ),
      child: this.child,
    );
  }
}
