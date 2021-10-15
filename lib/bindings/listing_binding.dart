import 'package:get/get.dart';
import 'package:getxtutorial/controller/listing_controller.dart';

class ListingBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ListingController());
  }
}
