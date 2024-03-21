import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/main/Volunteer/widget/card_view_volunter.dart';
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


