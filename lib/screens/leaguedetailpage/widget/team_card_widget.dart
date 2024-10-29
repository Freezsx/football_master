import 'package:flutter/material.dart';
import 'package:football_master/models/football_model.dart';

class TeamCard extends StatelessWidget {
  final Teams team;

  const TeamCard({required this.team});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: ListTile(
        leading: team.strBadge != null
            ? CircleAvatar(
          backgroundImage: NetworkImage(team.strBadge!),
          radius: 25,
        )
            : Icon(Icons.sports_soccer, size: 40),
        title: Text(
          team.strTeam ?? 'Nama Klub Tidak Tersedia',
          style: TextStyle(fontSize: 18),
        ),
        subtitle: Text(
          'Team ID: ${team.idTeam ?? ''}',
          style: TextStyle(color: Colors.grey),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      ),
    );
  }
}
