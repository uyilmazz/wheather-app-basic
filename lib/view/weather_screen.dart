import 'package:flutter/material.dart';
import 'package:wheatherapp/utils/converts.dart';
import 'package:wheatherapp/utils/extension.dart';
import 'package:wheatherapp/widgets/forecast_horizontal.dart';
import 'package:wheatherapp/view_model/weather_view_model.dart';
import 'package:get/get.dart';
import 'package:wheatherapp/widgets/other_info.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final Controller _getController = Get.put(Controller());
  final String iconBaseURL = "https://openweathermap.org/img/wn/";
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getWeatherWithLocation();
  }

  Future<void> getWeatherWithLocation() async {
    await _getController.getWeatherWithLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(() => Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: buildAppBar,
              body: _getController.state.value == WeatherState.stateLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _getController.state.value == WeatherState.errorState
                      ? const Center(child: Text('Something happend'))
                      : _getController.state.value ==
                              WeatherState.stateInitialize
                          ? const Center(
                              child: Text('App initializing'),
                            )
                          : buildWeatherColumn,
            )));
  }

  Widget get buildWeatherColumn => Center(
        child: Padding(
          padding: EdgeInsets.only(top: context.dynamicHeight(0.1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 13, child: buildMainWeather),
              Divider(color: Colors.grey.shade400, thickness: 1),
              Expanded(
                  flex: 4,
                  child: ForecastHorizontal(
                      weather: _getController.weather.value)),
              const Divider(color: Colors.grey, thickness: 1),
              Expanded(
                  flex: 3,
                  child: OtherInfo(weather: _getController.weather.value))
            ],
          ),
        ),
      );

  AppBar get buildAppBar => AppBar(
        leading: _getController.isSearching.value
            ? buildSearchBackButton
            : const SizedBox(),
        title: _getController.isSearching.value
            ? buildSearchTextField
            : Text(Converters().currentDateTime(),
                style: context.maxMinTempatureTitleValue()),
        centerTitle: true,
        actions: [buildSearchButton],
      );

  Widget get buildSearchBackButton => IconButton(
      onPressed: () {
        _getController.changeSearching();
      },
      icon: const Icon(Icons.arrow_back_sharp, color: Colors.black));

  Widget get buildSearchTextField => TextField(
        controller: _textController,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: "Search City...",
          border: InputBorder.none,
        ),
      );

  Widget get buildSearchButton => IconButton(
      onPressed: () async {
        if (_getController.isSearching.value) {
          final response =
              await _getController.updateWeather(_textController.text.trim());
          if (!response) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('City not Found')));
          }
        } else {
          _getController.changeSearching();
        }
      },
      icon: const Icon(
        Icons.search,
        color: Colors.black,
      ));

  Widget get buildMainWeather => Obx(() =>
      Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
            flex: 2,
            child: Text(
                Converters()
                    .nullControl(_getController.weather.value!.city!.name),
                style: context.cityName())),
        Expanded(
            flex: 2,
            child: Text(
                Converters().nullControl(_getController
                    .weather.value!.list![0].weather![0].description),
                style: context.weatherDescription())),
        Expanded(
            flex: 2,
            child: Image(
                fit: BoxFit.contain,
                image: NetworkImage(
                    "$iconBaseURL${_getController.weather.value!.list![0].weather![0].icon}.png"))),
        Expanded(
            flex: 5,
            child: Text(
                Converters().valueToStringTemp(
                    _getController.weather.value!.list![0].main!.temp),
                style: context.mainTempature())),
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: 2, child: buildMinMaxTemperature()),
      ]));

  Widget buildMinMaxTemperature() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: [
          Text('max', style: context.maxMinTempatureTitle()),
          SizedBox(height: context.dynamicHeight(0.01)),
          Text(
              Converters().valueToStringTemp(
                  _getController.weather.value!.list![0].main!.tempMax),
              style: context.maxMinTempatureTitleValue())
        ]),
        SizedBox(width: context.dynamicWidth(0.02)),
        Container(height: 35, width: 1, color: Colors.grey),
        SizedBox(width: context.dynamicWidth(0.02)),
        Column(children: [
          Text('min', style: context.maxMinTempatureTitle()),
          SizedBox(height: context.dynamicHeight(0.01)),
          Text(
              Converters().valueToStringTemp(
                  _getController.weather.value!.list![0].main!.tempMin),
              style: context.maxMinTempatureTitleValue())
        ]),
      ],
    );
  }
}
