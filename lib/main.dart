import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrts/core/binding/initial_binding.dart';
import 'package:mrts/modules/home/view/homepage.dart';
import 'package:mrts/routes/route_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
     WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyAw4AVF7aRPnrkhs1qXPsXMxl4O9rmffjU",
              appId: "1:179253694184:android:e442cf26ffaa111203035d",
              messagingSenderId: "179253694184",
              projectId: "mrts-7ba05",
              storageBucket: "mrts-7ba05.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(393, 851),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          translations: AppTranslations(), // Your translations
          locale: Locale('en', 'US'), // Default locale
          fallbackLocale: Locale('en', 'US'), // Fallback locale
          theme: ThemeData(
            // colorScheme: ColorScheme.fromSeed(
            //     seedColor: const Color.fromRGBO(235, 243, 241, 1)),
            useMaterial3: true,
          ),
          initialBinding: InitialBinding(),
          initialRoute: RouteHelper.splashScreen,
          getPages: RouteHelper.routes,
        );
      },
    );
  }
}


class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'book_ticket': 'Book Ticket in a Tap',
          'language_preference': 'Your Language Preference',
          'english': 'English',
          'bangla': 'বাংলা',
          'continue': 'Continue',
        },
        'bn_BD': {
          'book_ticket': 'একটি ট্যাপে টিকিট বুক করুন',
          'language_preference': 'আপনার ভাষার পছন্দ',
          'english': 'English',
          'bangla': 'বাংলা',
          'continue': 'পরবর্তী',
        },
      };
}