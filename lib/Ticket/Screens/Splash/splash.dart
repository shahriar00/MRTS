import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrts/Ticket/Components/CustomButton.dart';
import 'package:mrts/Ticket/Screens/OTP/otp.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String selectedLanguage = 'en';

  void changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    Get.updateLocale(locale);
    setState(() {
      selectedLanguage = languageCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(235, 243, 241, 1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                SvgPicture.asset(
                  'assets/metroLogoOnly.svg', // Make sure you have your logo image in assets
                  height:
                      150.h, // Adjust the height according to your logo size
                ),
                SizedBox(height: 4.h),
                Text(
                  'Dhaka Mass Transit Company Limited',
                  style: GoogleFonts.poppins(
                    color: Color.fromRGBO(90, 117, 112, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: .5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 85.h),
                Text(
                  'book_ticket'.tr,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Color.fromRGBO(77, 157, 71, 1),
                        fontSize: 25,
                        letterSpacing: 1.1,
                      ),
                ),
                SizedBox(height: 40.h),
                Text(
                  'language_preference'.tr,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Color.fromRGBO(67, 90, 85, 1),
                        fontSize: 19,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.5,
                      ),
                ),
                Divider(
                  indent: 37.w,
                  endIndent: 37.w,
                  color: Color.fromRGBO(121, 136, 133, 1),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: const EdgeInsets.only(left: 33),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'en',
                            groupValue: selectedLanguage,
                            onChanged: (value) {
                              changeLanguage(value!);
                            },
                            activeColor: Color.fromRGBO(77, 157, 71, 1),
                          ),
                          Text(
                            'english'.tr,
                            style: TextStyle(
                                fontWeight: selectedLanguage == 'en'
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                letterSpacing: 0.8,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25.h,
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'bn',
                            groupValue: selectedLanguage,
                            onChanged: (value) {
                              changeLanguage(value!);
                            },
                            activeColor: Color.fromRGBO(77, 157, 71, 1),
                          ),
                          Text(
                            'bangla'.tr,
                            style: TextStyle(
                              fontWeight: selectedLanguage == 'bn'
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 150.h),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 276.w,
                    height: 68.h,
                    child: CustomButton(
                      text: 'continue'.tr,
                      onPressed: () {
                        Get.to(OtpPage());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
