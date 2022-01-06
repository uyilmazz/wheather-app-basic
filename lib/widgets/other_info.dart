import 'package:flutter/material.dart';
import 'package:wheatherapp/model/weather.dart';
import 'package:wheatherapp/utils/converts.dart';
import 'package:wheatherapp/utils/extension.dart';
import 'package:wheatherapp/widgets/forecast_value.dart';

class OtherInfo extends StatelessWidget {
  final Weather? weather;
  const OtherInfo({Key? key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.02)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ForecastValue(
              label: 'wind speed',
              value: weather!.list![0].wind!.speed.toString() + ' m/s'),
          ForecastValue(
              label: 'sunrise',
              value: Converters().convertDateTime(weather!.city!.sunrise!)),
          ForecastValue(
              label: 'sunset',
              value: Converters().convertDateTime(weather!.city!.sunset!)),
          ForecastValue(
              label: 'humidity',
              value: weather!.list![0].main!.humidity!.toString() + '%')
        ],
      ),
    );
  }
}
