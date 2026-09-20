import 'package:device_preview/device_preview.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:screen_go/screen_go.dart';
import 'package:shared_preferences/shared_preferences.dart';


SharedPreferences? sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences!.getString("local") ??
      sharedPreferences!.setString("local", "ar");

  // await Firebase.initializeApp(
  //   name: "",
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  
  // FirebaseNotification().firebasemessaginsetting();
  // FirebaseNotification().intilizeNotification();
  runApp(
    DevicePreview(
      enabled: false, // Enable in debug mode only
      builder: (context) => const MyApp(), // Your app widget
    ),
  );
  // runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenGo(
      materialApp: true,
      builder: (context, deviceInfo) => GetMaterialApp(
        builder: DevicePreview.appBuilder, // Add this line
        useInheritedMediaQuery: true, // Add this line
      
        locale: sharedPreferences!.getString("local") == "en"
            ? const Locale("en")
            : const Locale("ar"),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          //
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}



