import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mrts/modules/route/widget/google_map.dart';
import 'package:mrts/utils/dimensions.dart';
import 'package:mrts/utils/style.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({super.key});

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routes",style: ubuntuBold.copyWith(fontSize: Dimensions.fontSizeLarge,fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: const GoogleMapScreen(),
    );
  }

 

}