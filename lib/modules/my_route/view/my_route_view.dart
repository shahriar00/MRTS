import 'package:flutter/material.dart';
import 'package:mrts/modules/my_route/widgets/google_map_pages.dart';
import 'package:mrts/utils/dimensions.dart';
import 'package:mrts/utils/style.dart';

class MyRoutesScreen extends StatefulWidget {
  const MyRoutesScreen({super.key});

  @override
  State<MyRoutesScreen> createState() => _MyRoutesScreenState();
}

class _MyRoutesScreenState extends State<MyRoutesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Routes",style: ubuntuBold.copyWith(fontSize: Dimensions.fontSizeLarge,fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body:const GoogleMapPageData(),
    );
  }

 
}




