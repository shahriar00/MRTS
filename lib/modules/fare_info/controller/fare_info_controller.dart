import 'package:get/get.dart';
import 'package:mrts/modules/fare_info/model/fare_info_model.dart';
import 'package:mrts/utils/images.dart';

class FareInfoController extends GetxController implements GetxService{
   FareInfoController();
   List<FareInfoCategory>? _farecategory;
   List<FareInfoCategory>? get farecategory => _farecategory;

  Future<void> getData() async{
    _farecategory = [
      FareInfoCategory( 
        image: Images.homelogo,
        taka: "BDT 50.00",
        start: "Uttara North",
        des: "Mirpur 10"
      ),

        FareInfoCategory( 
        image: Images.homelogo,
        taka: "BDT 20.00",
        start: "Dhaka University",
        des: "Mirpur 10"
      ),

        FareInfoCategory( 
        image: Images.homelogo,
        taka: "BDT 35.00",
        start: "Uttara South",
        des: "Mirpur 10"
      ),

        FareInfoCategory( 
        image: Images.homelogo,
        taka: "BDT 60.00",
        start: "Motijheel",
        des: "Mirpur 10"
      ),

        FareInfoCategory( 
        image: Images.homelogo,
        taka: "BDT 30.00",
        start: "Farmgate",
        des: "Mirpur 10"
      ),
     
    ];
    update();
  }


}