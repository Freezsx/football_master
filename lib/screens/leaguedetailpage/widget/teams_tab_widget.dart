import 'package:flutter/material.dart';
import 'package:football_master/models/football_model.dart';
import 'package:football_master/screens/leaguedetailpage/league_detail_controller.dart';
import 'package:football_master/screens/leaguedetailpage/widget/team_card_widget.dart';
import 'package:get/get.dart';

class TeamsTab extends StatelessWidget {
  final LeagueDetailController controller;

  const TeamsTab({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: controller.infoFootballModel.length,
      itemBuilder: (context, leagueIndex) {
        final league = controller.infoFootballModel[leagueIndex];
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${league.teams?.first.strLeague ?? ''}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                if (league.teams != null && league.teams!.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: league.teams!.length,
                    itemBuilder: (context, teamIndex) {
                      final team = league.teams![teamIndex];
                      return TeamCard(team: team);
                    },
                  )
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'No teams available',
                      style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
