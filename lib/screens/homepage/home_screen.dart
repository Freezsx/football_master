import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:football_master/navigation/bottom_navbar.dart';
import 'package:football_master/screens/homepage/components/category.dart';
import 'package:get/get.dart';
import 'package:football_master/screens/homepage/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomePageController homeController = Get.find<HomePageController>();

  String _formatDate(String date) {
    try {
      final DateTime parsedDate = DateTime.parse(date);
      return DateFormat.EEEE().format(parsedDate);
    } catch (e) {
      return date;
    }
  }

  String _formatTime(String time) {
    try {
      final List<String> timeParts = time.split(':');
      return '${timeParts[0]}:${timeParts[1]}';
    } catch (e) {
      return time;
    }
  }

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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  height: screenHeight * 0.28,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: homeController.infoEventModel.expand((event) => event.event!).where((event) => event.strLeague != '0').length,
                    itemBuilder: (context, index) {
                      final event = homeController.infoEventModel.expand((event) => event.event!).where((event) => event.strLeague != '0').toList()[index];
                      print(homeController.infoEventModel);

                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ClipPath(
                          clipper: CustomCardClipper(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF330039),
                              image: DecorationImage(
                                image: AssetImage('assets/images/premier-bg.png'),
                                fit: BoxFit.fitWidth,
                                opacity: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07, vertical: 10),
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
                                    event.dateEvent != null
                                        ? DateFormat('d MMMM yyyy', 'id_ID').format(DateTime.parse(event.dateEvent!))
                                        : 'No Date',
                                    style: GoogleFonts.lexend(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.03),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: screenWidth * 0.18,
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
                                          Text(event.intHomeScore ?? 'N/A', style: TextStyle(color: Colors.white, fontSize: (event.intHomeScore == null) ? screenWidth * 0.05 : screenWidth * 0.07, fontWeight: FontWeight.w600),),
                                          SizedBox(width: 10,),
                                          Text('-', style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.07, fontWeight: FontWeight.w600),),
                                          SizedBox(width: 10,),
                                          Text(event.intAwayScore ?? 'N/A', style: TextStyle(color: Colors.white, fontSize: (event.intAwayScore == null) ? screenWidth * 0.05 : screenWidth * 0.07, fontWeight: FontWeight.w600  ),),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            width: screenWidth * 0.18,
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
            SizedBox(height: 20,),
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
                        return Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: event.leagues!.map((league) {
                              String imageAssetPath;
                              switch (league.strLeague) {
                                case 'English Premier League':
                                  imageAssetPath = 'assets/images/premier-bg.png';
                                  break;
                                case 'English League Championship':
                                  imageAssetPath = 'assets/images/elc.png';
                                  break;
                                case 'Scottish Premier League':
                                  imageAssetPath = 'assets/images/spfl-2.png';
                                  break;
                                case 'German Bundesliga':
                                  imageAssetPath = 'assets/images/bundes-bg.png';
                                  break;
                                case 'Italian Serie A':
                                  imageAssetPath = 'assets/images/italya-bg.png';
                                  break;
                                case 'French Ligue 1':
                                  imageAssetPath = 'assets/images/ligue-bg.png';
                                  break;
                                default:
                                  imageAssetPath = 'assets/images/premier-bg.png';
                              }
                              bool isSelected = homeController.selectedLeague.value == league.strLeague;
                              return Padding(
                                padding: EdgeInsets.only(right: screenWidth * 0.04),
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                    onTap: () {
                                      homeController.selectLeague(league.strLeague!);
                                      print('Selected league: ${league.strLeague}');
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),  // Animation duration
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isSelected ? Color(0xFF381D53) : Colors.grey.shade200,
                                      ),
                                      child: ClipOval(
                                        child: Container(
                                          margin: EdgeInsets.all(6),
                                          child: ColorFiltered(
                                            colorFilter: ColorFilter.mode(
                                              isSelected ? Color(0xFFF8F8F8) : Color(0xFF091C3E),
                                              BlendMode.srcATop,
                                            ),
                                            child: Image.asset(
                                              imageAssetPath,
                                              fit: BoxFit.cover,
                                              height: screenHeight * 0.9,
                                              width: screenWidth * 0.09,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
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
            SizedBox(height: 10,),
            Obx(() {
              if (homeController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (homeController.infoEventLeagueModel.isEmpty) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.1),
                    child: Text('No teams available'),
                  ),
                );
              } else {
                final selectedLeague = homeController.selectedLeague.value;
                final filteredTeams = homeController.infoEventLeagueModel
                    .where((match) => match.events != null && match.events!.isNotEmpty)
                    .expand((match) => match.events!)
                    .where((team) => team.strLeague == selectedLeague)
                    .toList();

                if (filteredTeams.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.1),
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView(
                      children: filteredTeams.map((teamItem) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade400),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.network(teamItem.strHomeTeamBadge ?? '', width: 50, height: 50),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: Text(
                                          teamItem.strHomeTeam ?? '',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                          maxLines: 2,
                                          overflow: teamItem.strHomeTeam!.length > 6 ? TextOverflow.ellipsis : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                                  child: Column(
                                    children: [
                                      Text(
                                        _formatTime(teamItem.strTime ?? ''),
                                        style: TextStyle(fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        _formatDate(teamItem.dateEvent ?? ''),
                                        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey, fontSize: screenWidth * 0.03),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          teamItem.strAwayTeam ?? '',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                          maxLines: 2,
                                          overflow: teamItem.strAwayTeam!.length > 6 ? TextOverflow.ellipsis : null,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Image.network(teamItem.strAwayTeamBadge ?? '', width: 50, height: 50),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}

class CustomCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double cornerRadius = 20.0;
    double clippedCornerSize = 40.0;

    // Top-left rounded corner
    path.moveTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);

    // Top-right clipped corner
    path.lineTo(size.width - clippedCornerSize, 0);
    path.lineTo(size.width, clippedCornerSize);

    // Bottom-right rounded corner
    path.lineTo(size.width, size.height - cornerRadius);
    path.quadraticBezierTo(size.width, size.height, size.width - cornerRadius, size.height);

    // Bottom-left clipped corner
    path.lineTo(clippedCornerSize, size.height);
    path.lineTo(0, size.height - clippedCornerSize);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
