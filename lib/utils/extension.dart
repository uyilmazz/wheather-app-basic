import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  ThemeData get theme => Theme.of(this);

  TextStyle mainTempature() => Theme.of(this)
      .textTheme
      .headline1!
      .copyWith(color: Colors.black, fontWeight: FontWeight.w400);

  TextStyle weatherDescription() =>
      Theme.of(this).textTheme.headline6!.copyWith(
          color: Colors.black87, fontWeight: FontWeight.w400, letterSpacing: 5);

  TextStyle cityName() => Theme.of(this).textTheme.headline4!.copyWith(
      color: Colors.black, fontWeight: FontWeight.w700, letterSpacing: 4);

  TextStyle maxMinTempatureTitle() => Theme.of(this)
      .textTheme
      .headline6!
      .copyWith(color: Colors.grey, fontSize: 15);

  TextStyle maxMinTempatureTitleValue() => Theme.of(this)
      .textTheme
      .headline6!
      .copyWith(color: Colors.black, fontSize: 15);
}
