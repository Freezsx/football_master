import 'package:flutter/material.dart';
import 'package:football_master/models/football_model.dart';

class TeamDetailCard extends StatelessWidget {
  final Teams team;

  const TeamDetailCard({required this.team});

  @override
  Widget build(BuildContext context) {
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
            Row(
              children: [
                team.strBadge != null
                    ? CircleAvatar(
                  backgroundImage: NetworkImage(team.strBadge!),
                  radius: 30,
                )
                    : Icon(Icons.sports_soccer, size: 60),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    team.strTeam ?? 'Nama Klub Tidak Tersedia',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            _buildDetailRow('Stadium:', team.strStadium ?? 'N/A'),
            _buildDetailRow('League Name:', team.strLeague ?? 'N/A'),
            _buildDetailRow('Description:', team.strDescriptionEN ?? 'N/A'),
            _buildDetailRow('Year Founded:', team.intFormedYear?.toString() ?? 'N/A'),
            _buildDetailRow('Country:', team.strCountry ?? 'N/A'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        '$label $value',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
