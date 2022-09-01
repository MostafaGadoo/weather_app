class WeatherModel{
  late WeatherCoord coord;
  late String? base;
  late WeatherMain? main;
  late int? visibility;
  late WeatherWind? wind;
  late String? name;

  WeatherModel({
   required this.coord,
   required this.base,
   required this.main,
   required this.visibility,
   required this.wind,
   required this.name,
});
  WeatherModel.fromJson(Map<String, dynamic> json){
    coord = json['coord'];
    base = json['base'];
    main = json['main'];
    visibility = json['visibility'];
    wind = json['wind'];
    name = json['name'];
  }
}

class WeatherCoord {
  late String? lon;
  late String lat;

  // WeatherCoord({required this.lon,required this.lat});

  WeatherCoord.fromJson(Map<String, dynamic> json){
    lon = json['lon'];
    lat = json['lat'];
  }
}

class WeatherMain{
  late int temp;
  late int feels_like;
  late int temp_min;
  late int temp_max;
  late int pressure;
  late int humidity;

  WeatherMain({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.humidity,
});

  WeatherMain.fromJson(Map<String, dynamic> json){
    temp = json['temp'];
    feels_like = json['feels_like'];
    temp_min = json['temp_min'];
    temp_max = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
}

class WeatherWind{
  late int speed;
  late int deg;

  WeatherWind({
    required this.speed,
    required this.deg,
});
  WeatherWind.fromJson(Map<String, dynamic> json){
    speed = json['speed'];
    deg = json['deg'];
  }
}