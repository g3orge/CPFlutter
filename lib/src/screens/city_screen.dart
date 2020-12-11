import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/bloc/main_cubit.dart';
import 'package:weather_app/src/models/weather_model.dart';

class CityScreen extends StatefulWidget {
  Weather weather;
  List<Weather> weatherList;

  CityScreen(this.weather, this.weatherList);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  Weather get weather => widget.weather;
  List<Weather> get weatherList => widget.weatherList;

  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "WEATHER APP",
              style: TextStyle(fontSize: 34, color: Color(0xFF1BB5FD)),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFF1BB5FD), width: 1)),
              child: TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  labelText: "City",
                  labelStyle: TextStyle(color: Color(0xFF1BB5FD), fontSize: 16),
                ),
                style: TextStyle(color: Color(0xFF1BB5FD), fontSize: 18),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                BlocProvider.of<MainCubit>(context).toCityScreen(cityController.text);
              },
              child: Container(
                width: double.infinity,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF1BB5FD),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text(
                  "Get weather",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Card(
              elevation: 3,
              child: Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "time: ${weather.current.lastUpdated}",
                      style: TextStyle(
                        color: Color(0xFF1BB5FD),
                        fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "city: ${weather.location.name}",
                      style: TextStyle(
                          color: Color(0xFF1BB5FD),
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "temperature: ${weather.current.tempC}",
                      style: TextStyle(
                          color: Color(0xFF1BB5FD),
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "condition: ${weather.current.condition.text}",
                      style: TextStyle(
                          color: Color(0xFF1BB5FD),
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "wind speed: ${weather.current.windKph}",
                      style: TextStyle(
                          color: Color(0xFF1BB5FD),
                          fontSize: 20
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                weatherList.add(weather);
              },
              child: Container(
                height: 70,
                width: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xFF1BB5FD),
                    borderRadius: BorderRadius.circular(35)
                ),
                child: Icon(Icons.star, color: Colors.white,size: 40,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
