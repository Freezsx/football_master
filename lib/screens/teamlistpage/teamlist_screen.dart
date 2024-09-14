import 'package:flutter/material.dart';
import 'package:football_master/screens/teamlistpage/teamlist_controller.dart';
import 'package:get/get.dart';

class TeamListScreen extends StatelessWidget {
  TeamListScreen({Key? key}) : super(key: key);

  final TeamListPageController controller = Get.find<TeamListPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text("ListTeam"),
    );
  }
}

