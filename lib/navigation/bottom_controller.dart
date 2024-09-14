import 'package:flutter/material.dart';
import 'package:football_master/screens/favoritepage/favorite_screen.dart';
import 'package:football_master/screens/homepage/home_screen.dart';
import 'package:football_master/screens/playerpage/player_screen.dart';
import 'package:football_master/screens/screen.dart';
import 'package:get/get.dart';

class BottomController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  Widget get currentScreen {
    switch (selectedIndex.value) {
      case 0:
        return HomeScreen();
      case 1:
        return TeamListScreen();
      case 2:
        return PlayerScreen();
      case 3:
        return FavoriteScreen();
      default:
        return HomeScreen();
    }
  }
}
