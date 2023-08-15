// ignore_for_file: prefer_typing_uninitialized_variables

class WeatherModel {
  final currentWeather;
  final hourly;

  WeatherModel({
    required this.currentWeather,
    required this.hourly,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    final currentWeather = data["current_weather"] as Map<String, dynamic>;
    final hourly = data["hourly"] as Map<String, dynamic>;
    return WeatherModel(currentWeather: currentWeather, hourly: hourly);
  }
}

class CurrentWeather {
  final double temperature;
  final double windSpeed;
  final double weatherCode;
  final int windDirection;
  final int isDay;

  CurrentWeather({
    required this.temperature,
    required this.windSpeed,
    required this.weatherCode,
    required this.windDirection,
    required this.isDay,
  });

  factory CurrentWeather.fromJason(Map<String, dynamic> data) {
    final temperature = data['temperature'] as double;
    final windSpeed = data['windspeed'] as double;
    final weatherCode = data['weathercode'] as double;
    final windDirection = data['winddirection'] as int;
    final isDay = data['isDay'] as int;

    return CurrentWeather(
      temperature: temperature,
      windSpeed: windSpeed,
      weatherCode: weatherCode,
      windDirection: windDirection,
      isDay: isDay,
    );
  }
}

class HourlyCast {
  final List<String> time;
  final List<double> temperature;

  HourlyCast({
    required this.time,
    required this.temperature,
  });

  factory HourlyCast.fromJson(Map<String, dynamic> data) {
    final List<String> time = data['time'] as List<String>;
    final List<double> temperature = data['temperature'] as List<double>;
    return HourlyCast(
      time: time,
      temperature: temperature,
    );
  }
}
