import 'package:football_master/screens/teamlistpage/teamlist_controller.dart';
import 'package:get/get.dart';

class TeamListBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TeamListPageController>(() => TeamListPageController());
  }
}