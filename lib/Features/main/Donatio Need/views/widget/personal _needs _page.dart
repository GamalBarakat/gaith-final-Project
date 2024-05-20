import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/core/sharde/widget/navigation.dart';

import '../../../../../core/sharde/app_assets.dart';
import '../../../../../core/sharde/widget/default_button.dart';
import '../../../../../core/sharde/widget/text_forn_field.dart';
import '../../../layoutScreen.dart';
import '../../manager/donation_need_cubit.dart';
import '../../manager/donation_need_state.dart';

class PersonalNeedsPage extends StatelessWidget {
   PersonalNeedsPage({super.key});
   var descriptionController=TextEditingController();
   var keyForm = GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:const Color(0xffF4F6FE),
      appBar:AppBar() ,
      body:

      BlocProvider(
        create: (context) => DonationNeedViewCubit(),
        child: BlocConsumer<DonationNeedViewCubit,DonationNeedViewState>(
          listener: (context,state)
          {
            if(state is RequestADonationForMeStateSuccess )
              {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        dialogBackgroundColor: Colors.white,
                      ),
                      child: AlertDialog(
                        backgroundColor: Colors.white,

                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(AppAssets.success, height: 100, width: 100), // إضافة صورة
                            Text('تم تسجيل طلبك بنجاح '),
                            Text('سيتم مراجعه طلبك والتواصل معك فى اقرب وقت ممكن '),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                           navigatofinsh(context, LayoutScreen(), false);
                            },
                            child: Text('العوده الى الصفحه الرئسيه'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
          },
          builder: (context,  state) {

            return   Form(
              key:keyForm ,
              child: Column(
                children: [


       100.verticalSpace,
                  CustomTextFormField(hintText: 'نبذه عن احتياجك للتبرع ',
                    controller:descriptionController,
                    validator:(value) {
                      if (value!.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      } else {
                        return null;
                      }
                    },
                    textInputType: TextInputType.text,),
5.verticalSpace,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(onTap:(){

                        BlocProvider.of<DonationNeedViewCubit>(context).getProfileImageByCamera();
                      } ,child: Icon(Icons.camera_alt,color: Color(0xff529C9C),)),
                      InkWell(onTap:(){

                        BlocProvider.of<DonationNeedViewCubit>(context).getProfileImageByGallery();



                      } ,child: Image.asset(AppAssets.Attachphoto)),


                    ],
                  ),

                  if(BlocProvider.of<DonationNeedViewCubit>(context).donationPhoto!=null)
                    SizedBox(width: 200,height:200,child: InkWell(onTap: (){

                      print(BlocProvider.of<DonationNeedViewCubit>(context).donationPhoto!);
                    },child: Image.file(BlocProvider.of<DonationNeedViewCubit>(context).donationPhoto!,width: MediaQuery.of(context).size.width,))),

                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ConditionalBuilder(
                      condition:state is !RequestADonationForMeStateLoading,

                      builder: (context) =>DefaultButton(text: 'تأكيد',function: (){
                        if (keyForm.currentState!.validate()&&BlocProvider.of<DonationNeedViewCubit>(context).donationPhoto!=null) {




                          BlocProvider.of<DonationNeedViewCubit>(context).requestADonationForMe(

                            categoryId:'3' ,
                            description:descriptionController.text ,
                            details:descriptionController.text,
                          //  imageUrl:BlocProvider.of<DonationNeedViewCubit>(context).donationPhoto!.path  ,
                            price: '0',  );
                        }

                      },),
                      fallback:(context) => const Center(child: CircularProgressIndicator(
                        strokeWidth: 5.0,
                        backgroundColor: Colors.black,
                        color: Colors.blue,

                        semanticsLabel: 'Linear progress indicator',

                      ) ,

                      ),
                    ),

                  ),
                ],
              ),
            );
          },


        ),
      ),
    );
  }
}