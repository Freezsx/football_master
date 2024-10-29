import 'dart:convert';
import 'package:football_master/models/football_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../models/league_model.dart';

class TeamListPageController extends GetxController {
  RxList<InfoLeagueModel> infoLeagueModel = <InfoLeagueModel>[].obs;
  RxList<InfoFootballModel> infoFootballModel = <InfoFootballModel>[].obs;
  final count = 0.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLeagueList(); // Now works without arguments
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  // Make leagueNames parameter optional
  Future<void> fetchLeagueList([List<String>? leagueNames]) async {
    isLoading.value = true;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<InfoFootballModel> allFootballData = [];

      final response = await http.get(
        Uri.parse('https://www.thesportsdb.com/api/v1/json/3/all_leagues.php'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final InfoLeagueModel leagueModel = InfoLeagueModel.fromJson(data);
        infoLeagueModel.value = [leagueModel];
        isLoading.value = false;

        final InfoFootballModel footballModel = InfoFootballModel.fromJson(data);
        allFootballData.add(footballModel);
        infoFootballModel.value = allFootballData;

        print('Data League fetched successfully: ${infoLeagueModel.length} items');
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      isLoading.value = false;
    }
  }
}
