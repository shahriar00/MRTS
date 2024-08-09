import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrts/modules/fare_info/controller/fare_info_controller.dart';
import 'package:mrts/utils/dimensions.dart';
import 'package:mrts/utils/style.dart';

class FareInfoList extends StatelessWidget {
  const FareInfoList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FareInfoController>(
      initState: (init) {
        Get.find<FareInfoController>().getData();
      },
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(left: Dimensions.paddingSizeLarge, right: Dimensions.paddingSizeLarge,top: Dimensions.paddingSizeLarge),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.farecategory!.length,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                controller.farecategory![index].image!,
                                scale: 2,
                              ),
                      
                              // Adjust as needed
                              Text(
                                controller.farecategory![index].taka!,
                                style: ubuntuRegular.copyWith(
                                  fontSize: Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 68, 69, 69),
                                ),
                              ),
                      
                      
                            ],
                          ),
                          const SizedBox(
                            height: Dimensions.paddingSizeDefault,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //  Image.asset(controller.farecategory![index].image!,scale: 2,),
                              Text(
                                controller.farecategory![index].start!,
                                style: ubuntuRegular.copyWith(
                                  fontSize: Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 68, 69, 69),
                                ),
                              ),
                              // Adjust as needed
                              Text(
                                "<----------->",
                                style: ubuntuRegular.copyWith(
                                  fontSize: Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 68, 69, 69),
                                ),
                              ),
                              Text(
                                controller.farecategory![index].des!,
                                style: ubuntuRegular.copyWith(
                                  fontSize: Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 68, 69, 69),
                                ),
                              ),
                            ],
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
