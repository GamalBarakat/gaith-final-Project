import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/drawer/cart/widget/card_cart.dart';
import 'package:gaith/core/sharde/app_assets.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Color(0xffF4F6FE),
      body:
      ListView.builder(physics:BouncingScrollPhysics()

        ,itemBuilder:(context,index)=>
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              child: CardCart(),
            ), itemCount: 20,)



    );
  }
}



