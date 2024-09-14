import 'package:football_master/screens/playerpage/player_controller.dart';
import 'package:get/get.dart';

class PlayerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<PlayerPageController>(() => PlayerPageController());
  }
}