import 'package:flutter/material.dart';

class AppTextsConfig {
  static const double AppHeaderTextSize = 18;

  static Text AppHeaderText(titlte, {current=false}) {
    return Text(
      titlte,
      style: TextStyle(
        color: current? Colors.white : Colors.grey,
        fontSize: AppHeaderTextSize,
        fontWeight:current? FontWeight.bold: FontWeight.normal,
      ),
    );
  }


}