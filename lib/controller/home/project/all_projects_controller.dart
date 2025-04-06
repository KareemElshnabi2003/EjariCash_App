import 'package:ejary_cash/data/model/partener_model.dart';
import 'package:get/get.dart';

class AllProjectsController extends GetxController {
  List<PartenerModel> allProgects = [];
  @override
  void onInit() {
    allProgects = Get.arguments['AllProjects'];
    super.onInit();
  }
}
