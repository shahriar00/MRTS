import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrts/Login/tics.dart';
import 'package:mrts/modules/home/controller/home_controller.dart';
import 'package:mrts/modules/home/widget/metro_list.dart';
import 'package:mrts/modules/home/widget/top_section.dart';
import 'package:mrts/utils/dimensions.dart';
import 'package:mrts/utils/images.dart';
import 'package:mrts/utils/style.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
 final HomeController homeController = Get.put(HomeController());
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF3F1),
      appBar: AppBar( 
        backgroundColor: const Color(0xFFEBF3F1),
        leading:  Padding(
          padding: const EdgeInsets.only(left: 10,top: 10),
          child: Container(
            decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.white),
            child: Image.asset("images/menu.png",scale: 3,)),
        ),
        actions: [ 
          Padding(
            padding: const EdgeInsets.only(right: 10,top: 10),
            child: Image.asset(Images.notification,scale: 2,),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(right: 10,top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [             
              Image.asset(Images.homelogo,scale: 2,),
              const SizedBox(width: Dimensions.paddingSizeSmall,),
              Text("Dhaka Mass Transit\nCompany Limited",style: ubuntuRegular.copyWith(fontSize: 18),),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child:  Column(
          children: [ 
          SizedBox(height: Dimensions.paddingSizeExtraMoreLarge,),
          TopSections(),
          SizedBox(height: Dimensions.paddingSizeExtraMoreLarge,),
          MetroList(),
        ],),
      ),
      bottomNavigationBar:  Container(
        height: 90,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(Images.home,scale: 2,),
                label: '',
              ),
              BottomNavigationBarItem(
               icon: GestureDetector(
                onTap: (){
                  Get.to(()=>const TrainTicketSearch());
                  
                },
                child: Image.asset(Images.flat_settings,scale: 2,)),
              label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(Images.settings,scale: 2.5,),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.green,
            onTap: _onItemTapped,
          ),
        ),
      ),
    
    );
  }
}