import 'package:get/get.dart';

class NavigateController extends GetxController {
  bool navToDetails = false;
  bool navToFilter = false;
  String? carImage;
  String? carPrice;
  Map<String, String>? carDetails;

  void navToDetailsPage() {
    navToDetails = !navToDetails;
    update();
  }

  void navToFilterPage() {
    navToFilter = !navToFilter;
    update();
  }

  void getCarDetails(
      {required String image,
      required String price,
      required Map<String, String> details}) {
    carImage = image;
    carPrice = price;
    carDetails = details;
    update();
  }
}
