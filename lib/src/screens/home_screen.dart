import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height*0.5,
        width: MediaQuery.of(context).size.width*0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "WEATHER APP",
              style: TextStyle(
                fontSize: 34,
                color: Color(0xFF1BB5FD)
              ),
            ),
            Image.asset('assets/planet.png'),
            Text(
              "Weather app is an online application, where u can check weather in cities all over the world.",
              style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF1BB5FD)
              ),
            )
          ],
        ),
      ),
    );
  }
}
