import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/core/sharde/widget/navigation.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/sharde/app_assets.dart';
import '../../../../core/sharde/widget/default_button.dart';
import '../../../../core/sharde/widget/text_forn_field.dart';
import '../../home/feature/manager/home_cubite.dart';
import '../../home/feature/manager/home_view__state.dart';
import '../cubit/home_view_cubit.dart';
import '../cubit/home_view_state.dart';
class OtherDonationsListView extends StatelessWidget {
  OtherDonationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<DonorViewCubit, DonorViewState>(

      listener: (context,state)
      {


      },
      builder:(context,state){

        return
        (BlocProvider.of<DonorViewCubit>(context).donorModel ==null)?
        SizedBox(
          height: 100.h,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder:(context,index)=> InkWell(
                onTap: (){
                  navigato(context,  DonationDetails());
                },
                child: Column(
                  children: [

                    Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: Material(


                          elevation:1.0,
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            height: 50.h,
                            width: 50.h,
                          ),

                        ),

                    ),




                  ],
                ),
              ),
              separatorBuilder: (context,index)=>SizedBox(width: 5.w,),
              itemCount: 20

          ),
        )
            :
          SizedBox(
          height: 100.h,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder:(context,index)=> InkWell(
                onTap: (){
                  navigato(context,  DonationDetails());
                },
                child: Column(
                  children: [
                    Material(
                      color: Colors.white,
                      elevation:1.0,
                      borderRadius: BorderRadius.circular(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          '${BlocProvider.of<DonorViewCubit>(context).donorModel!.catigory![index].img}',
                          height: 50.h,
                          width: 50.h,
                        ),
                      ),
                    ),
                    5.verticalSpace,

                    Text('${BlocProvider.of<DonorViewCubit>(context).donorModel!.catigory![index].nameAr}',style:  TextStyle(
                      color: Colors.black,


                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      fontFamily: 'Tajawal',


                    ),
                  )
                  ],
                ),
              ),
              separatorBuilder: (context,index)=>SizedBox(width: 5.w,),
              itemCount: BlocProvider.of<DonorViewCubit>(context).donorModel!.catigory!.length

          ),
        );

      },

    );
  }
}

class DonationDetails extends StatelessWidget {

   DonationDetails({super.key});
   var nameController=TextEditingController();
   var phoneController=TextEditingController();
   var addressController=TextEditingController();
   var descriptionController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return

      BlocProvider(
        create: (context) => HomeViewCubit(),

        child: BlocConsumer<HomeViewCubit, HomeViewState>(
          listener: (context, state) {},
          builder: (context, state){
            return Scaffold(
              body:
              SafeArea(
                child:  

                SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,

                        children: [
                          Image.asset( 'assets/images/banar1.png',width: MediaQuery.of(context).size.width,fit: BoxFit.fill,),
                          Positioned(

                              bottom: -50,
                              left: 8,
                              right: 8,
                              child:
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),

                                ),
                                padding: const EdgeInsets.all(5),


                                child:  Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('الصجه', style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,

                                      fontFamily: 'Tajawal',
                                    ),),
                                    Text('تطوير المنظومه الصحيه لعلاج ومكافحه الامراض الاكثر انتشارا فى المجتمع المصرى ',style: TextStyle(  fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff555555),

                                      fontFamily: 'Tajawal',),),

                                  ],
                                ),
                              )),
                          IconButton(onPressed: (){navigapop(context);}, icon: Icon(Icons.arrow_back_ios))


                        ],
                      ),

                      SizedBox(height: 50.h,),

                      CustomTextFormField(hintText: 'الإسم',
                        controller:nameController,
                        validator:(value) {
                          if (value!.isEmpty) {
                            return 'حقل الاسم مطلوب';
                          } else {
                            return null;
                          }
                        },
                        textInputType: TextInputType.visiblePassword,),
                      CustomTextFormField(hintText: 'رقم الموبيل',
                        controller:phoneController,
                        validator:(value) {
                          if (value!.isEmpty) {
                            return 'حقل الموبيل مطلوب';
                          } else {
                            return null;
                          }
                        },
                        textInputType: TextInputType.phone,),
                      CustomTextFormField(hintText: 'العنوان',
                        controller:addressController,
                        validator:(value) {
                          if (value!.isEmpty) {
                            return 'حقل العنوان مطلوب';
                          } else {
                            return null;
                          }
                        },
                        textInputType: TextInputType.streetAddress,),
                      CustomTextFormField(hintText: 'تفاصيل التبرع',
                        controller:descriptionController,
                        validator:(value) {
                          if (value!.isEmpty) {
                            return 'هذا الحقل  مطلوب';
                          } else {
                            return null;
                          }
                        },
                        textInputType: TextInputType.text,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(onTap:(){

                            BlocProvider.of<HomeViewCubit>(context).getProfileImageByCamera();
                          } ,child: Icon(Icons.camera_alt,color: Color(0xff529C9C),)),
                          InkWell(onTap:(){

                            BlocProvider.of<HomeViewCubit>(context).getProfileImageByGallery();
                          } ,child: Image.asset(AppAssets.Attachphoto)),


                        ],
                      ),
                       if(BlocProvider.of<HomeViewCubit>(context).donationPhoto!=null)
                      SizedBox(width: 200,child: Image.file(BlocProvider.of<HomeViewCubit>(context).donationPhoto!,width: MediaQuery.of(context).size.width,)),

                    SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DefaultButton(function: (){},text: 'تبرع',),
                      )

                    ],
                  ),
                ),



              ),
            );
          },



        ),
      );
  }
}
