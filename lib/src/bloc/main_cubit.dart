import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/models/weather_model.dart';

import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(InitialState());

  Future<void> toHomeScreen() async {
    emit(HomeScreenState());
  }

  Future<void> toCityScreen(String city) async {
    emit(LoadingState());
    Response response;
    Weather weather;
    Dio dio = new Dio();
    dio.options.headers["key"] = "fec8227515f34e98993221332200812";
    response = await dio.get('https://api.weatherapi.com/v1/current.json?q=$city',);
    if(response.statusCode == 200) {
      weather = Weather.fromJson(response.data);
      print(response.data);
    } else {
      print("Invalid data");
    }
    emit(CityScreenState(weather));
  }

  Future<void> toFavoriteCityScreen() async {
    emit(FavoriteCityScreenState());
  }
}
