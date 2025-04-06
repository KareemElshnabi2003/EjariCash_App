import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/register.dart';
import 'package:ejary_cash/data/model/user_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/forgetPass/add_new_pass.dart';
import 'package:ejary_cash/view/screens/auth/register/main_register.dart';
import 'package:ejary_cash/view/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class UpdateProfileController extends GetxController {
  GlobalKey<FormState> updateGlobalKey = GlobalKey();
  GlobalKey<FormState> changePassGlobalKey = GlobalKey();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController newpasswordConfirmationController =
      TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController linkedInController = TextEditingController();
  TextEditingController passwordDeleteAccount = TextEditingController();
  StatuesRequest statuesRequest = StatuesRequest.none;
  RegisterRemoteData registerRemoteData = RegisterRemoteData(Get.put(Api()));
  bool showPass_1 = true;
  bool showPass_2 = true;
  bool showPass_3 = true;
  bool showPass_4 = true;
  bool enable = true;
  UserModel? userModel;

  DateTime? _selectedDate;
  String translateArabicDate(String arabicDate) {
    Map<String, String> arabicToEnglishDigits = {
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };

    // Replace Arabic digits with English digits
    arabicToEnglishDigits.forEach((arabic, english) {
      arabicDate = arabicDate.replaceAll(arabic, english);
    });

    return arabicDate; // Returns the translated date
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // current date
      firstDate: DateTime(1930), // starting date
      lastDate: DateTime(2050), // ending date
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
      birthDateController.text =
          translateArabicDate(DateFormat('yyyy-MM-dd').format(_selectedDate!));
      print(birthDateController.text);
      update();
    }
  }

  showPassword_1() {
    if (showPass_1 == false) {
      showPass_1 = true;
      update();
    } else {
      showPass_1 = false;
      update();
    }
  }

  showPassword_2() {
    if (showPass_2 == false) {
      showPass_2 = true;
      update();
    } else {
      showPass_2 = false;
      update();
    }
  }

  showPassword_3() {
    if (showPass_3 == false) {
      showPass_3 = true;
      update();
    } else {
      showPass_3 = false;
      update();
    }
  }

  showPassword_4() {
    if (showPass_4 == false) {
      showPass_4 = true;
      update();
    } else {
      showPass_4 = false;
      update();
    }
  }

  passwordValidate(String val, context) {
    if (val.isEmpty) {
      return S.of(context).errorPass_1;
    } else if (val.length < 8) {
      return S.of(context).errorPass_2;
    } else if (val.length > 20) {
      return S.of(context).errorPass_3;
    } else {
      return null;
    }
  }

  newpasswordValidate(String val, context) {
    if (val.isEmpty) {
      return S.of(context).errorPass_1;
    } else if (val.length < 8) {
      return S.of(context).errorPass_2;
    } else if (val.length > 20) {
      return S.of(context).errorPass_3;
    } else {
      return null;
    }
  }

  newpasswordConfirmationValidate(String val, context) {
    if (val.isEmpty) {
      return S.of(context).errorConfirmPass_1;
    } else if (newpasswordController.text !=
        newpasswordConfirmationController.text) {
      return S.of(context).errorConfirmPass_2;
    } else {
      return null;
    }
  }

  nameValidate(String val, context) {
    if (val.isEmpty) {
      return S.of(context).errorUserName_1;
    } else if (val.length < 3) {
      return S.of(context).errorUserName_2;
    } else if (val.length > 40) {
      return S.of(context).errorUserName_3;
    } else {
      return null;
    }
  }

  messageHandleExceptionVisitor(message, context) {
    Get.defaultDialog(
        title: S.of(context).error,
        content: Column(
          children: [
            Text(
              message,
              style: GoogleFonts.tajawal(
                  fontSize: 3.5.w,
                  color: LightMode.blackColor,
                  fontWeight: FontWeight.w500),
            ),
            InkWell(
              onTap: () {
                Get.offAll(() => const MainAuth());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: LightMode.yellowColor,
                  borderRadius: BorderRadius.circular(3.w),
                ),
                width: 30.w,
                height: 5.h,
                child: Center(
                  child: Text(
                    S.of(Get.context!).login,
                    style: GoogleFonts.tajawal(
                        fontSize: 4.w,
                        color: LightMode.whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  messageHandleException(message, context) {
    Get.defaultDialog(
        title: S.of(context).error,
        content: Column(
          children: [
            Text(
              message,
              style: GoogleFonts.tajawal(
                  fontSize: 3.5.w,
                  color: LightMode.blackColor,
                  fontWeight: FontWeight.w500),
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: LightMode.yellowColor,
                  borderRadius: BorderRadius.circular(3.w),
                ),
                width: 30.w,
                height: 5.h,
                child: Center(
                  child: Text(
                    S.of(context).tryAgain,
                    style: GoogleFonts.tajawal(
                        fontSize: 4.w,
                        color: LightMode.whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  updateProfile(context) async {
    // sharedPreferences!.clear();
    if (updateGlobalKey.currentState!.validate()) {
      statuesRequest = StatuesRequest.loading;
      update();
      print(
        nameController.text,
      );
      print(
        sharedPreferences!.getString("token"),
      );
      print(
        birthDateController.text,
      );
      print(
        bioController.text,
      );
      print(
        linkedInController.text,
      );

      var response = await registerRemoteData.updateProfile(
        sharedPreferences!.getString("token"),
        nameController.text,
        birthDateController.text,
        bioController.text,
        linkedInController.text,
      );
      print(response);

      statuesRequest = handlingData(response);
      if (statuesRequest == StatuesRequest.success) {
        Map<String, dynamic> responseBody = response['data'];
        print("response :: $responseBody");
        userModel = UserModel.fromJson(responseBody);

        sharedPreferences!.setString("phone", "${userModel!.mobile}");
        sharedPreferences!.setString("email", "${userModel!.email}");

        sharedPreferences!.setString("bio", "${userModel!.bio}");
        sharedPreferences!.setString("birthDate", "${userModel!.birthdate}");
        sharedPreferences!.setString("name", "${userModel!.name}");
        sharedPreferences!.setString("img", "${userModel!.photoProfile}");
        sharedPreferences!.setString("linkedin", "${userModel!.linkedinLink}");
        sharedPreferences!.setString("fcmId", "${userModel!.fcmId}");
        sharedPreferences!
            .setString("accountType", "${userModel!.accountType}");
        sharedPreferences!.setString("status", "${userModel!.status}");
        Get.off(() => const Home());
      } else if (statuesRequest == StatuesRequest.unprocessableException) {
        messageHandleException("${response['message']}", context);
      } else if (statuesRequest == StatuesRequest.socketException) {
        messageHandleException(S.of(context).noInternetApi, context);
      } else if (statuesRequest == StatuesRequest.serverException) {
        messageHandleException(S.of(context).serverException, context);
      } else if (statuesRequest == StatuesRequest.unExpectedException) {
        messageHandleException(S.of(context).unExcepectedException, context);
      } else if (statuesRequest == StatuesRequest.defaultException) {
        messageHandleException(S.of(context).errorPhoneUseBeforeApi, context);
      } else if (statuesRequest == StatuesRequest.serverError) {
        messageHandleException("${response}", context);
      } else if (statuesRequest == StatuesRequest.timeoutException) {
        messageHandleException(S.of(context).timeOutException, context);
      } else if (statuesRequest == StatuesRequest.unauthorizedException) {
        messageHandleException(S.of(Get.context!).error, context);
      }
    }
    update();
  }

  deleteAccount(context) async {
    enable = false;
    var response = await registerRemoteData.deleteAccount(
        sharedPreferences!.getString("token"), passwordDeleteAccount.text);
    print(response);

    statuesRequest = handlingData(response);
    if (statuesRequest == StatuesRequest.success) {
      dynamic responseBody = response;
      print("response :: $responseBody");

      sharedPreferences!.clear();
      enable = true;
      Get.off(() => const MainAuth());
    } else if (statuesRequest == StatuesRequest.unprocessableException) {
      messageHandleException("${response['message']}", context);
    } else if (statuesRequest == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest == StatuesRequest.defaultException) {
      messageHandleException(S.of(context).errorPhoneUseBeforeApi, context);
    } else if (statuesRequest == StatuesRequest.serverError) {
      messageHandleException("${response}", context);
    } else if (statuesRequest == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest == StatuesRequest.unauthorizedException) {
      messageHandleException(S.of(Get.context!).error, context);
    }

    update();
  }

  messageToDeleteAccount() {
    Get.defaultDialog(
        title: S.of(Get.context!).deleteAccount,
        titleStyle: TextStyle(
            fontSize: 5.w,
            fontWeight: FontWeight.w700,
            color: LightMode.blackColor),
        content: SizedBox(
          width: 90.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${S.of(Get.context!).currrentPass} : ",
                style: TextStyle(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w500,
                    color: LightMode.blackColor),
              ),
              Container(
                // width: 90.w,
                // padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                margin: EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                color: LightMode.fillTextFieldColor,
                height: 6.h,
                child: textFailed(
                    passwordDeleteAccount,
                    TextInputType.visiblePassword,
                    false,
                    S.of(Get.context!).password,
                    false,
                    null, (val) {
                  return null;
                }),
              ),
              SizedBox(
                height: 5.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: enable == false
                        ? () {}
                        : () async {
                            await deleteAccount(Get.context);
                            passwordDeleteAccount.clear();
                          },
                    child: Container(
                      alignment: Alignment.center,
                      width: 30.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.w),
                          border: Border.all(
                              color: LightMode.yellowColor, width: 2),
                          color: LightMode.yellowColor),
                      child: Text(
                        S.of(Get.context!).deleteAccount,
                        style: TextStyle(
                            fontSize: 4.w,
                            fontWeight: FontWeight.w500,
                            color: LightMode.whiteColor),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                      passwordDeleteAccount.clear();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 30.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.w),
                        border:
                            Border.all(color: LightMode.yellowColor, width: 2),
                      ),
                      child: Text(
                        S.of(Get.context!).cancel,
                        style: TextStyle(
                            fontSize: 4.w,
                            fontWeight: FontWeight.w500,
                            color: LightMode.yellowColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  changePassword(context) async {
    // sharedPreferences!.clear();
    if (changePassGlobalKey.currentState!.validate()) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await registerRemoteData.changePassword(
        sharedPreferences!.getString("token"),
        passwordController.text,
        newpasswordController.text,
        newpasswordConfirmationController.text,
      );
      print(response);

      statuesRequest = handlingData(response);
      if (statuesRequest == StatuesRequest.success) {
        dynamic responseBody = response;
        print("response :: $responseBody");

        Get.offAll(() => const Home());
      } else if (statuesRequest == StatuesRequest.unprocessableException) {
        messageHandleException("${response['message']}", context);
      } else if (statuesRequest == StatuesRequest.socketException) {
        messageHandleException(S.of(context).noInternetApi, context);
      } else if (statuesRequest == StatuesRequest.serverException) {
        messageHandleException(S.of(context).serverException, context);
      } else if (statuesRequest == StatuesRequest.unExpectedException) {
        messageHandleException(S.of(context).unExcepectedException, context);
      } else if (statuesRequest == StatuesRequest.defaultException) {
        messageHandleException(S.of(context).errorPhoneUseBeforeApi, context);
      } else if (statuesRequest == StatuesRequest.serverError) {
        messageHandleException("${response}", context);
      } else if (statuesRequest == StatuesRequest.timeoutException) {
        messageHandleException(S.of(context).timeOutException, context);
      } else if (statuesRequest == StatuesRequest.unauthorizedException) {
        messageHandleException(S.of(context).error, context);
      }
    }
    update();
  }

  @override
  void onInit() {
    nameController.text = sharedPreferences!.getString("name") == "null"
        ? ""
        : sharedPreferences!.getString("name")!;
    birthDateController.text =
        sharedPreferences!.getString("birthDate") == "null"
            ? ""
            : sharedPreferences!.getString("birthDate")!;
    bioController.text = sharedPreferences!.getString("bio") == "null"
        ? ""
        : sharedPreferences!.getString("birthDate")!;
    linkedInController.text = sharedPreferences!.getString("linkedin") == "null"
        ? ""
        : sharedPreferences!.getString("linkedin")!;

    super.onInit();
  }
}
