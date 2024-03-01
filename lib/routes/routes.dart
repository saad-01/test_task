import 'package:get/get.dart';
import 'package:task/screens/home_screen.dart';
import 'package:task/screens/splash_screen.dart';

import 'route_names.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashPage,
          page: () => const SplashScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RouteName.homePage,
          page: () => const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.rightToLeft,
        ),
      ];
}
