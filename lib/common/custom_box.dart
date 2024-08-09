import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final String images;
  const CustomBox({super.key,required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration( 
        border: Border.all(color: Colors.green,width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white
      ),
      child: Center(child: Image.asset(images,scale: 2,),),
    );
  }
}