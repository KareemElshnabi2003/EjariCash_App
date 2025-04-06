import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/constant/api_linkes.dart';
import 'package:ejary_cash/main.dart';

class RegisterRemoteData {
  Api api;
  RegisterRemoteData(this.api);
  login(email,password,tokenDevice) async {
    var response = await api.postData(AppLinks.loginLink, {
      "Accept":"application/json",
            "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",
             'Content-Type': 'application/json; charset=UTF-8'

    },{

"email":email,
"password":password,
"fcm_id":tokenDevice,

    });
    return response.fold((l) => l, (r) => r);
  }
  //register
   signup(name,email,password,passwordConfirmation,mobile,tokenDevice) async {
    var response = await api.postData(AppLinks.registerLink,  {
      "Accept":"application/json",
      "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",
       'Content-Type': 'application/json; charset=UTF-8'
    },{
"name":name,
"fcm_id":tokenDevice,
"email":email,
"password":password,
"mobile":mobile,
"password_confirmation":passwordConfirmation,
"country_code":"966",
"accept_terms":"true"

    });
    return response.fold((l) => l, (r) => r);
  }
  //verify
   verifyCode(email,code) async {
    var response = await api.postData(AppLinks.verifyCodeLink,  {
      "Accept":"application/json",
            "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",

       'Content-Type': 'application/json; charset=UTF-8'
     
    },{
"email":email,
"code":code

    });
    return response.fold((l) => l, (r) => r);
  }
   verifyCodeForgetPass(email,code) async {
    var response = await api.postData(AppLinks.verifyCodeForgetPassLink,  {
      "Accept":"application/json",
            "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",

       'Content-Type': 'application/json; charset=UTF-8'
     
    },{
"email":email,
"code":code

    });
    return response.fold((l) => l, (r) => r);
  }
  verifyCodeActivate(email,code) async {
    var response = await api.postData(AppLinks.verifyCodeActivateLink,  {
      "Accept":"application/json",
            "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",

       'Content-Type': 'application/json; charset=UTF-8'
     
    },{
"email":email,
"code":code

    });
    return response.fold((l) => l, (r) => r);
  }
   resendCode(email) async {
    var response = await api.postData(AppLinks.resendCodeLink,  {
      "Accept":"application/json",
            "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",

       'Content-Type': 'application/json; charset=UTF-8'
     
    },{
"email":email,

    });
    return response.fold((l) => l, (r) => r);
  }
//logout
logOut(token) async {
    var response = await api.postData(AppLinks.logOutLink,  {
      "Accept":"application/json",
            'authorization': 'Bearer $token',
                  "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",

             'Content-Type': 'application/json; charset=UTF-8'

     
    },{


    });
    return response.fold((l) => l, (r) => r);
  }

 //update profile
  updateProfile(token,name,birthDate,bio,linkedIn) async {
    var response = await api.postData(AppLinks.updateProfileLink,  {
      "Accept":"application/json",
      "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",
      'authorization': 'Bearer $token',
       'Content-Type': 'application/json; charset=UTF-8'

     
    },{
"name":name,
"birthdate":birthDate,
"bio":bio,
"linkedin_link":linkedIn

    });
    return response.fold((l) => l, (r) => r);
  }
  
//delete account
deleteAccount(token,password) async {
    var response = await api.postData(AppLinks.deleteAccountLink,  {
      "Accept":"application/json",
      "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",
      'authorization': 'Bearer $token',
       'Content-Type': 'application/json; charset=UTF-8'

     
    },{
"password":password

    });
    return response.fold((l) => l, (r) => r);
  }
//change password
changePassword(token,currentPassword,newPass,confirmPass) async {
    var response = await api.postData(AppLinks.changePasswordLink,  {
      "Accept":"application/json",
      "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",
      'authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8'


     
    },{
"current_password":currentPassword,"password":newPass,"password_confirmation":confirmPass

    });
    return response.fold((l) => l, (r) => r);
  }

resetPass(email,newPass,confirmPass) async {
    var response = await api.postData(AppLinks.addNewPassLink,  {
      "Accept":"application/json",
      "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",
      'Content-Type': 'application/json; charset=UTF-8'


     
    },{
"email":email,"password":newPass,"password_confirmation":confirmPass

    });
    return response.fold((l) => l, (r) => r);
  }
  forgetPass(email) async {
    var response = await api.postData(AppLinks.forgetPassLink,  {
      "Accept":"application/json",
      "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",
      'Content-Type': 'application/json; charset=UTF-8'


     
    },{
"email":email

    });
    return response.fold((l) => l, (r) => r);
  }
  //get user data
  getUserData(token) async {
    var response = await api.getData(AppLinks.getUserInfo,  {
      "Accept":"application/json",
       "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",      'authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8'


     
    });
    return response.fold((l) => l, (r) => r);
  }
}
