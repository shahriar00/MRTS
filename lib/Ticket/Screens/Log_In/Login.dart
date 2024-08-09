import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrts/Ticket/Components/CustomButton.dart';
import 'package:mrts/Ticket/Components/PopUpMassege.dart';
import 'package:mrts/Ticket/Screens/Log_In/footer.dart';
import 'package:mrts/Ticket/Screens/OTP/otp.dart';
import 'package:mrts/Ticket/Screens/Splash/splash.dart';
import '../../Controllers/login_controller.dart';
import '../../Components/constent.dart';
import 'Login_TextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = Get.put(LoginController());

  // Firebase Phone Authentication
  Future<void> _verifyPhoneNumber() async {
    String phoneNumber = loginController.phoneController.value.text.trim();
    if (phoneNumber.isNotEmpty && phoneNumber.length == 10) {
      String fullPhoneNumber = '+880$phoneNumber'; // Bangladeshi format
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: fullPhoneNumber,
        timeout: Duration(seconds: 40),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          // Navigate to next screen upon verification
          Get.to(OtpPage());
        },
        verificationFailed: (FirebaseAuthException e) {
          showCustomPopup('Verification Failed', e.message ?? 'Unknown error');
        },
        codeSent: (String verificationId, int? resendToken) {
          Get.to(OtpPage());
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          showCustomPopup('Timeout', 'Phone number verification timed out');
        },
      );
    } else {
      showCustomPopup('Warning', 'Please enter a valid 10-digit phone number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Color.fromRGBO(235, 243, 241, 1),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                height: 250.h,
                child: Column(
                  children: [
                    SizedBox(height: 52.h),
                    ClipRect(
                      child: SvgPicture.asset('assets/metroLogoOnly.svg'),
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
                  ],
                ),
              ),
              Container(
                height: 602.h,
                width: 365.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 29.0),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.to(SplashScreen());
                              },
                              icon: Icon(Icons.arrow_back),
                            ),
                            Text(
                              'Sign in',
                              style: textTheme.headlineLarge,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Sign in with your mobile number',
                        style: textTheme.titleMedium,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 42.h),
                      Container(
                        width: 275.w,
                        height: 92.h,
                        child: LoginTextField(),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 276.w,
                        height: 68.h,
                        child: CustomButton(
                          text: 'Get OTP',
                          onPressed: _verifyPhoneNumber,
                        ),
                      ),
                      SizedBox(
                        height: 200.h,
                      ),
                      LoginFooter()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}