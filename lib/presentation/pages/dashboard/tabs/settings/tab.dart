import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Widgets/Widgets.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/getStorage.dart';
import '../../../../bloc/weather/bloc.dart';
import '../../../../bloc/weather/event.dart';

/// Settings Tab
class SettingsTab extends StatefulWidget {
  ///constructor
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool celsius = false;
  @override
  void initState() {
    celsius = AppGetXStorage.getIsCelsius();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SwitchListTile(
            title: Txt.title(
              'Celsius/Fahrenheit',
            ),
            value: celsius,
            hoverColor: Colorz.white,
            activeColor: Colorz.white,
            activeTrackColor: Colorz.green,
            inactiveThumbColor: Colorz.grey,
            inactiveTrackColor: Colorz.grey,
            onChanged: (value) {
              setState(() {
                celsius = value;
              });
             context.read<WeatherBloc>().add(ChangeSettingTempUnit(celsius));
              // Update preference
            },
          ),
          // Add other settings here
        ],
      ),
    );
  }
}
