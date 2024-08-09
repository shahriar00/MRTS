import 'package:get/get.dart';
import 'package:mrts/modules/time_table/model/time_table_model.dart';
import 'package:mrts/utils/images.dart';

class TimeTableController extends GetxController implements GetxService{
   TimeTableController();
   List<TimeTableCategory>? _tablecategory;
   List<TimeTableCategory>? get tablecategory => _tablecategory;

  Future<void> getData() async{
    _tablecategory = [
      TimeTableCategory( 
        image: Images.homelogo,
        taka: "BDT 50.00",
        start: "Uttara North",
        des: "Mirpur 10",
        time: "8:30 AM",
        destime: "9:00 AM"
      ),

        TimeTableCategory( 
        image: Images.homelogo,
        taka: "BDT 20.00",
        start: "Dhaka University",
        des: "Mirpur 10",
         time: "8:30 AM",
        destime: "11:00 AM"
      ),

        TimeTableCategory( 
        image: Images.homelogo,
        taka: "BDT 35.00",
        start: "Uttara South",
        des: "Mirpur 10",
         time: "8:30 AM",
        destime: "9:45 AM"
      ),

        TimeTableCategory( 
        image: Images.homelogo,
        taka: "BDT 60.00",
        start: "Motijheel",
        des: "Mirpur 10",
         time: "8:30 AM",
        destime: "9:30 AM"
      ),

        TimeTableCategory( 
        image: Images.homelogo,
        taka: "BDT 30.00",
        start: "Farmgate",
        des: "Mirpur 10",
         time: "8:30 AM",
        destime: "10:00 AM"
      ),
     
    ];
    update();
  }


}