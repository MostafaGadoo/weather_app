abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppLoadingState extends AppStates{}

class AppGetWeatherLoadingState extends AppStates{}

class AppGetWeatherSuccessState extends AppStates{}

class AppGetWeatherErrorState extends AppStates{
  final String error;

  AppGetWeatherErrorState(this.error);
}

class AppSearchLoadingState extends AppStates{}

class AppSearchWeatherSuccessState extends AppStates{}

class AppSearchWeatherErrorState extends AppStates{
  final String error;

  AppSearchWeatherErrorState(this.error);
}

class AppFavoriteLoadingState extends AppStates{}

class AppFavoriteWeatherSuccessState extends AppStates{}

class AppFavoriteWeatherErrorState extends AppStates{
  final String error;

  AppFavoriteWeatherErrorState(this.error);
}

