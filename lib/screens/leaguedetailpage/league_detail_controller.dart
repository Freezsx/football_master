import 'package:flutter/material.dart';
import 'package:football_master/models/football_model.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LeagueDetailController extends GetxController with GetSingleTickerProviderStateMixin {
  final List<String> leagueNames; // Accept league names as a constructor parameter
  RxList<InfoFootballModel> infoFootballModel = <InfoFootballModel>[].obs;
  RxBool isLoading = true.obs;
  late TabController tabController; // Declare TabController

  // Constructor
  LeagueDetailController({required this.leagueNames});

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this); // Initialize TabController
    final leagueNames = Get.arguments as String;
    fetchFootballList([leagueNames]);
  }

  @override
  void onClose() {
    tabController.dispose(); // Dispose of TabController
    super.onClose();
  }

  Future<void> fetchFootballList(List<String> leagueNames) async {
    try {
      List<InfoFootballModel> allFootballData = [];

      for (String leagueName in leagueNames) {
        final response = await http.get(
          Uri.parse('https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=$leagueName'),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final InfoFootballModel footballModel = InfoFootballModel.fromJson(data);
          allFootballData.add(footballModel);
        } else {
          print('Failed to fetch data for $leagueName: ${response.statusCode}');
        }
      }

      infoFootballModel.value = allFootballData;
      isLoading.value = false;
    } catch (e) {
      print('Error fetching data: $e');
      isLoading.value = false;
    }
  }
}
