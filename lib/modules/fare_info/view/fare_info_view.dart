import 'package:flutter/material.dart';
import 'package:mrts/modules/fare_info/widget/fare_list.dart';
import 'package:mrts/utils/dimensions.dart';
import 'package:mrts/utils/style.dart';

class FareInfoScreen extends StatefulWidget {
  const FareInfoScreen({super.key});

  @override
  State<FareInfoScreen> createState() => _FareInfoScreenState();
}

class _FareInfoScreenState extends State<FareInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Fare Information",
          style: ubuntuRegular.copyWith(
            fontSize: Dimensions.fontSizeLarge,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 229, 236, 236),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true, 
      ),
      body: const SingleChildScrollView(
        child: FareInfoList(),
      ),
    );
  }
}
