class CurrentWeatherModel {
  final WeatherLocation location;
  final WeatherCurrent current;
  final WeatherForecast forecast;

  CurrentWeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      location: WeatherLocation.fromJson(json['location'] as Map<String, dynamic>),
      current: WeatherCurrent.fromJson(json['current'] as Map<String, dynamic>),
      forecast: WeatherForecast.fromJson(json['forecast'] as Map<String, dynamic>),
    );
  }
}

class WeatherLocation {
  final String name;
  final String country;
  final double lat;
  final double lon;
  final String localtime;

  WeatherLocation({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
    required this.localtime,
  });

  factory WeatherLocation.fromJson(Map<String, dynamic> json) {
    return WeatherLocation(
      name: json['name'] as String,
      country: json['country'] as String,
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      localtime: json['localtime'] as String,
    );
  }
}

class WeatherCurrent {
  final double tempC;
  final double tempF;
  final String condition;
  final double wind_kph;
  final int humidity;
  final double feelslike_c;
  final double uv;
  WeatherCurrent({
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.wind_kph,
    required this.humidity,
    required this.feelslike_c,
    required this.uv,
  });

  factory WeatherCurrent.fromJson(Map<String, dynamic> json) {
    return WeatherCurrent(
      tempC: json['temp_c'] as double,
      tempF: json['temp_f'] as double,
      condition: json['condition']['text'] as String,
      wind_kph: json['wind_kph'] as double,
      humidity: json['humidity'] as int,
      feelslike_c: json['feelslike_c'] as double,
      uv: json['uv'] as double,
    );
  }
}

class WeatherForecast{
  final String forecastday;
  final double maxtemp_c;
  final double mintemp_c;
  final String sunrise;
  final String sunset;

  WeatherForecast({
    required this.forecastday,
    required this.maxtemp_c,
    required this.mintemp_c,
    required this.sunrise,
    required this.sunset,


});

  factory WeatherForecast.fromJson(Map<String, dynamic> json){
    return WeatherForecast(
        forecastday: json['forecastday'][0]['date'] as String,
        maxtemp_c: json['forecastday'][0]['day']['maxtemp_c'] as double,
        mintemp_c: json['forecastday'][0]['day']['mintemp_c'] as double,
        sunrise: json['forecastday'][0]['astro']['sunrise'] as String,
        sunset: json['forecastday'][0]['astro']['sunset'] as String,
    );
  }


}

