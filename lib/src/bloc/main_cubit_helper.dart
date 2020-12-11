import 'package:flutter/material.dart';
import 'package:weather_app/src/bloc/main_state.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/screens/favorite_city_screen.dart';
import 'package:weather_app/src/screens/home_screen.dart';
import 'package:weather_app/src/screens/city_screen.dart';

class MainCubitHelper {
  Widget mainWidget(MainState state, List<Weather> weatherList) {
    Widget widget;
    switch(state.toString()){
      case('InitialState'):
        {
          widget = HomeScreen();
          return widget;
        }
        break;
      case('HomeScreenState'):
        {
          widget = HomeScreen();
          return widget;
        }
        break;
      case('LoadingState'):
        {
          widget = Center(
            child: CircularProgressIndicator(),
          );
          return widget;
        }
        break;
      case('CityScreenState'):
        {
          CityScreenState cityScreenState = state as CityScreenState;
          widget = CityScreen(cityScreenState.weather, weatherList);
          return widget;
        }
        break;
      case('FavoriteCityScreenState'):
        {
          widget = FavoriteCityScreen(weatherList);
          return widget;
        }
        break;
      default: {
        return Container();
      }
      break;
    }
  }
}