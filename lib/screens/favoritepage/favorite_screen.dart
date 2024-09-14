import 'package:flutter/material.dart';
import 'package:football_master/screens/favoritepage/favorite_controller.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  final FavoritePageController favoriteController = Get.find<FavoritePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(),
     body: Text("Favorite"),
    );
  }
}

