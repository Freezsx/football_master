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
          'Balbalan',
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
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'List League',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10,),
            Obx(() {
              if (homeController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (homeController.infoLeagueModel.isEmpty) {
                return const Center(child: Text('No teams found'));
              } else {
                return Container(
                  height: screenHeight * 0.1,
                  child: ListView.builder(
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
                            bool isSelected = homeController.selectedLeague.value == league.strLeague;
                            return InkWell(
                              onTap: () {
                                homeController.selectLeague(league.strLeague);
                                print('Selected league: ${league.strLeague}');
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(right: screenWidth * 0.04),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected ? Color(0xFF381D53) : Colors.grey.shade100,  // Color change logic
                                ),
                                child: ClipOval(
                                  child: Container(
                                    margin: EdgeInsets.all(6),
                                    child: ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                        isSelected ? Color(0xFFF8F8F8) : Color(0xFFC2C2C2),
                                        BlendMode.srcATop,
                                      ),
                                      child: Image.asset(
                                        imageAssetPath,
                                        fit: BoxFit.cover,
                                        height: screenHeight * 0.07,
                                        width: screenWidth * 0.1,
                                      ),
                                    ),
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
                  ),
                );
              }
            }),
            SizedBox(height: 20,),
            Text(
              'Popular Match',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 15,),
            Obx(() {
              if (homeController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (homeController.infoEventModel.isEmpty || homeController.infoEventModel.every((event) => event.event == null || event.event!.isEmpty)) {
                return const Center(child: Text('No events found'));
              } else {
                PageController _pageController = PageController(viewportFraction: 1);

                return SizedBox(
                  height: screenHeight * 0.3,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: homeController.infoEventModel.expand((event) => event.event!).where((event) => event.strLeague != '0').length,
                    itemBuilder: (context, index) {
                      final event = homeController.infoEventModel.expand((event) => event.event!).where((event) => event.strLeague != '0').toList()[index];

                      return Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Card(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF330039),
                              image: DecorationImage(
                                image: AssetImage('assets/images/premier-bg.png'),
                                fit: BoxFit.fitWidth,
                                opacity: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    event.strLeague ?? 'No League',
                                    style: GoogleFonts.lexend(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    event.dateEvent ?? 'No League',
                                    style: GoogleFonts.lexend(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.05),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            child: Image.network(
                                              event.strHomeTeamBadge ?? 'No Image',
                                              errorBuilder: (context, error, stackTrace) {
                                                return Image.network(homeController.infoFootballModel[0].teams?[0].strBadge ?? '');
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Text(event.strHomeTeam ?? '', style: TextStyle(color: Colors.white),)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(event.intHomeScore ?? 'N/A', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.07, fontWeight: FontWeight.w600),),
                                          SizedBox(width: 10,),
                                          Text('-', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.07, fontWeight: FontWeight.w600),),
                                          SizedBox(width: 10,),
                                          Text(event.intAwayScore ?? 'N/A', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.07, fontWeight: FontWeight.w600  ),),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            child: Image.network(
                                              event.strAwayTeamBadge ?? 'No Image',
                                              errorBuilder: (context, error, stackTrace) {
                                                return Image.network(
                                                  (homeController.infoFootballModel.isNotEmpty &&
                                                      homeController.infoFootballModel[0].teams != null &&
                                                      homeController.infoFootballModel[0].teams!.length > 5)
                                                      ? homeController.infoFootballModel[0].teams![5].strBadge ?? 'assets/images/default-badge.png'
                                                      : 'assets/images/default-badge.png', // Fallback to a default image if not found
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Text(event.strAwayTeam ?? '', style: TextStyle(color: Colors.white),)
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}