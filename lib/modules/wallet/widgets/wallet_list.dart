import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrts/modules/wallet/controller/wallet_controller.dart';
import 'package:mrts/utils/dimensions.dart';
import 'package:mrts/utils/style.dart';


class WalletList extends StatelessWidget {
  const WalletList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      initState: (init) {
        Get.find<WalletController>().getData();
      },
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.paddingSizeLarge,
              right: Dimensions.paddingSizeLarge,
              top: Dimensions.paddingSizeLarge),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.walletcategory!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    bottom: Dimensions.paddingSizeLarge), // Adjust as needed
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.paddingSizeSmall),
                      color: Color(0xFFEBF3F1)),
                  child: Padding(
                    padding:
                        const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    child: Column(
                      children: [
                        Image.asset(
                          controller.walletcategory![index].image!,
                          scale: 1.2,
                         
                        ),
                        const SizedBox(
                          height: Dimensions.paddingSizeDefault,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: Dimensions.paddingSizeDoubleExtraLarge,right: Dimensions.paddingSizeDoubleExtraLarge),
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(8)),
                            child: Center(child: Text(controller.walletcategory![index].name!,style: ubuntuBold.copyWith(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),))),
                        ),
                       
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
