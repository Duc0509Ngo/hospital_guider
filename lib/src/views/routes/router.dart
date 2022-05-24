import 'package:flutter/material.dart';
import 'package:hospital_guider/src/views/screens/avaliable_hours_screen.dart';
import 'package:hospital_guider/src/views/screens/home_screen.dart';
import 'package:hospital_guider/src/views/screens/online_register_screen.dart';
import 'package:hospital_guider/src/views/screens/payment_screen.dart';

class RouterNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.homeScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case OnlineRegisterScreen.onlineRegisterScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const OnlineRegisterScreen(),
        );

      case AvailableHoursScreen.availableHoursScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const AvailableHoursScreen(),
        );
      

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
