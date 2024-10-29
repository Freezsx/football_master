import 'package:flutter/material.dart';
import 'package:football_master/navigation/routes.dart';
import 'package:football_master/screens/leaguedetailpage/league_detail_controller.dart';
import 'package:football_master/screens/leaguedetailpage/widget/detail_tab_widget.dart';
import 'package:football_master/screens/leaguedetailpage/widget/teams_tab_widget.dart';
import 'package:get/get.dart';

class LeagueDetailScreen extends StatelessWidget {
  final LeagueDetailController controller = Get.find<LeagueDetailController>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
        child: AppBar(
          toolbarHeight: screenHeight * 0.1,
          leadingWidth: screenWidth * 0.2,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.toNamed(Routes.NAVBAR);
            },
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 25),
            ),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: screenWidth * 0.09),
              Text(
                'League Details',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.infoFootballModel.isEmpty) {
          return Center(child: Text('No leagues available'));
        }

        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: TabBar(
                  controller: controller.tabController,
                  tabs: [
                    Tab(text: 'Teams'),
                    Tab(text: 'Details'),
                  ],
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    TeamsTab(controller: controller),
                    DetailsTab(controller: controller),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
