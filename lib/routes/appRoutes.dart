import 'package:flutter/material.dart';

import '../presentation/pages/dashboard/page.dart';


/// app routes
class AppRoutes {
  AppRoutes._();

  /// initial route
  static const String initialRoute = '/';
/// home route
  static const String home = '/homes';
  

  /// Generates a route based on the given [RouteSettings].
  ///
  /// The [settings] parameter contains the name of the route to be generated.
  /// The function returns a [Route] object that represents the generated route.
  ///
  /// The function uses a switch statement to determine the type of route to be generated based on the [settings.name].
  /// If the [settings.name] is equal to [initialRoute], it returns a [MaterialPageRoute] that builds a [const AuthBuilder].
  /// If the [settings.name] does not match any of the above cases, it returns a [MaterialPageRoute] that builds a [Scaffold] with a [Center] widget displaying the text 'Unknown route: ${settings.name}'.
  ///
  /// Parameters:
  /// - `settings` (RouteSettings): The settings for the route to be generated.
  ///
  /// Returns:
  /// - `Route<dynamic>`: The generated route.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
              builder: (_) => const DashBoardPage(),
            );

      
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Unknown route: ${settings.name}')),
          ),
        );
    }
  }
}
