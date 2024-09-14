import 'package:football_master/navigation/bottom_navbar.dart';
import 'package:football_master/screens/favoritepage/favorite_binding.dart';
import 'package:football_master/screens/favoritepage/favorite_screen.dart';
import 'package:football_master/screens/homepage/home_binding.dart';
import 'package:football_master/screens/homepage/home_screen.dart';
import 'package:football_master/screens/playerpage/player_binding.dart';
import 'package:football_master/screens/playerpage/player_screen.dart';
import 'package:football_master/screens/screen.dart';
import 'package:football_master/screens/teamlistpage/teamlist_binding.dart';
import 'package:get/get.dart';
import 'package:football_master/navigation/routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(name: Routes.NAVBAR, page: () => NavigationMenu(), bindings: [
      HomeBinding(),
      TeamListBinding(),
      PlayerBinding(),
      FavoriteBinding(),
    ]),
    GetPage(
      name: Routes.HOME_PAGE,
      page: () => HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.FAVORITE_PAGE,
      page: () =>  FavoriteScreen(),
      binding: FavoriteBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.TEAMLIST_PAGE,
      page: () =>  TeamListScreen(),
      binding: TeamListBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.PLAYER_PAGE,
      page: () =>  PlayerScreen(),
      binding: PlayerBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
