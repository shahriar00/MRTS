import 'package:get/get.dart';
import 'package:mrts/Ticket/Screens/Splash/splash.dart';
import 'package:mrts/modules/fare_info/view/fare_info_view.dart';
import 'package:mrts/modules/home/view/homepage.dart';
import 'package:mrts/modules/my_route/view/my_route_view.dart';
import 'package:mrts/modules/other_info/view/other_info_view.dart';
import 'package:mrts/modules/route/view/routes.dart';
import 'package:mrts/modules/time_table/view/time_table.dart';
import 'package:mrts/modules/wallet/view/wallet_view.dart';


class RouteHelper{

 
  static const String splashScreen = '/';
  

  /// Initial page name declared .........
  static const String homeScreen = '/home';
  static const String myRoute = '/my-route';
  static const String fareInformation = '/fareInfo';
  static const String timeTableInformation = '/timeTable';
  static const String walletScreen = '/wallet';
  static const String metroMapScreen = '/metroMap';
  static const String otherInfoScreen = '/otherInfo';

  /// For page redirect .............
   static String getmySplashScreen() => splashScreen;
  static String getmyHomeScreen() => homeScreen;
  static String getmyRouteScreen() => myRoute;
  static String getfareInfoScreen() => fareInformation;
  static String gettimeTableScreen() => timeTableInformation;
  static String getwalletScreen() => walletScreen;
  static String getmetroMapScreen() => metroMapScreen;
  static String getotherInfoScreen() => otherInfoScreen;

  /// List for Initial Page Declared ..............
  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: ()=>  SplashScreen()),
    GetPage(name: homeScreen, page: ()=> const HomePage()),
    GetPage(name: fareInformation, page: ()=> const FareInfoScreen()),
    GetPage(name: myRoute, page: ()=> const MyRoutesScreen()),
    GetPage(name: otherInfoScreen, page: ()=> const OtherInfoScreen()),
    GetPage(name: metroMapScreen, page: ()=> const RoutesScreen()),
    GetPage(name: timeTableInformation, page: ()=> const TimeTableScreen()),
    GetPage(name: walletScreen, page: ()=> const WalletScreen()),
  ];
}