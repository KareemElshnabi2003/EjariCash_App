import 'package:ejary_cash/data/model/order_info_model.dart';
import 'package:get/get.dart';

class OrderInfoController extends GetxController {
  OrderInfoModel ?orderInfoModel;
  @override
  void onInit() {
    if (Get.arguments is Map && Get.arguments["orderInfo"] != null) {
      orderInfoModel = Get.arguments["orderInfo"];
    }
    super.onInit();
  }
}
