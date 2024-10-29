import 'package:flutter/material.dart';
import 'package:football_master/models/football_model.dart';
import 'package:football_master/screens/leaguedetailpage/league_detail_controller.dart';
import 'package:football_master/screens/leaguedetailpage/widget/team_detail_card_widget.dart';
import 'package:get/get.dart';

class DetailsTab extends StatelessWidget {
  final LeagueDetailController controller;

  const DetailsTab({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: controller.infoFootballModel.length,
      itemBuilder: (context, leagueIndex) {
        final league = controller.infoFootballModel[leagueIndex];
        return Column(
          children: league.teams!.map((team) {
            return TeamDetailCard(team: team);
          }).toList(),
        );
      },
    );
  }
}
