import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrts/common/custom_box.dart';
import 'package:mrts/modules/home/controller/home_controller.dart';
import 'package:mrts/routes/route_helper.dart';
import 'package:mrts/utils/dimensions.dart';
import 'package:mrts/utils/style.dart';

class MetroList extends StatelessWidget {
  const MetroList({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(), // Initialize the controller
      builder: (controller) {
        // Fetch data when the widget builds
        controller.getData();

        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: MediaQuery.of(context).size.height / 2.20,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 60.0,
              ),
              itemCount: controller.homecategory!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Get.toNamed(RouteHelper.getmyRouteScreen());
                              break;
                            case 1:
                              Get.toNamed(RouteHelper.getfareInfoScreen());
                              break;
                            case 2:
                              Get.toNamed(RouteHelper.gettimeTableScreen());
                              break;
                            case 3:
                              Get.toNamed(RouteHelper.getwalletScreen());
                              break;
                            case 4:
                              Get.toNamed(RouteHelper.getmetroMapScreen());
                              break;
                            case 5:
                              Get.toNamed(RouteHelper.getotherInfoScreen());
                              break;
                            default:
                              // Default action or screen
                              break;
                          }
                        },
                        child: CustomBox(
                          images: controller.homecategory![index].image!,
                        ),
                      ),
                    ),
                    Text(
                      controller.homecategory![index].name!,
                      style: ubuntuRegular.copyWith(
                        fontSize: Dimensions.fontSizeLarge,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 68, 69, 69),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
