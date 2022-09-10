class SearchModel{
  final WeatherLocation location;
  final WeatherCurrent current;
  final WeatherForecast forecast;

  SearchModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
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

  WeatherLocation({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
  });

  factory WeatherLocation.fromJson(Map<String, dynamic> json) {
    return WeatherLocation(
      name: json['name'] as String,
      country: json['country'] as String,
      lat: json['lat'] as double,
      lon: json['lon'] as double,
    );
  }
}

class WeatherCurrent {
  final double tempC;
  final String condition;


  WeatherCurrent({
    required this.tempC,
    required this.condition,
  });

  factory WeatherCurrent.fromJson(Map<String, dynamic> json) {
    return WeatherCurrent(
      tempC: json['temp_c'] as double,
      condition: json['condition']['text'] as String,
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