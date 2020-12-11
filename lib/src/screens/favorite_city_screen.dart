import 'package:flutter/material.dart';
import 'package:weather_app/src/models/weather_model.dart';

class FavoriteCityScreen extends StatefulWidget {

  List<Weather> weatherList;

  FavoriteCityScreen(this.weatherList);

  @override
  _FavoriteCityScreenState createState() => _FavoriteCityScreenState();
}

class _FavoriteCityScreenState extends State<FavoriteCityScreen> {

  List<Weather> get weatherList => widget.weatherList;

  @override
  void initState() {
    super.initState();
    print(weatherList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        height: double.infinity,
        padding: EdgeInsets.only(top: 70),
        child: ListView.builder(
          itemCount: weatherList.length,
          itemBuilder: (context, index){
            return Card(
              elevation: 3,
              child: Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "time: ${weatherList[index].current.lastUpdated}",
                      style: TextStyle(
                          color: Color(0xFF1BB5FD),
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "city: ${weatherList[index].location.name}",
                      style: TextStyle(
                          color: Color(0xFF1BB5FD),
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "temperature: ${weatherList[index].current.tempC}",
                      style: TextStyle(
                          color: Color(0xFF1BB5FD),
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "condition: ${weatherList[index].current.condition.text}",
                      style: TextStyle(
                          color: Color(0xFF1BB5FD),
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "wind speed: ${weatherList[index].current.windKph}",
                      style: TextStyle(
                          color: Color(0xFF1BB5FD),
                          fontSize: 20
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
