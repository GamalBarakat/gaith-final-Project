import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/core/sharde/app_assets.dart';
import 'package:gaith/core/sharde/widget/styles.dart';

import '../../../core/sharde/widget/default_button.dart';

class VolunteerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return

      ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder:(context,index)=>const CardViewVolunter(),
          separatorBuilder: (context,index)=>SizedBox(height: 5.h,),
          itemCount: 10

      );




     
  }
}
class CardViewVolunter extends StatelessWidget {
  const CardViewVolunter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.all(8.0),
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
            SizedBox(height: 5.h,),
            Text('غيث ',style: Styles.textStyleTitleH4),SizedBox(height: 5.h,),
            Text('حمله توزيع افطار رمضان ',style: Styles.textStyleTitleH4),
            DefaultButton(function: (){},text: '',)

          ],
        ),
      ),
    );
  }
}
