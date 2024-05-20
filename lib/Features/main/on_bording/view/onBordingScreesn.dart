
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/sharde/chacheHelper.dart';
import '../../../../core/sharde/widget/navigation.dart';
import '../../../Auth/login/screens/login_screen.dart';
import '../model/list_on_bording.dart';
import 'widget/borderCard.dart';
import 'widget/button_pageIndicator_onbording.dart';
import 'widget/smooth_pageIndicator_onbording.dart';




var bordcontroll = PageController();

class OnBordingScreen extends StatefulWidget {
  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  bool isLast = false;
  int textButton=0;

  @override
  void submit() {
    CacheHelper.saveData(key: 'onBording', value: true).then((value) {
      if (value) {
       navigatofinsh(context, const LoginScreen(), true);

       }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      


      body: 
      SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xffFFFFFF),
                  Color(0xffB9FAF6),


                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd),
          ),
          child: Column(
            children: [
             Container(
                  height: MediaQuery.of(context).size.height/7,
                
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                            color: Color(0xffB9FAF6),
                        ),height: 50.h,width: 50.w),
                      ),




                      Container(width: MediaQuery.of(context).size.width/2,height: 130.h,child: Image.asset('assets/images/img_rectangle_99.png',width: MediaQuery.of(context).size.width,fit: BoxFit.cover,)),
                    ],
                  ),
                ),


              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    textButton=index;
                    if (index == BordingList.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  controller: bordcontroll,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>  BorderCard(index: index),
                  itemCount: BordingList.length,
                ),
              ),








              Container(
                height: MediaQuery.of(context).size.height/7,

                child: Row(

                  children: [


                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,

                          child: Image.asset(
                            'assets/images/Rectangle 98.png',
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: ButtonPageIndicatorOnBording(isLast: isLast,submit: submit,textButton: textButton)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const SmoothPageIndicatorOnBording(),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}




