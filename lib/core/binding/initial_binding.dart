import 'package:get/get.dart';
import 'package:mrts/modules/fare_info/controller/fare_info_controller.dart';
import 'package:mrts/modules/home/controller/home_controller.dart';
import 'package:mrts/modules/other_info/controller/other_info_controller.dart';
import 'package:mrts/modules/time_table/controller/time_table_controller.dart';
import 'package:mrts/modules/wallet/controller/wallet_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => FareInfoController());
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => TimeTableController());
    Get.lazyPut(() => OtherInfoController());
  }
}