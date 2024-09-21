// ignore_for_file: public_member_api_docs

import '../../../Extensions/Extensions.dart';
import '../../../core/constants/constants.dart';
import '../Model.dart';
import 'weather.dart';
/// HourlyWeather
class HourlyWeather extends Model {
  final String cod;
  final int message;
  final int cnt;
  final List<WeatherEntry> list;
  final City? city;
/// constructor
   HourlyWeather({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory HourlyWeather.fromJson(Json json) {
    return HourlyWeather(
      cod: json['cod'] ?? '',
      message: json['message'] ?? 0,
      cnt: json['cnt'] ?? 0,
      list: (json['list'] as List<dynamic>)
          .map((entry) => WeatherEntry.fromJson(entry))
          .toList(),
      city: json['city'] != null ? City.fromJson(json['city']) : null,
    );
  }

  @override
  Json get toJson {
    return {
      'cod': cod,
      'message': message,
      'cnt': cnt,
      'list': list.map((entry) => entry.toJson).toList(),
      'city': city?.toJson,
    };
  }

  @override
  HourlyWeather copyWith({
    String? cod,
    int? message,
    int? cnt,
    List<WeatherEntry>? list,
    City? city,
  }) =>
      HourlyWeather(
        cod: cod ?? this.cod,
        message: message ?? this.message,
        cnt: cnt ?? this.cnt,
        list: list ?? this.list,
        city: city ?? this.city,
      );
}

class WeatherEntry extends Model {
  final int dt;
  final Main main;
  final List<WeatherData> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final dynamic pop;
  final Sys? sys;
  final Rain? rain;
  final String dtTxt;
/// constructor
   WeatherEntry({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.rain,
    required this.dtTxt,
  });

  /// fromJson
  factory WeatherEntry.fromJson(Json json) {
    print(json['weather']);
    return WeatherEntry(
      dt: json.safeInt('dt'),
      main: Main.fromJson(json['main']),
     
      weather:json['weather']!=null? (json['weather'] as List<dynamic>)
          .map((weatherData) => WeatherData.fromJson(weatherData))
          .toList():[],
      clouds: Clouds.fromJson(json['clouds']),
      wind: Wind.fromJson(json['wind']),
      visibility: json['visibility'] ?? 0,
      pop: json['pop'] ?? 0.0,
      sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null,
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      dtTxt: json['dt_txt'],
    );
  }

  @override
  Json get toJson {
    return {
      'dt': dt,
      'main': main.toJson,
      'weather': weather.map((weatherData) => weatherData.toJson).toList(),
      'clouds': clouds.toJson,
      'wind': wind.toJson,
      'visibility': visibility,
      'pop': pop,
      'sys': sys?.toJson,
      'rain': rain?.toJson,
      'dt_txt': dtTxt,
    };
  }

  @override
  WeatherEntry copyWith({
    int? dt,
    Main? main,
    List<WeatherData>? weather,
    Clouds? clouds,
    Wind? wind,
    int? visibility,
    dynamic pop,
    Sys? sys,
    Rain? rain,
    String? dtTxt,
  }) =>
      WeatherEntry(
          dt: dt ?? this.dt,
          main: main ?? this.main,
          weather: weather ?? this.weather,
          clouds: clouds ?? this.clouds,
          wind: wind ?? this.wind,
          visibility: visibility ?? this.visibility,
          pop: pop ?? this.pop,
          sys: sys ?? this.sys,
          rain: rain ?? this.rain,
          dtTxt: dtTxt ?? this.dtTxt);
}
/// main
class Main extends Model {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;
/// constructor
   Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  /// fromJson
  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
      humidity: json['humidity'],
      tempKf: json['temp_kf'].toDouble(),
    );
  }

  @override
  Json get toJson {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'sea_level': seaLevel,
      'grnd_level': grndLevel,
      'humidity': humidity,
      'temp_kf': tempKf,
    };
  }

  @override
  Main copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? seaLevel,
    int? grndLevel,
    int? humidity,
    double? tempKf,
  }) =>
      Main(
        temp: temp ?? this.temp,
        feelsLike: feelsLike??this.feelsLike,
        tempMin: tempMin??this.tempMin,
        tempMax: tempMax??this.tempMax,
        pressure: pressure??this.pressure,
        seaLevel: seaLevel??this.seaLevel,
        grndLevel: grndLevel??this.seaLevel,
        humidity: humidity??this.humidity,
        tempKf: tempKf??this.tempKf,
      );
}
/// clouds
class Clouds extends Model {
  final int all;
/// constructor
   Clouds({
    required this.all,
  });
/// fromJson
  factory Clouds.fromJson(Json json) {
    return Clouds(
      all: json.safeInt('all'),
    );
  }

  @override
  Json get toJson {
    return {
      'all': all,
    };
  }

  @override
  Clouds copyWith({
    int? all,
  }) =>
      Clouds(
        all: all ?? this.all,
      );
}

/// wind  
class Wind  extends Model{
  final double speed;
  final int deg;
  final double gust;
/// constructor
   Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });
/// fromJson
  factory Wind.fromJson(Json json) {
    return Wind(
      speed: json.safeDouble('speed'),
      deg: json.safeInt('deg'),
      gust: json.safeDouble('gust'),
    );
  }

  @override
  Json get toJson {
    return {
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }

  @override
  Wind copyWith({
    double? speed,
    int? deg,
    double? gust,
  }) =>
      Wind(
        speed: speed ?? this.speed,
        deg: deg ?? this.deg,
        gust: gust ?? this.gust,
      );
}

class City extends Model{
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      coord: Coord.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }

  @override
  Json get toJson {
    return {
      'id': id,
      'name': name,
      'coord': coord.toJson,
      'country': country,
      'population': population,
      'timezone': timezone,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  @override
  City copyWith({
    int? id,
    String? name,
    Coord? coord,
    String? country,
    int? population,
    int? timezone,
    int? sunrise,
    int? sunset,
  }) =>
      City(
        id: id ?? this.id,
        name: name ?? this.name,
        coord: coord ?? this.coord,
        country: country ?? this.country,
        population: population ?? this.population,
        timezone: timezone ?? this.timezone,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
      );
}

/// coordinates
class Coord extends Model{
  final double lat;
  final double lon;
/// constructor
   Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(Json json) {
    return Coord(
      lat: json.safeDouble('lat'),
      lon: json.safeDouble('lon'),
    );
  }

  @override
  Json get toJson {
    return {
      'lat': lat,
      'lon': lon,
    };
  }

  @override
  Coord copyWith({
    double? lat,
    double? lon,
  }) =>
      Coord(
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
      );
}

class Rain extends Model{
  final double threeHours;

   Rain({
    required this.threeHours,
  });

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(threeHours: json['3h'] ?? 0.0);
  }

  @override
  Json get toJson {
    return {
      '3h': threeHours,
    };
  }

  @override
  Rain copyWith({
    double? threeHours,
  }) =>
      Rain(
        threeHours: threeHours ?? this.threeHours,
      );
}


class Sys extends Model{
  final String pod;

   Sys({
    required this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      pod: json['pod'] ?? '',
    );
  }

  @override
  Json get toJson {
    return {
      'pod': pod,
    };
  }

  @override
  Sys copyWith({
    String? pod,
  }) =>
      Sys(
        pod: pod ?? this.pod,
      );
}
