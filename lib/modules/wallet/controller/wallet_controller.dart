import 'package:get/get.dart';
import 'package:mrts/modules/wallet/model/wallet_model.dart';
import 'package:mrts/utils/images.dart';

class WalletController extends GetxController implements GetxService{
   WalletController();
   List<WalletCategory>? _walletcategory;
   List<WalletCategory>? get walletcategory => _walletcategory;

  Future<void> getData() async{
    _walletcategory = [
      WalletCategory( 
        name: "Matercard",
        image: Images.mastercard
      ),
      WalletCategory( 
        name: "Visacard",
        image: Images.visa
      ),
      WalletCategory( 
        name: "bKash",
        image: Images.bkash
      ),
    ];
    update();
  }


}