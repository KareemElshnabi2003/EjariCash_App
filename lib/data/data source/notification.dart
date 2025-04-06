import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/constant/api_linkes.dart';
import 'package:ejary_cash/main.dart';

class NotificationRemoteData {
  Api api;
  NotificationRemoteData(this.api);
  getNotification(token) async {
    var response = await api.getData(
      AppLinks.notificationLink,
      {
        "Accept": "application/json",
      "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",
        'authorization': 'Bearer $token',
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
