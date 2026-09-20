
import 'package:get/get_state_manager/get_state_manager.dart';

import '../main.dart';

class DarkModeController extends GetxController {
  bool value = false;
  void enableDarkMode(bool val) {
    value = val;
    sharedPreferences!.setBool("darkMode", value);
    print("${sharedPreferences!.getBool("darkMode")}");
    checkMode();
    update();
  }

  void checkMode() {
    if (sharedPreferences!.getBool("darkMode") == false) {

    } else if (sharedPreferences!.getBool("darkMode") == true) {

    }
  }

  @override
  void onInit() {
   // sharedPreferences!.setBool("darkMode", value);
    //checkMode();
    super.onInit();
  }
}
