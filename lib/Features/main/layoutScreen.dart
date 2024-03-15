



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home/feature/manager/home_cubite.dart';
import 'home/feature/manager/home_view__state.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeViewCubit(),
      child: BlocConsumer<HomeViewCubit, HomeViewState>(
        listener: (context, state) {},
        builder: (context, state) {
          return
            Scaffold(
                backgroundColor:Color(0xffF7F7F9),
                appBar: AppBar(
                backgroundColor:Colors.white,
                  elevation: 0.0,
                  title: Text('${BlocProvider
                      .of<HomeViewCubit>(context).titeleappbar[BlocProvider
                      .of<HomeViewCubit>(context).CurrentIndex]}',style:
                  TextStyle(
                    color: Colors.black,

                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                    fontFamily: 'Cairo',


                  ),),


                 ),


                bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.grey,
                  selectedLabelStyle: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Cairo',
                  ), // نمط النص عند عدم تحديده

                  type: BottomNavigationBarType.fixed,
                  currentIndex: BlocProvider.of<HomeViewCubit>(context).CurrentIndex,
                  onTap: (index) {
                    BlocProvider.of<HomeViewCubit>(context).Changecurrentindex(index);
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'متبرع',


                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.category),
                      label: 'محتاج تبرع',
                    ),

                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart),
                      label: 'تبرع سريع',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'متطوع',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'محفظه',
                    ),
                  ],
                ),
                body: BlocProvider
                    .of<HomeViewCubit>(context)
                    .Scrreen[BlocProvider
                    .of<HomeViewCubit>(context)
                    .CurrentIndex]


            );
        },
      ),);
  }
}








// bottomNavigationBar: BottomNavigationBar(
// backgroundColor: Colors.green,
// unselectedItemColor: Colors.deepPurple,
// selectedItemColor: Colors.red,
// currentIndex: BlocProvider
//     .of<HomeViewCubit>(context)
// .CurrentIndex,
// onTap: (index) {
// BlocProvider.of<HomeViewCubit>(context).Changecurrentindex(
// index);
// },
// items: const [
// BottomNavigationBarItem(
// icon: Icon(Icons.home), label: 'Home'),
// BottomNavigationBarItem(
// icon: Icon(Icons.category), label: 'category'),
// BottomNavigationBarItem(
// icon: Icon(Icons.favorite), label: 'favorite'),
// BottomNavigationBarItem(
// icon: Icon(Icons.settings), label: 'setting'),
//
//
// ],
// ),
