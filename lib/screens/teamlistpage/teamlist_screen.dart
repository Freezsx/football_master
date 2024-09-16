import 'package:flutter/material.dart';
import 'package:football_master/screens/teamlistpage/teamlist_controller.dart';
import 'package:get/get.dart';

class TeamListScreen extends StatelessWidget {
  TeamListScreen({Key? key}) : super(key: key);

  final TeamListPageController controller = Get.find<TeamListPageController>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.2),
        title: Text(
          'List League',
          style: TextStyle(
            fontFamily: 'Oswald',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.infoLeagueModel.isEmpty) {
          return const Center(child: Text('No leagues available.'));
        } else {
          final leagues = controller.infoLeagueModel
              .expand((league) => league.leagues)
              .toList();

          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 2 / 2.3,
            ),
            itemCount: leagues.length,
            itemBuilder: (context, index) {
              final league = leagues[index];

              return Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Image.asset(
                            'assets/images/premier-bg.png',
                            fit: BoxFit.fitHeight,
                            width: screenWidth * 0.21,
                            height: screenHeight * 0.11,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        league.strLeague ?? 'League Name',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.04
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        league.strLeagueAlternate,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
