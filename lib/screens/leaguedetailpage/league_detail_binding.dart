import 'package:football_master/screens/leaguedetailpage/league_detail_controller.dart';
import 'package:get/get.dart';

class LeagueDetailBinding extends Bindings {
  final List<String> leagueNames;

  LeagueDetailBinding(this.leagueNames);

  @override
  void dependencies() {
    // Pass league names to the controller
    Get.lazyPut<LeagueDetailController>(() => LeagueDetailController(leagueNames: leagueNames));
  }
}
