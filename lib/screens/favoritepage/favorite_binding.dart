import 'package:football_master/screens/favoritepage/favorite_controller.dart';
import 'package:get/get.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FavoritePageController>(() => FavoritePageController());
  }
}