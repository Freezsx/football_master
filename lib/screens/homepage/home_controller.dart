import 'dart:convert';
import 'package:football_master/models/event_model.dart';
import 'package:football_master/models/league_model.dart';
import 'package:football_master/url/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/football_model.dart';

class HomeController extends GetxController {
  RxList<InfoFootballModel> infoFootballModel = <InfoFootballModel>[].obs;
  RxList<InfoLeagueModel> infoLeagueModel = <InfoLeagueModel>[].obs;
  RxList<InfoEventModel> infoEventModel = <InfoEventModel>[].obs;
  var isLoading = true.obs;
  var currentIndex = 0.obs;
  var selectedLeague = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFootballList();
    fetchLeagueList();
    fetchEventList(['Arsenal_vs_Chelsea', 'Arsenal_vs_Everton', 'Arsenal_vs_Liverpool']);
  }

  void changeIndex(int index) async {
    currentIndex.value = index;
  }

  void selectLeague(String leagueName) {
    selectedLeague.value = leagueName;
    update();
  }

  Future<void> fetchFootballList() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final response = await http.get(
        Uri.parse('https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final InfoFootballModel footballModel = InfoFootballModel.fromJson(data);
        infoFootballModel.value = [footballModel];
        isLoading.value = false;
        print('Data Football fetched successfully: ${infoFootballModel.length} items');
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      isLoading.value = false;
    }
  }

  Future<void> fetchEventList(List<String> eventNames) async {
    try {
      isLoading.value = true; // Set loading to true before starting
      List<InfoEventModel> events = [];

      for (String eventName in eventNames) {
        final Map<String, String> queryParams = {
          'e': eventName,
        };

        final Uri url = Uri.https(baseUrl, pathEvent, queryParams);
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final InfoEventModel eventModel = InfoEventModel.fromJson(data);
          events.add(eventModel);
        } else {
          print('Failed to fetch data for $eventName: ${response.statusCode}');
        }
      }

      infoEventModel.value = events;
      isLoading.value = false;
      print('Data Events fetched successfully: ${infoEventModel.length} items');
    } catch (e) {
      print('Error fetching data: $e');
      isLoading.value = false;
    }
  }

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
