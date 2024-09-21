import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/dashboard/bloc.dart';
import '../../bloc/dashboard/event.dart';
import '../../bloc/dashboard/state.dart';

/// Dashboard Navigation Bar
class DashboardNavigationBar extends StatelessWidget {
  /// constructor
  const DashboardNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return  NavigationBar(
          selectedIndex: state.currentIndex,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: Colors.transparent,
          onDestinationSelected: (index) {
            context
                .read<DashboardBloc>()
                .add(OnChangeCurrentIndex( index));
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: Colors.white),
              selectedIcon: Icon(Icons.home, color: Colors.white),
              label: '',
            ),
          
            NavigationDestination(
              icon: Icon(Icons.wb_sunny_outlined, color: Colors.white),
              selectedIcon: Icon(Icons.wb_sunny, color: Colors.white),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined, color: Colors.white),
              selectedIcon: Icon(Icons.settings, color: Colors.white),
              label: '',
            ),
          ],
        );
      },
    );
  }
}
