



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/core/sharde/app_assets.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../core/sharde/widget/navigation.dart';
import '../drawer/zakat/zakat_screen.dart';
import 'home/feature/manager/home_cubite.dart';
import 'home/feature/manager/home_view__state.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeViewCubit()..getProfile(),
      child: BlocConsumer<HomeViewCubit, HomeViewState>(
        listener: (context, state) {},
        builder: (context, state) {
          return
            Scaffold(

              drawer:
              BlocProvider.of<HomeViewCubit>(context).profileModel==null?
              Container():Drawer(
                backgroundColor: Colors.white,

                child: ListView(

                  children: [

                       Container(
                         padding: EdgeInsets.symmetric(horizontal: 20),
                         color: Colors.white,
                         height: MediaQuery.of(context).size.height *.25,
                         child: Row(

                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(AppAssets.food),
                            ),
                           20.horizontalSpace,

                            Column(
              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${BlocProvider.of<HomeViewCubit>(context).profileModel!.user!.name}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                    ),
                                  ),

                                Text(
                                  '${BlocProvider.of<HomeViewCubit>(context).profileModel!.user!.phone}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),


                          ],
                                                 ),
                       ),


                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('الصفحة الرئيسية'),
                      onTap: () {
                        // اختر الإجراء الذي تريده لهذا الخيار
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('الإعدادات'),
                      onTap: () {
                        // اختر الإجراء الذي تريده لهذا الخيار
                        navigato(context, ZakatScreen());
                      },
                    ),
                    // يمكنك إضافة المزيد من الخيارات هنا
                  ],
                ),
              ),





                bottomNavigationBar: SalomonBottomBar(
                  curve: Curves.easeOutQuint,
                  currentIndex: BlocProvider.of<HomeViewCubit>(context).CurrentIndex,
                  onTap: (index) {
                    BlocProvider.of<HomeViewCubit>(context).Changecurrentindex(index);
                  },
                  items: [
                    SalomonBottomBarItem(
                      icon: Icon(Icons.home),

                      title: const Text("الصفحه الرئسيه"),
                      selectedColor: Colors.green,
                      unselectedColor: Colors.green
                    ),


                    SalomonBottomBarItem(
                      icon: Icon(Icons.favorite_border),
                      title: Text("المحتاجين"),
                      selectedColor: Colors.pink,
                    ),


                    SalomonBottomBarItem(
                      icon: Icon(Icons.search),
                      title: Text("التطوع"),
                      selectedColor: Colors.orange,
                    ),


                    SalomonBottomBarItem(
                      icon: Icon(Icons.person),
                      title: Text("التطوع"),
                      selectedColor: Colors.teal,
                    ),
                  ],


                ),

                body: SafeArea(
                  child: Stack(
                    children: [
                      BlocProvider
                          .of<HomeViewCubit>(context)
                          .Scrreen[BlocProvider
                          .of<HomeViewCubit>(context)
                          .CurrentIndex],

                    ],
                   
                  ),
                )


            );
        },
      ),);
  }
}









