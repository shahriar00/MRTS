import 'package:flutter/material.dart';
import 'package:mrts/modules/time_table/widget/table_list.dart';
import 'package:mrts/utils/dimensions.dart';
import 'package:mrts/utils/style.dart';

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({super.key});

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Time Table Information",
          style: ubuntuRegular.copyWith(
            fontSize: Dimensions.fontSizeLarge,
            fontWeight: FontWeight.bold,
            color:  Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: const TableList(),
    );
  }
}
