import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/constant/api_linkes.dart';
import 'package:ejary_cash/main.dart';

class ProjectsRemoteData {
  Api api;
  ProjectsRemoteData(this.api);
  Future<dynamic> getAllProjects(token) async {
    var response = await api.getData(
        AppLinks.getAllProjectsLink,
        {"Accept": "application/json",         "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",
'authorization': 'Bearer $token',},
       );
    return response.fold((l) => l, (r) => r);
  }
Future<dynamic> getProjectsForPartener(partenerId,token) async {
    var response = await api.getData(
        "${AppLinks.getProjectsForPartener}${partenerId}/projects",
     
        {"Accept": "application/json",      "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",
 'authorization': 'Bearer $token',},
       );
    return response.fold((l) => l, (r) => r);
  }
}
