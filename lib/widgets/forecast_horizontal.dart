import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wheatherapp/utils/converts.dart';
import 'package:wheatherapp/utils/extension.dart';
import 'package:wheatherapp/model/weather.dart';
import 'package:wheatherapp/widgets/forecast_value.dart';
import 'package:intl/intl.dart';

class ForecastHorizontal extends StatelessWidget {
  final Weather? weather;

  const ForecastHorizontal({Key? key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return weather == null
        ? const Center(
            child: Text('Weather is empty'),
          )
        : Container(
            padding:
                EdgeInsets.symmetric(horizontal: context.dynamicHeight(0.015)),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weather!.list!.length,
                itemBuilder: (context, index) {
                  final currentForecast = weather!.list![index];
                  return ForecastValue(
                    label: DateFormat('E, ha').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            currentForecast.dt! * 1000)),
                    value: Converters()
                            .convertCelcius(currentForecast.main!.temp!)
                            .toString() +
                        '°',
                    icon: currentForecast.weather![0].icon,
                  );
                }));
  }
}
