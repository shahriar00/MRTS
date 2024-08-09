import 'package:flutter/material.dart';
import 'package:mrts/modules/wallet/widgets/wallet_list.dart';
import 'package:mrts/utils/dimensions.dart';
import 'package:mrts/utils/style.dart';


class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF3F1),
      appBar: AppBar( 
       
        backgroundColor: Colors.green,
        title: Text("Wallet",style: ubuntuRegular.copyWith(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
      ),
      body: 
      
          SingleChildScrollView(child: WalletList()),
      
      
      
    );
  }
}