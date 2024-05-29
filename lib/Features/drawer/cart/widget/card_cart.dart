import 'package:flutter/material.dart';

import '../../../../core/sharde/app_assets.dart';
class CardCart extends StatelessWidget {
  const CardCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding:EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child:
      Row(

        children: [
          Expanded(flex: 1,child: Image.asset(AppAssets.Attachphoto,height: 50,)),
          Expanded(
            flex: 2,
            child: Column(

       crossAxisAlignment: CrossAxisAlignment.start,

                children: [
              Text('كسوه العيد') ,
              Text('كسوه العيد2222222222222222222222222') ,
            ],),

          ),
          Text('20') ,
        ],
      ),
    );
  }
}