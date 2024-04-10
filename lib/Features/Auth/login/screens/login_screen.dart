import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/sharde/app_assets.dart';

class Start extends StatelessWidget
{
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  bool password=true;
  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
        backgroundColor:Colors.white,
      body:
         Column(
           children: [
             Center( child: Image.asset(AppAssets.logo,height: 266,width: 213),)
               ,
             Center(
               child: Text('تسجيل الدخول',style: TextStyle(fontSize: 36,fontFamily: 'K2D',
                   color: Colors.black),),
             ),
             Padding(
               padding: const EdgeInsets.all(25),
               child: TextFormField(
                 cursorColor: Colors.black,
                 controller: email,
                 decoration: InputDecoration(
                   border:OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),
                   ),
                   labelText: 'البريد الالكتروني',
                   hintText: 'ادخل بريدك الالكتروني',
                   hintStyle: TextStyle(color: Color(0xff1D9DD3)),
                   labelStyle: TextStyle(color:Color(0xff1D9DD3)),
                   prefixIcon: const Icon(Icons.attach_email),
                     filled: true,
                     fillColor: Color(0xffE0F0FB)
                 ),
               ),
             ),
             /*                     */
             Padding(
               padding: const EdgeInsets.only(left:25,right: 25),
               child: TextFormField(
                   cursorColor: Colors.black,
                   controller: pass,
                   obscureText: password,
                   decoration: InputDecoration(
                     border:OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                     ),
                     labelText: 'كلمة السر',
                     hintText: 'ادخل الرقم السري الخاص بك',
                     hintStyle: TextStyle(color: Color(0xff1D9DD3)),
                     labelStyle: TextStyle(color:Color(0xff1D9DD3)),
                     prefixIcon: Icon(Icons.lock_rounded),
                     filled: true,
                     fillColor: Color(0xffE0F0FB),
                   )

               ),
             ),
             /*                     */
             Row(
                 mainAxisSize:MainAxisSize.min,
                 children:[
                 InkWell(
                  onTap: (){
                  print('Gamal');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('نسيت كلمة السر',style: TextStyle(color: Color(0xff4C4545),
                       fontSize: 20,)
                     ),
                  ),
                 ),
                 ]
             ),

             /*                     */
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   width: 353,
                   height: 66,
                   decoration: BoxDecoration(
                     color: Color(0xff529C9C),
                     borderRadius: BorderRadius.circular(10), // Adjust the radius as per your requirement
                   ),
                   child: InkWell(
                     onTap: (){
                       print('Gamal');
                       },
                       child: Center(
                         child: Text('تسجيل الدخول',style: TextStyle(
                           color: Color(0xffFFFFFF),
                               fontSize: 24,
                         )
                           ),
                       ),
                     ),
                 ),
               ],
             ),
             /*                        */

             Padding(
               padding: const EdgeInsets.all(12.0),
               child: MaterialButton(onPressed: ()
               {
               },
                 child:Row(
                     mainAxisSize:MainAxisSize.min,
                     children:[
                       Row(
                         children: [
                           Text('ليس لديك حساب ؟',style: TextStyle(color: Colors.black,
                               fontSize: 20,
                           )
                           ),
                           Text('إنشأ حساب جديد',style: TextStyle(color: Color(0xff5EB08D),
                             fontSize: 20,
                           )
                           ),
                         ],
                       ),
                     ]
                 ),),
             ),
             Center(
                   child:Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                       children:[
                         Text('أو استمر عبر ',style: TextStyle(color: Colors.grey,
                           fontSize: 20)
                         ),
                       ]
                   ),
             ),
             Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
                InkWell(
                onTap: (){
                print('Gamal');
                },
                  child: Text('الاستمرار كضيف',style: TextStyle(color: Colors.black,
                     fontSize: 20,
                   )
                   ),
                ),
                 ]
             ),
           ],
         ),

    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}