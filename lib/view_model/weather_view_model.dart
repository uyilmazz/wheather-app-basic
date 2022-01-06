import 'package:get/get.dart';
import 'package:wheatherapp/model/weather.dart';
import 'package:wheatherapp/service/base_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wheatherapp/utils/location.dart';

enum WeatherState { stateInitialize, stateLoading, stateLoaded, errorState }

class Controller extends GetxController {
  final WeatherService _weatherService = WeatherService();
  final Location _location = Location();
  Rx<WeatherState> state = WeatherState.stateInitialize.obs;

  Rx<Weather?> weather = Weather().obs;
  Rx<bool> isSearching = false.obs;

  Future<bool> updateWeather(String cityName) async {
    try {
      final response = await _weatherService.getWeather(cityName);
      if (response != null) {
        weather.value = response;
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Future<void> getWeatherWithLocation() async {
    try {
      state.value = WeatherState.stateLoading;
      Position? _position = await _location.getPosition();
      if (_position != null) {
        weather.value = await _weatherService.getWeatherWithLocation(
            _position.latitude, _position.longitude);
      } else {
        weather.value = await _weatherService.getWeather('london');
      }
      state.value = WeatherState.stateLoaded;
    } catch (e) {
      state.value = WeatherState.errorState;
    }
  }

  void changeSearching() {
    isSearching.value = !isSearching.value;
  }
}
