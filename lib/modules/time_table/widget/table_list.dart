import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrts/modules/time_table/controller/time_table_controller.dart';
import 'package:mrts/utils/dimensions.dart';
import 'package:mrts/utils/images.dart';
import 'package:mrts/utils/style.dart';

class TableList extends StatelessWidget {
  const TableList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimeTableController>(
      initState: (init) {
        Get.find<TimeTableController>().getData();
      },
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(left: Dimensions.paddingSizeLarge, right: Dimensions.paddingSizeLarge,top: Dimensions.paddingSizeLarge),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.tablecategory!.length,
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
                                controller.tablecategory![index].image!,
                                scale: 2,
                              ),
                      
                              // Adjust as needed
                              Text(
                                controller.tablecategory![index].taka!,
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
                                controller.tablecategory![index].start!,
                                style: ubuntuRegular.copyWith(
                                  fontSize: Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 68, 69, 69),
                                ),
                              ),
                              // Adjust as needed
                              Text(
                                "<---------->",
                                style: ubuntuRegular.copyWith(
                                  fontSize: Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 68, 69, 69),
                                ),
                              ),
                              Text(
                                controller.tablecategory![index].des!,
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
                                controller.tablecategory![index].time!,
                                style: ubuntuRegular.copyWith(
                                  fontSize: Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 68, 69, 69),
                                ),
                              ),
                              // Adjust as needed
                              Image.asset(Images.move,scale: 2,),
                              Text(
                                controller.tablecategory![index].destime!,
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
