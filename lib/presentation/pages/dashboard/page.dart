import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/constants.dart';
import '../../bloc/dashboard/bloc.dart';
import '../../bloc/dashboard/state.dart';
import 'navigationBar.dart';
import 'tabs/forecast/tab.dart';

import 'tabs/settings/tab.dart';
import 'tabs/weather/tab.dart';

/// Dashboard Page
/// it contains all four tabs
class DashBoardPage extends StatelessWidget {
  /// constructor
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Padding(
        padding: SizeConfig.pagePadding,
        child: _tabs(),
      )),
      bottomNavigationBar: const DashboardNavigationBar(),
    );
  }

  /// tab
  Widget _tabs() {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return  IndexedStack(
          index: state.currentIndex,
          children: const [
            WeatherTab(),
            DashboardForecastTab(),
            
            SettingsTab(),
          ],
        );
      },
    );
  }
}
