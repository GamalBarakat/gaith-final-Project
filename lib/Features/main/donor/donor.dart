import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/main/donor/widget/humanitarian_cases_all_screen.dart';
import 'package:gaith/Features/main/donor/widget/other_donations_list_view.dart';
import 'package:gaith/core/sharde/widget/navigation.dart';
import 'package:marquee/marquee.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/sharde/app_assets.dart';
import '../../../core/sharde/app_colors.dart';
import '../../../core/sharde/widget/default_button.dart';
import 'cubit/home_view_cubit.dart';
import 'cubit/home_view_state.dart';
import 'donation_status_details.dart';
class DonorPage extends StatelessWidget {
  const DonorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return

      BlocProvider(
        create: (context) => DonorViewCubit()..getHomeData()..getSharesData(),

      child: BlocConsumer<DonorViewCubit, DonorViewState>(
        listener: (context,state)
        {},
        builder:(context,state)
          {

            return
              Container(
              width: MediaQuery.of(context).size.width,


              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                //   SizedBox(
                //   width: 200.0,
                //   height: 100.0,
                //   child: Shimmer.fromColors(
                //     baseColor: Colors.grey,
                //     highlightColor: Colors.white,
                //     child:
                //
                //   ),
                // ),



                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 220.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(AppAssets.banar1,),


                            ),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),

                        ),

                        Positioned(bottom:-60,left: 1,right: 1,child: OtherDonationsListView()),
                      ],

                    ),
                   60.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:
                        Marquee(

                          text:' مع ابليكشن غيث تبرعك سوف يصل الى كل محتاج تبرع الان ',

                          style: TextStyle(fontSize: 12.0.sp,fontFamily: 'Ottoman', color: Colors.white,fontWeight: FontWeight.bold),


                          scrollAxis: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          blankSpace: 20.0,
                          velocity: 100.0,
                          pauseAfterRound: Duration(milliseconds: 500),
                          startPadding: 10.0,
                          accelerationDuration: Duration(milliseconds: 500),
                          accelerationCurve: Curves.linear,
                          decelerationDuration: Duration(milliseconds: 500),
                          decelerationCurve: Curves.easeOut,
                        ),
                      ),
                    ),
10.verticalSpace,
                    (BlocProvider.of<DonorViewCubit>(context).donorModel==null)?
                        Container():

                SizedBox(
                  height: 150.0.h,

                  width: MediaQuery.of(context).size.width,
                  child:
                    CarouselSlider.builder(
                      itemCount: BlocProvider.of<DonorViewCubit>(context).donorModel!.advertisements!.length,
                      itemBuilder: (context, index, realIndex) {
                        return
                          (BlocProvider.of<DonorViewCubit>(context).donorModel!.advertisements!.length==0)?
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 100.0.h,
                            child:
                            Shimmer.fromColors(
                                baseColor: Colors.grey,
                                highlightColor: Colors.white,
                                child:Container( width: MediaQuery.of(context).size.width,decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  borderRadius: BorderRadius.circular(10),

                                ),)

                            ),
                          ):
                          ClipRRect
                            (
                          borderRadius: BorderRadius.circular(10),
                          child:
                            (BlocProvider.of<DonorViewCubit>(context).donorModel!.advertisements![index].img==null)?
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 100.0.h,
                              child: Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.white,
                                  child:Container( width: MediaQuery.of(context).size.width,color: Colors.grey.shade50,)

                              ),
                            )
                                :Image.network(


                            width: MediaQuery.of(context).size.width,
                            '${BlocProvider.of<DonorViewCubit>(context).donorModel!.advertisements![index].img}',
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height,
                        onPageChanged: (index, reason) {
                          BlocProvider.of<DonorViewCubit>(context).onPageChanged(index: index);
                        },
                      ),
                    ),

                ),
                    5.verticalSpace,
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        ' ( الَّذِينَ يُنفِقُونَ فِي السَّرَّاءِ وَالضَّرَّاءِ وَالْكَاظِمِينَ الْغَيْظَ وَالْعَافِينَ عَنِ النَّاسِ ۗ وَاللَّهُ يُحِبُّ الْمُحْسِنِينَ )',
                        style: TextStyle(fontSize: 18.0.sp,fontFamily: 'Ottoman', color: Colors.black,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,

                      ),
                    ),

