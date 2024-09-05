import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:football_master/screens/homepage/components/category.dart';
import 'package:get/get.dart';
import 'package:football_master/screens/homepage/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'Football Master',
          style: TextStyle(
            fontFamily: 'Oswald',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Handle profile action
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: screenHeight * 0.3,
                aspectRatio: 16/1,
                viewportFraction: 1.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: true,
              ),
              items: [
                'assets/images/image-1.jpg',
                'assets/images/laliga.jpg',
                'assets/images/image-1.jpg',
              ].map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20,),
            Text(
              'List League',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: screenHeight * 0.1,
              child: Obx(() {
                if (homeController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (homeController.infoLeagueModel.isEmpty) {
                  return const Center(child: Text('No teams found'));
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeController.infoLeagueModel.length,
                    itemBuilder: (context, index) {
                      final event = homeController.infoLeagueModel[index];
                      if (event.leagues != null && event.leagues!.isNotEmpty) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: event.leagues!.map((league) {
                            String imageAssetPath;
                            switch (league.strLeague) {
                              case 'English Premier League':
                                imageAssetPath = 'assets/images/premier-bg.png';
                                break;
                              case 'Premier League':
                                imageAssetPath = 'assets/images/premier-bg.png';
                                break;
                              case 'Serie A':
                                imageAssetPath = 'assets/images/premier-bg.png';
                                break;
                              case 'Bundesliga':
                                imageAssetPath = 'assets/images/premier-bg.png';
                                break;
                              default:
                                imageAssetPath = 'assets/images/premier-bg.png';
                            }
                            return InkWell(
                              onTap: () {
                                print('strLeague : ${league.strLeague}');
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: screenWidth * 0.02),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300,
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    imageAssetPath,
                                    fit: BoxFit.fitWidth,
                                    height: screenHeight * 0.1,
                                    width: screenWidth * 0.163,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      } else {
                        return const ListTile(
                          title: Text('No team information available'),
                        );
                      }
                    },
                  );
                }
              }),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Obx(() {
                if (homeController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (homeController.infoFootballModel.isEmpty) {
                  return const Center(child: Text('No teams found'));
                } else {
                  return ListView.builder(
                    itemCount: homeController.infoFootballModel.length,
                    itemBuilder: (context, index) {
                      final team = homeController.infoFootballModel[index];
                      if (team.teams != null && team.teams!.isNotEmpty) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: team.teams!.map((team) {
                            return Card(
                              color: Colors.white,
                              surfaceTintColor: Colors.white,
                              margin: EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.grey.shade800),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.all(10),
                                title: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            team.strBadge ?? '',
                                            width: screenWidth * 0.145,
                                            height: screenHeight * 0.08,
                                            fit: BoxFit.fill,
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  team.strTeam ?? '',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                                SizedBox(height: 5,),
                                                Text(
                                                  team.strTeamAlternate ?? '',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey.shade600,
                                                    fontSize: screenWidth * 0.026,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Container(
                                        child: Row(
                                          children: [
                                            Categorycard(
                                              text: team.strLeague ?? '',
                                              fontSize: screenWidth * 0.022,
                                            ),
                                            SizedBox(width: 10,),
                                            Categorycard(
                                              text: team.strStadium ?? '',
                                              fontSize: screenWidth * 0.022,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      } else {
                        return const ListTile(
                          title: Text('No team information available'),
                        );
                      }
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
