import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/home/ads/ads_page.dart';
import 'package:ejary_cash/view/screens/home/ads/ads_page_owner.dart';
import 'package:ejary_cash/view/screens/home/home.dart';
import 'package:ejary_cash/view/screens/home/home_page.dart';
import 'package:ejary_cash/view/screens/home/orders/orders.dart';
import 'package:ejary_cash/view/screens/home/profile/profilePage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentIndex = 0;

  bool get isTenant {
    final type = sharedPreferences?.getString("typeOfUser") ?? "tenant";
    return type == "tenant" || type == "مستأجر";
  }

  List<Widget> get pages => [
        const HomePage(),
        isTenant ? const AdsPage() : const AdsPageOwner(),
        const Orders(),
        const Profilepage(),
      ];

  void changePage(int pageIndex) {
    currentIndex = pageIndex;
    update();
  }

  void goToHomeWithIndex(int index, dynamic arguments) {
    currentIndex = index;
    update();
    Get.offAll(() => const Home(), arguments: arguments);
  }
}
