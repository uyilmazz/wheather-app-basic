import 'package:dio/dio.dart';
import 'package:wheatherapp/model/weather.dart';

class WeatherService {
  Dio dio = Dio();

  final String apiKey = 'de1c118b7bfd3a09e156bb98888dbbfb';
  final String baseUrl = "https://api.openweathermap.org";

  Uri _buildUri(String endpoint, Map<String, String>? queryParameters) {
    var query = {'appid': apiKey};
    if (queryParameters != null) {
      query = query..addAll(queryParameters);
    }
    var uri = Uri(
      scheme: 'http',
      host: 'api.openweathermap.org',
      path: 'data/2.5/$endpoint',
      queryParameters: query,
    );
    return uri;
  }

  Future<Weather?> getWeather(String cityName) async {
    var response = await dio.getUri(_buildUri('forecast', {'q': cityName}));
    if (response.statusCode == 200) {
      return Weather.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<Weather?> getWeatherWithLocation(double lat, double lon) async {
    final response = await dio.getUri(
        _buildUri('forecast', {'lat': lat.toString(), 'lon': lon.toString()}));
    if (response.statusCode == 200) {
      return Weather.fromJson(response.data);
    } else {
      return null;
    }
  }
}
