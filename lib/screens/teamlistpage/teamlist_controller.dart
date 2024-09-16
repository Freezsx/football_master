import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../models/league_model.dart';

class TeamListPageController extends GetxController {
  RxList<InfoLeagueModel> infoLeagueModel = <InfoLeagueModel>[].obs;
  final count = 0.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLeagueList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> fetchLeagueList() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final response = await http.get(
        Uri.parse('https://www.thesportsdb.com/api/v1/json/3/all_leagues.php'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final InfoLeagueModel leagueModel = InfoLeagueModel.fromJson(data);
        infoLeagueModel.value = [leagueModel];
        isLoading.value = false;
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