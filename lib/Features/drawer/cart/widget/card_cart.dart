import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/sharde/app_assets.dart';
import '../../../../core/sharde/widget/consts.dart';
class CardCart extends StatelessWidget {
  int idDonation;
  String image;
  int price;
   CardCart({super.key,required this.idDonation,required this.image,required this.price});

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
      onTap: (){
        print('Token');
        print(uId);
      },
      child: Container(

        padding:EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child:
        Row(

          children: [
            Expanded(flex: 1,child: Image.network(image)),
           10.horizontalSpace,
            Expanded(
              flex: 2,
              child: Column(

         crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                Text('كسوه العيد') ,
                    Text(price.toString()) ,
              ],),

            ),

          ],
        ),
      ),
    );
  }
}