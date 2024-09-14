import 'package:flutter/material.dart';
import 'package:football_master/screens/playerpage/player_controller.dart';
import 'package:get/get.dart';

class PlayerScreen extends StatelessWidget {
  PlayerScreen({Key? key}) : super(key: key);

  final PlayerPageController controller = Get.find<PlayerPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text("Player"),
    );
  }
}

