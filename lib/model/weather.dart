class Weather {
  Weather({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  String? cod;
  int? message;
  int? cnt;
  List<ListElement>? list;
  City? city;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": list == null
            ? null
            : List<dynamic>.from(list!.map((x) => x.toJson())),
        "city": city == null ? null : city!.toJson(),
      };
}

class City {
  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord == null ? null : coord!.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Coord {
  Coord({
    this.lat,
    this.lon,
  });

  double? lat;
  double? lon;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lon: json["lon"] == null ? null : json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

class ListElement {
  ListElement({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.sys,
    this.dtTxt,
    this.rain,
  });

  int? dt;
  MainClass? main;
  List<WeatherElement>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop;
  Sys? sys;
  DateTime? dtTxt;
  Rain? rain;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: json["main"] == null ? null : MainClass.fromJson(json["main"]),
        weather: json["weather"] == null
            ? null
            : List<WeatherElement>.from(
                json["weather"].map((x) => WeatherElement.fromJson(x))),
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"] == null ? null : json["pop"].toDouble(),
        sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
        dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main == null ? null : main!.toJson(),
        "weather": weather == null
            ? null
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "clouds": clouds == null ? null : clouds!.toJson(),
        "wind": wind == null ? null : wind!.toJson(),
        "visibility": visibility,
        "pop": pop,
        "sys": sys == null ? null : sys!.toJson(),
        "dt_txt": dtTxt == null ? null : dtTxt!.toIso8601String(),
        "rain": rain == null ? null : rain!.toJson(),
      };
}

class Clouds {
  Clouds({
    this.all,
  });

  int? all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class MainClass {
  MainClass({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;

  factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"] == null ? null : json["temp"].toDouble(),
        feelsLike:
            json["feels_like"] == null ? null : json["feels_like"].toDouble(),
        tempMin: json["temp_min"] == null ? null : json["temp_min"].toDouble(),
        tempMax: json["temp_max"] == null ? null : json["temp_max"].toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"] == null ? null : json["temp_kf"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
      };
}

class Rain {
  Rain({
    this.the3H,
  });

  double? the3H;

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the3H: json["3h"] == null ? null : json["3h"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "3h": the3H,
      };
}

class Sys {
  Sys({
    this.pod,
  });

  Pod? pod;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: json["pod"] == null ? null : podValues.map![json["pod"]],
      );

  Map<String, dynamic> toJson() => {
        "pod": pod == null ? null : podValues.reverse![pod],
      };
}

enum Pod { D, N }

final podValues = EnumValues({"d": Pod.D, "n": Pod.N});

class WeatherElement {
  WeatherElement({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int? id;
  MainEnum? main;
  String? description;
  String? icon;

  factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        id: json["id"],
        main: json["main"] == null ? null : mainEnumValues.map![json["main"]],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main == null ? null : mainEnumValues.reverse![main],
        "description": description,
        "icon": icon,
      };
}

enum MainEnum { CLEAR, CLOUDS, RAIN }

final mainEnumValues = EnumValues({
  "Clear": MainEnum.CLEAR,
  "Clouds": MainEnum.CLOUDS,
  "Rain": MainEnum.RAIN
});

class Wind {
  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  double? speed;
  int? deg;
  double? gust;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"] == null ? null : json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"] == null ? null : json["gust"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
