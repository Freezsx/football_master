import 'package:get/get.dart';

class TeamListPageController extends GetxController {
  final count = 0.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}