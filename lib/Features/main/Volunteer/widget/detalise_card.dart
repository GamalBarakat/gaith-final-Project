import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/core/sharde/widget/navigation.dart';

import '../../../../core/sharde/widget/default_button.dart';
import '../../../../core/sharde/widget/styles.dart';
import '../volunteer_now _page.dart';
class DetaliseCard extends StatelessWidget {
  const DetaliseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 5.h,),
          Text('غيث ',style: Styles.textStyleTitleH4),SizedBox(height: 5.h,),
          Text('حمله توزيع افطار رمضان ',style: Styles.textStyleTitleH4),
          DefaultButton(function: (){
            navigato(context, VolunteerNowPage());


          },text: 'تطوع الان',)
        ],
      ),
    );
  }
}