import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/sharde/app_assets.dart';
import '../../../../../core/sharde/widget/default_button.dart';
import '../../../../../core/sharde/widget/navigation.dart';
import '../../../../../core/sharde/widget/text_forn_field.dart';
import '../../../layoutScreen.dart';
import '../../manager/donation_need_cubit.dart';
import '../../manager/donation_need_state.dart';

class ReportNeedPage extends StatelessWidget {
   ReportNeedPage({super.key});

   var statusNameController=TextEditingController();

   var statusPhoneController=TextEditingController();
  var statusAddressController=TextEditingController();
  var statusDescriptionController=TextEditingController();
   var keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),onPressed: (){
          navigapop(context);
        },)
        ,

        title:  Text('تبليغ عن حد محتاج تبرع',style:GoogleFonts.cairo(textStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w700)),),
        centerTitle: true,),
      body: Form(
        key: keyForm,
        child:

    BlocProvider(
    create: (context) => DonationNeedViewCubit(),

          child: BlocConsumer<DonationNeedViewCubit,DonationNeedViewState>(
            listener: ( context,  state) {

              if(state is RequestADonationToAnotherPersonStateSuccess )
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
            builder: ( context, state) {

              return SingleChildScrollView(
                child: Column(
                  children: [
                
                    CustomTextFormField(hintText: 'إسم الحاله المحتاجه التبرع',
                      controller:statusNameController,
                      validator:(value) {
                        if (value!.isEmpty) {
                          return 'حقل الاسم مطلوب';
                        } else {
                          return null;
                        }
                      },
                      textInputType: TextInputType.name,),
                
                    CustomTextFormField(hintText: 'رقم موبيل صاحب الحاله',
                      controller:statusPhoneController,
                      validator:(value) {
                        if (value!.isEmpty) {
                          return 'حقل الاسم مطلوب';
                        } else {
                          return null;
                        }
                      },
                      textInputType: TextInputType.phone,),
                    CustomTextFormField(hintText: 'عنوان الحاله ',
                      controller:statusAddressController,
                      validator:(value) {
                        if (value!.isEmpty) {
                          return 'حقل الاسم مطلوب';
                        } else {
                          return null;
                        }
                      },
                      textInputType: TextInputType.text,),
                    CustomTextFormField(hintText: 'شرح الحاله  ',
                      controller:statusDescriptionController,
                      validator:(value) {
                        if (value!.isEmpty) {
                          return 'حقل الاسم مطلوب';
                        } else {
                          return null;
                        }
                      },
                      textInputType: TextInputType.text,),
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
                      SizedBox(width:10,height:10,child: Image.file(BlocProvider.of<DonationNeedViewCubit>(context).donationPhoto!,width: MediaQuery.of(context).size.width,)),
                
                    SizedBox(height: 20.h),
                
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ConditionalBuilder(
                        condition:state is !RequestADonationToAnotherPersonStateLoading,
                
                        builder: (context) =>DefaultButton(text: 'تأكيد',function: (){
                          if (keyForm.currentState!.validate()) {
                
                
                            BlocProvider.of<DonationNeedViewCubit>(context).requestADonationToAnotherPerson(
                              phone:statusPhoneController.text ,
                              name: statusNameController.text,
                              address: statusAddressController.text,
                
                              categoryId:'3' ,
                              description:statusDescriptionController.text ,
                              details:statusDescriptionController.text,
                              imageUrl:BlocProvider.of<DonationNeedViewCubit>(context).donationPhoto!.path ,
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
      ),
    );
  }
}
