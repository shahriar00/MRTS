import 'package:flutter/material.dart';
import 'package:mrts/modules/other_info/widget/info_list.dart';
import 'package:mrts/utils/dimensions.dart';
import 'package:mrts/utils/style.dart';

class OtherInfoScreen extends StatefulWidget {
  const OtherInfoScreen({super.key});

  @override
  State<OtherInfoScreen> createState() => _OtherInfoScreenState();
}

class _OtherInfoScreenState extends State<OtherInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Other Information",
          style: ubuntuRegular.copyWith(
            fontSize: Dimensions.fontSizeLarge,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 236, 243, 243),
          ),
        ),
        centerTitle: true,
      ),
      body: const InfoList(),
    );
  }
}
