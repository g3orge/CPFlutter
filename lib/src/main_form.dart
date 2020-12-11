import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/bloc/main_cubit.dart';
import 'package:weather_app/src/bloc/main_cubit_helper.dart';
import 'package:weather_app/src/bloc/main_state.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/screens/widgets/side_bar.dart';

class MainForm extends StatefulWidget {
  MainForm({Key key}) : super(key: key);

  @override
  _MainFormState createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  MainCubit _mainCubit;
  MainCubitHelper _helper;

  List<Weather> weatherList = List();

  @override
  void initState() {
    super.initState();
    _mainCubit = BlocProvider.of<MainCubit>(context);
    _helper = MainCubitHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocListener(
          cubit: _mainCubit,
          listener: (BuildContext context, MainState state) {},
          child: BlocBuilder(
            cubit: _mainCubit,
            builder: (BuildContext context, MainState state) {
              return _helper.mainWidget(state, weatherList);
            },
          ),
        ),
        SideBar(),
      ],
    );
  }
}
