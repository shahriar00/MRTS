import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrts/modules/other_info/controller/other_info_controller.dart';
import 'package:mrts/utils/dimensions.dart';
import 'package:mrts/utils/style.dart';

class InfoList extends StatelessWidget {
  const InfoList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtherInfoController>(
      initState: (init) {
        Get.find<OtherInfoController>().getData();
      },
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(left: Dimensions.paddingSizeLarge, right: Dimensions.paddingSizeLarge,top: Dimensions.paddingSizeLarge),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.infocategory!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: Dimensions.paddingSizeLarge), // Adjust as needed
                  child: Container(
                    decoration: BoxDecoration( 
              borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
              color: Color(0xFFEBF3F1)
            ),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Column(
                        children: [
                          Container(
                            //width: MediaQuery.of(context).size.width,
                            decoration:const BoxDecoration( 
                              color: Colors.green,

                            ),
                            child: Text(
                              controller.infocategory![index].title!,
                              style: ubuntuRegular.copyWith(
                                fontSize: Dimensions.fontSizeLarge,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 245, 249, 249),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: Dimensions.paddingSizeDefault,
                          ),
                          Text(
                            controller.infocategory![index].description!,
                            style: ubuntuRegular.copyWith(
                              fontSize: Dimensions.fontSizeLarge,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 68, 69, 69),
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        
                         
                          
                          const SizedBox(
                            height: Dimensions.paddingSizeDefault,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
