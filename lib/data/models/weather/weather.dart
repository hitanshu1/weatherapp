
// ignore_for_file: public_member_api_docs

import '../../../Extensions/Extensions.dart';
import '../../../core/constants/constants.dart';
import '../Model.dart';
import '../http/httpResult.dart';
/// weather model 
class WeatherModel extends Model {
  final Coord coord;
  final List<WeatherData> weather;
  final String base;
  final Main main;
  final int? visibility;
  final Wind wind;
  final Rain? rain;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    this.visibility,
    required this.wind,
    this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherModel.fromJson(Json json) {
    print(json);
   return  WeatherModel(
     coord: json['coord']!=null?Coord.fromJson(json['coord'] as Map<String, dynamic>):Coord(lon: 0, lat: 0),
     weather: json['weather']!=null?(json['weather'] as List<dynamic>)
         .map((e) => WeatherData.fromJson(e as Map<String, dynamic>))
         .toList():[],
     base: json['base'].toString(),
     /// check if json['main'] is null and map it to Main model
     main:  Main.fromJson(json['main'] as Map<String, dynamic>),
     visibility: json['visibility'] ?? 0,
     wind: json['wind']!=null?Wind.fromJson(json['wind'] as Map<String, dynamic>):
     Wind(speed: 0, deg: 0),
     rain: json['rain'] != null
         ? Rain.fromJson(json['rain'] as Map<String, dynamic>)
         : null,
     clouds: json['clouds']!=null?Clouds.fromJson(json['clouds'] as Map<String, dynamic>):
     Clouds(all: 0),
     dt: json['dt']??0,
     sys:json['sys']!=null? Sys.fromJson(json['sys'] as Map<String, dynamic>):
     Sys(type: 0, id: 0, country: '', sunrise: 0, sunset: 0),
     timezone: json['timezone']??0,
     id: json['id'] as int,
     name: json['name']??'',
     cod: json['cod']??0,
   );
  }

  @override
  Json get toJson {
    return {
      'coord': coord.toJson,
      'weather': weather.map((e) => e.toJson).toList(),
      'base': base,
      'main': main.toJson,
      'visibility': visibility,
      'wind': wind.toJson,
      'rain': rain?.toJson,
      'clouds': clouds.toJson,
      'dt': dt,
      'sys': sys.toJson,
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
    };
  }

  @override
  WeatherModel copyWith({
    Coord? coord,
    List<WeatherData>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Rain? rain,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) =>
      WeatherModel(
        coord: coord ?? this.coord,
        weather: weather ?? this.weather,
        base: base ?? this.base,
        main: main ?? this.main,
        visibility: visibility ?? this.visibility,
        wind: wind??this.wind,
        rain: rain??this.rain,
        clouds: clouds??this.clouds,
        dt: dt ?? this.dt,
        sys:sys??this.sys,
        timezone: timezone??this.timezone,
        id: id??this.id,
        name: name??this.name,
        cod: cod??this.cod,
      );
}

class Coord  extends Model{
  final double lon;
  final double lat;

   Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json['lon'] as double,
        lat: json['lat'] as double,
      );

  @override
  Json get toJson {
    return {
      'lon': lon,
      'lat': lat,
    };
  }

  @override
  Coord copyWith({
    double? lon,
    double? lat,
  }) =>
      Coord(
        lon: lon ?? this.lon,
        lat: lat ?? this.lat,
      );
}

class WeatherData extends Model {
  final int id;
  final String main;
  final String description;
  final String icon;

   WeatherData({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        id: json['id'] as int,
        main: json['main'] as String,
        description: json['description'] as String,
        icon: json['icon'] as String,
      );

  @override
  Json get toJson {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  @override
  WeatherData copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) =>
      WeatherData(
        id: id ?? this.id,
        main: main ?? this.main,
        description: description ?? this.description,
        icon: icon ?? this.icon,
      );
}

class Main extends Model{
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;
  final int? visibility;

   Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
    this.visibility,
  });

  factory Main.fromJson(Json json) => Main(
        temp: json['temp'] as double,
        feelsLike: json.safeDouble('feels_like'),
        tempMin: json.safeDouble('temp_min'),
        tempMax: json.safeDouble('temp_max'),
        pressure: json['pressure'],
        humidity: json['humidity'],
        seaLevel: json['sea_level'],
        grndLevel: json['grnd_level'],
        visibility: json['visibility'],
      );

  @override
  Json get toJson {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'sea_level': seaLevel,
      'grnd_level': grndLevel,
      'visibility': visibility,
    };
  }

  @override
  Main copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? grndLevel,
    int? visibility,  
  }) =>
      Main(
        temp: temp ?? this.temp,
        feelsLike: feelsLike??this.feelsLike,
        tempMin: tempMin??this.tempMin,
        tempMax: tempMax??this.tempMax,
        pressure: pressure??this.pressure,
        humidity: humidity??this.humidity,
        seaLevel: seaLevel??this.seaLevel,
        grndLevel: grndLevel??this.seaLevel,
        visibility: visibility??this.visibility,
      );
}

class Wind extends Model {
  final double speed;
  final int deg;
  final double? gust;

   Wind({
    required this.speed,
    required this.deg,
    this.gust,
  });

  factory Wind.fromJson(Json json) => Wind(
        speed: json.safeDouble('speed'),
        deg: json['deg'] ?? 0,
        gust: json.safeDouble('gust'),
      );

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


class Rain extends Model{
  final double? oneHour;

   Rain({this.oneHour});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(oneHour: json['oneHour'] ?? 0.0);
  }

  @override
  Json get toJson {
    return {
      'oneHour': oneHour,
    };
  }

  @override
  Rain copyWith({
    double? oneHour,
  }) =>
      Rain(
        oneHour: oneHour ?? this.oneHour,
      );
}

class Clouds extends Model{
  final int all;

   Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(all: json['all'] ?? 0);
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

class Sys extends Model{
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

   Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json['type'] ?? 0,
        id: json['id'] ?? 0,
        country: json['country'] ?? '',
        sunrise: json['sunrise'] ?? 0,
        sunset: json['sunset'] ?? 0,
      );

  @override
  Json get toJson {
    return {
      'type': type,
      'id': id,
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  @override
  Sys copyWith({
    int? type,
    int? id,
    String? country,
    int? sunrise,
    int? sunset,
  }) =>
      Sys(
        type: type ?? this.type,
        id: id ?? this.id,
        country: country ?? this.country,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
      );
}
