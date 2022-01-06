import 'package:flutter/material.dart';
import 'package:wheatherapp/utils/extension.dart';

class ForecastValue extends StatelessWidget {
  final String? label;
  final String? value;
  final String? icon;
  const ForecastValue({Key? key, this.label, this.value, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.02)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 2,
              child: Text(label.toString(),
                  style: context.maxMinTempatureTitle())),
          icon != null
              ? Expanded(
                  flex: 4,
                  child: Image(
                      image: NetworkImage(
                          'https://openweathermap.org/img/wn/$icon.png')))
              : const SizedBox(),
          Expanded(
              flex: 2,
              child: Text("$value", style: context.maxMinTempatureTitleValue()))
        ],
      ),
    );
  }
}