5.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:

                      Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
  Text('الحالات الانسانيه',style:  TextStyle(

    color: Colors.black,


    fontWeight: FontWeight.bold,
    fontSize: 15.sp,
    fontFamily: 'Tajawal',


  ),),
  InkWell(
    onTap: (){
      navigato(context, HumanitarianCasesAllScreen());
    },
    child: Text('عرض الكل',style:  TextStyle(

      color: Colors.blue,


      fontWeight: FontWeight.w500,
      fontSize: 12.sp,
      fontFamily: 'Tajawal',


    ),),
  ),

],

                      ),
                    ),


                    (BlocProvider.of<DonorViewCubit>(context).donorModel ==null)?
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 320.h,
                      child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child:Container( width: MediaQuery.of(context).size.width,decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(10),
                                            
                          ),)
                                            
                      ),
                    ):

                      SizedBox(
                        height: 320.h,

                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder:(context,index){
                            return
                              Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Container(
                                width: MediaQuery.of(context).size.width*.8,
                                decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(10.sp),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height:MediaQuery.of(context).size.width*.4,child:
                                    ClipRRect(borderRadius: BorderRadius.only(topLeft:Radius.circular(10.sp),
                                      topRight:Radius.circular(10.sp),
                                    ),child:(BlocProvider.of<DonorViewCubit>(context).donorModel!.donations![index].img==null)?
                              CircularProgressIndicator(
                                value: 0.7,
                              ):
                                    InkWell(onTap: (){print(BlocProvider.of<DonorViewCubit>(context).donorModel!.donations![index].img);},child: Image.network('${BlocProvider.of<DonorViewCubit>(context).donorModel!.donations![index].img}',width: double.infinity,fit: BoxFit.cover,)))),

                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                                                        
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              '${BlocProvider.of<DonorViewCubit>(context).donorModel!.donations![index].name}',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Tajawal',
                                              ),
                                            ),
                                            Text(
                                              maxLines: 2,
                                      
                                              '${BlocProvider.of<DonorViewCubit>(context).donorModel!.donations![index].dec}',
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 14.sp,
                                                color: Color(0xff555555),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Tajawal',
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex:3,
                                                  child: DefaultButton(function: (){
                                                    final donation = BlocProvider.of<DonorViewCubit>(context).donorModel!.donations![index];
                                                    navigato(context, DonationStatusDetails(id: donation.id ?? 1));
                                                  },text: 'تبرع',),
                                                ),

2.horizontalSpace,
                                                Expanded(
                                                    flex: 1,
                                                    child:  Container(
                                                      decoration: BoxDecoration(
                                                        color:  AppColors.buttonColor,
                                                        borderRadius: BorderRadius.circular(8.0),
                                                      ),
                                                      width: double.infinity,
                                                      height: 40.h,

                                                      child: MaterialButton(
                                                          onPressed:(){
print('${BlocProvider.of<DonorViewCubit>(context).donorModel!.donations![index].id}');
                                                            BlocProvider.of<DonorViewCubit>(context).addCart(donationId:BlocProvider.of<DonorViewCubit>(context).donorModel!.donations![index].id??1 );
                                                          },
                                                          child:
                                                          Icon(Icons.shop, color: Colors.white,)

                                                      ),
                                                    )
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                            );
                          }
                          , itemCount: BlocProvider.of<DonorViewCubit>(context).donorModel!.donations!.length,),
                      ),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        ' ( الَّذِينَ يُنفِقُونَ فِي السَّرَّاءِ وَالضَّرَّاءِ وَالْكَاظِمِينَ الْغَيْظَ وَالْعَافِينَ عَنِ النَّاسِ ۗ وَاللَّهُ يُحِبُّ الْمُحْسِنِينَ )',
                        style: TextStyle(fontSize: 18.0.sp,fontFamily: 'Ottoman', color: Colors.black,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:

                      Text('الاسهم',style:  TextStyle(

                        color: Colors.black,


                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        fontFamily: 'Tajawal',


                      ),),
                    ),

                    SizedBox(
                      height: 320.h,

                      child:

                      (BlocProvider.of<DonorViewCubit>(context).shareModel ==null)?
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 320.h,
                        child: Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.white,
                            child:Container( width: MediaQuery.of(context).size.width,decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(10),

                            ),)

                        ),
                      ):

                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(context,index){
                          return
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Container(
                                width: MediaQuery.of(context).size.width*.8,
                                decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(10.sp),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 0.5,
                                  ),),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height:MediaQuery.of(context).size.width*.4,child: ClipRRect(borderRadius: BorderRadius.only(topLeft:Radius.circular(10.sp),
                                      topRight:Radius.circular(10.sp),
                                    ),child:(BlocProvider.of<DonorViewCubit>(context).shareModel!.shares![index].img==null)?
                                    CircularProgressIndicator(
                                      value: 0.7,
                                    ):
                                    Image.network('${BlocProvider.of<DonorViewCubit>(context).shareModel!.shares![index].img}',width: double.infinity,fit: BoxFit.cover,))),

                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 4),

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              '${BlocProvider.of<DonorViewCubit>(context).shareModel!.shares![index].name}',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Tajawal',
                                                color: Colors.black
                                              ),
                                            ),
                                            Text(
                                              maxLines: 2,

                                              '${BlocProvider.of<DonorViewCubit>(context).shareModel!.shares![index].dec}',
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 14.sp,
                                                color: Color(0xff555555),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Tajawal',
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.abc_outlined),
                                                Text(


                                                  '${BlocProvider.of<DonorViewCubit>(context).shareModel!.shares![index].price}',
                                                  style: TextStyle(
                                                    overflow: TextOverflow.ellipsis,
                                                    fontSize: 14.sp,
                                                    color: Color(0xff555555),
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Tajawal',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            DefaultButton(function: (){

                                            print('Go navigation Payment Methodde');
                                            },text: 'تبرع',),
                                          ],
                                        ),
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                            );
                        }
                        , itemCount: BlocProvider.of<DonorViewCubit>(context).shareModel!.shares!.length,),
                    ),


                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        ' ( الَّذِينَ يُنفِقُونَ فِي السَّرَّاءِ وَالضَّرَّاءِ وَالْكَاظِمِينَ الْغَيْظَ وَالْعَافِينَ عَنِ النَّاسِ ۗ وَاللَّهُ يُحِبُّ الْمُحْسِنِينَ )',
                        style: TextStyle(fontSize: 18.0.sp,fontFamily: 'Ottoman', color: Colors.black,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,

                      ),
                    ),

                  ],
                ),
              )
            );
          }


      ),
    );
  }
}



