import 'package:ejary_cash/data/model/order_info_model.dart';
import 'package:get/get.dart';

class OrderInfoController extends GetxController {
  OrderInfoModel ?orderInfoModel;
  @override
  void onInit() {
orderInfoModel=Get.arguments["orderInfo"];    super.onInit();
  }
}
