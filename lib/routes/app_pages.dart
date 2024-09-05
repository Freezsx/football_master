import 'package:football_master/screens/homepage/home_binding.dart';
import 'package:football_master/screens/homepage/home_screen.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Route.HOMEVIEW_PAGE;

  static final routes = [
    GetPage(
      name: Path.HOMEVIEW_PAGE,
      page: () => HomeScreen(),
      binding: HomeBinding(),  // Bind HomeController here
      transition: Transition.noTransition,
    ),
  ];
}
