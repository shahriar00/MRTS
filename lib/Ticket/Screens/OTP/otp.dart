import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrts/Ticket/Components/CustomButton.dart';
import 'package:mrts/Ticket/Screens/Splash/splash.dart';
import 'package:mrts/modules/home/view/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Components/constent.dart';
import '../../Controllers/OtpController.dart';

class OtpController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var verificationId = ''.obs;

  void verifyPhone(String phone) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        // Handle sign-in completion
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar('Verification Failed', e.message!);
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
        // Handle OTP sent
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
        // Handle auto retrieval timeout
      },
    );
  }

void signInWithOtp(String smsCode) async {
  PhoneAuthCredential credential = PhoneAuthProvider.credential(
    verificationId: verificationId.value,
    smsCode: smsCode,
  );

  try {
    await _auth.signInWithCredential(credential);
    Get.offAll(() => HomePage()); // Navigate to HomePage and remove all previous routes
  } catch (e) {
    Get.snackbar('Sign-In Error', e.toString());
  }
}


  void reset() {
    verificationId.value = '';
  }
}




class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final OtpController otpController = Get.put(OtpController());
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpControllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Color.fromRGBO(235, 243, 241, 1),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                height: 240.h,
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
              SingleChildScrollView(
                child: Container(
                 // height: 711.h,
                  width: 365.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 29.w),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  otpController.reset();
                                  Get.to(SplashScreen());
                                },
                                icon: const Icon(Icons.arrow_back),
                              ),
                              Text(
                                'Verification',
                                style: textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 46.w, right: 46.w),
                          child: Text(
                            'We send a code to verify your \nMobile number',
                            style: textTheme.titleMedium,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 50.h),
                        Padding(
                          padding: EdgeInsets.only(left: 46.w, right: 46.w),
                          child: TextField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              labelText: 'Enter your phone number',
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Center(
                          child: Container(
                            width: 300,
                            child: CustomButton(
                              text: 'Send OTP',
                              onPressed: () {
                                if (phoneController.text.isNotEmpty) {
                                  otpController.verifyPhone(phoneController.text);
                                } else {
                                  Get.snackbar('Error', 'Please enter a phone number');
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Padding(
                          padding: EdgeInsets.only(left: 46.w, right: 46.w),
                          child: Text(
                            'Enter your OTP code here',
                            style: textTheme.headlineMedium,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 46.w, right: 46.w),
                          child: TextField(
                            controller: otpControllerText,
                            decoration: InputDecoration(
                              labelText: 'OTP Code',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: 300.w,
                            height: 40.h,
                            child: CustomButton(
                              text: 'Continue',
                              onPressed: () {
                                if (otpControllerText.text.isNotEmpty) {
                                  otpController.signInWithOtp(otpControllerText.text);
                                } else {
                                  Get.snackbar('Error', 'Please enter OTP code');
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 19.h,
                        ),
                        Center(
                          child: Text(
                            'I didn’t receive a code',
                            style: textTheme.titleSmall?.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              if (phoneController.text.isNotEmpty) {
                                otpController.verifyPhone(phoneController.text);
                              } else {
                                Get.snackbar('Error', 'Please enter a phone number');
                              }
                            },
                            child: Text(
                              'RESEND',
                              style: textTheme.headlineSmall,
                            ),
                          ),
                        ),
                       
                      ],
                    ),
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
