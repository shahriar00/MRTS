import 'package:get/get.dart';
import 'package:mrts/modules/other_info/model/other_info_category_model.dart';


class OtherInfoController extends GetxController implements GetxService{
   OtherInfoController();
   List<OtherInfoCategory>? _infocategory;
   List<OtherInfoCategory>? get infocategory => _infocategory;

  Future<void> getData() async{
    _infocategory = [
      OtherInfoCategory( 
        title: 'Service Hours',
        description: 'Our metro services operate from 5 AM to 11 PM daily. Make sure to check the schedule for any updates.',
      ),
      OtherInfoCategory( 
        title: 'Contact Us',
        description: 'For assistance, call us at 123-456-7890 or email us at support@dmtc.com. We are here to help you 24/7.',
      ),
      OtherInfoCategory( 
        title: 'Lost and Found',
        description: 'Report lost items at our customer service desk located at each station. You can also call us to check the status of your lost items.',
      ),
      OtherInfoCategory( 
        title: 'Safety Guidelines',
        description: 'Please follow all safety guidelines while using our services. This includes wearing masks, maintaining social distancing, and following the instructions of the staff.',
      ),
      OtherInfoCategory( 
        title: 'Ticketing Information',
        description: 'You can purchase tickets online or at the station. We offer various types of tickets including single journey, return, and monthly passes.',
      ),
      OtherInfoCategory( 
        title: 'Accessibility Services',
        description: 'We provide accessibility services for passengers with disabilities. This includes elevators, ramps, and dedicated seating areas.',
      ),



       
     
    ];
    update();
  }


}