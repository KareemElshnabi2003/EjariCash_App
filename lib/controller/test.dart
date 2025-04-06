import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/test.dart';
import 'package:get/get.dart';

import '../data/model/test_model.dart';

class Test extends GetxController{

  StatuesRequest statuesRequest=StatuesRequest.none;
  TestRemoteData testRemoteData=TestRemoteData(Get.put(Api()));
  List<TestModel> data=[];

  getdata()async{
    statuesRequest=StatuesRequest.loading;
    update();
var response=await testRemoteData.getData();
print("step 1 :: $response");
statuesRequest=handlingData(response);
print("step 2 :: $statuesRequest");
if(statuesRequest==StatuesRequest.success){
  List responseBody=response['data'];
  data.addAll(responseBody.map((e) => TestModel.fromJson(e)));
  print("step 3 :: ${data[0].name}");

}else if(statuesRequest==StatuesRequest.socketException){

  print("step 4 :: no internet");

}else if(statuesRequest==StatuesRequest.serverException){
  print("step 5 :: not found");


}else if(statuesRequest==StatuesRequest.unExpectedException){
  print("step 6 :: un expected");


}else if(statuesRequest==StatuesRequest.defaultException){
  print("step 7 :: default");



}
    update();


  }



}