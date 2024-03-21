
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/sharde/app_assets.dart';
import 'detalise_card.dart';

class CardViewVolunter extends StatelessWidget {
  const CardViewVolunter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(width: MediaQuery.of(context).size.width,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(AppAssets.volunter),
                    fit: BoxFit.cover,
                  ),
                ),


                height: 100.0.h),
            DetaliseCard()

          ],
        ),
      ),
    );
  }
}