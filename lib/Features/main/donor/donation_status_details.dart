import 'dart:math';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaith/Features/main/home/feature/manager/home_cubite.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:wave_linear_progress_indicator/wave_linear_progress_indicator.dart';

import '../../../core/sharde/app_assets.dart';
import '../../../core/sharde/widget/default_button.dart';
import '../../../core/sharde/widget/navigation.dart';
import 'cubit/home_view_cubit.dart';
import 'cubit/home_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DonationStatusDetails extends StatelessWidget {
  int id;
  DonationStatusDetails({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Color(0xffF4F6FE),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
        BlocProvider(
        create: (context) => DonorViewCubit()..getDetail(id: id),
        
            child: BlocConsumer<DonorViewCubit, DonorViewState>(
            listener: (context,state)
            {},
            builder:(context,state){
        
              return   ConditionalBuilder(
        
          condition: BlocProvider.of<DonorViewCubit>(context).detailsModel!=null,
        
          builder: (context){
            return   Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.sp),
                              bottomRight: Radius.circular(15.sp),
                            ),
                            color: Colors.white),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  navigapop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios)),

                            Text('تفاصيل الحاله',  style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff555555),

                              fontFamily: 'Tajawal',
                            ),),

                            IconButton(
                                onPressed: () {
                                },
                                icon: Icon(Icons.drag_indicator_rounded)),
                          ],
                        )),
                    10.verticalSpace,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        '${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.img}',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                        height: 200.h,
                      ),
                    ),
        
                    20.verticalSpace,
        
        
                    Text( '${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.name}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
        
                        fontFamily: 'Tajawal',
                      ),
        
                    ),
                    20.verticalSpace,
                    Text(
                      '${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.des}'
                      ,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555555),
        
                        fontFamily: 'Tajawal',
                      ),
                    ),
                    5.verticalSpace,
        
                    Row(
                      children: [
                        Icon(Icons.phone),
                        5.horizontalSpace,
                        Text('${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.phone}')
                      ],
                    ),
                      5.verticalSpace,
                    Row(
                      children: [
                        Image.asset(AppAssets.location_icon,width: 20.w,),
                        5.horizontalSpace,
                        Text('${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.address}')
                      ],
                    ),
        
                      10.verticalSpace,
        
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius:BorderRadius.circular(5),
                              child: LinearProgressBar(
                                maxSteps: int.parse( '${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.price}'),
                                progressType: LinearProgressBar.progressTypeLinear,
                                currentStep:int.parse( '${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.pay}'),
                                progressColor: Colors.green,
                                backgroundColor: Colors.black,

                                minHeight: 15.h,

                              ),
                            ),
                            Container(width: 50.w,height:18.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey),child: Center(child: Text('${(100/1000)*100}%',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.pay}',  style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff555555),
        
                                fontFamily: 'Tajawal',
                              ),),
                              Text('${BlocProvider.of<DonorViewCubit>(context).detailsModel!.donation!.price}',  style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff555555),
        
                                fontFamily: 'Tajawal',
                              ),),
        
                            ],
                          ),
                        ),
                      ],
                    ),




                    20.verticalSpace,
                    DefaultButton(text: 'مساعده الحاله',function: (){



                    },),
        
        
                  ],
                ),
              ),
            );
          },
        
          fallback: (context)
              {
        return Text('data');
        
              });
        
        
        
        
            }))
        
        ),
      ),
    );
  }
}

