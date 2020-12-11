import 'package:flutter/material.dart';
import 'package:weather_app/src/models/weather_model.dart';

@immutable
abstract class MainState {}

class InitialState extends MainState {
  @override
  String toString() => 'InitialState';
}

class HomeScreenState extends MainState {
  @override
  String toString() => 'HomeScreenState';
}

class CityScreenState extends MainState {

  Weather weather;

  CityScreenState(this.weather);

  @override
  String toString() => 'CityScreenState';
}

class FavoriteCityScreenState extends MainState {
  @override
  String toString() => 'FavoriteCityScreenState';
}

class LoadingState extends MainState {
  @override
  String toString() => 'LoadingState';
}
