
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/home/ads/ads_page.dart';
import 'package:ejary_cash/view/screens/home/ads/ads_page_owner.dart';
import 'package:ejary_cash/view/screens/home/home.dart';
import 'package:ejary_cash/view/screens/home/home_page.dart';
import 'package:ejary_cash/view/screens/home/orders/orders.dart';
import 'package:ejary_cash/view/screens/home/profile/profilePage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  List pages = [
    const HomePage(),
    sharedPreferences!.getString("typeOfUser") == "مستأجر"
        ? const AdsPage()
        : const AdsPageOwner(),
    const Orders(),
    const Profilepage(),
  ];
  changePage(int pageIndex) {
    currentIndex = pageIndex;
    update();
  }

  goToHomeWithIndex(index, arguments) {
    Get.offAll(() => const Home(), arguments: arguments);
    currentIndex = index;
    update();
  }
}
