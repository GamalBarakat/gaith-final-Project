import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaith/Features/drawer/zakat/zakat_cubit/zakat_cubit.dart';
import 'package:gaith/Features/drawer/zakat/zakat_cubit/zakat_state.dart';
import 'package:gaith/core/sharde/app_assets.dart';
import 'package:gaith/core/sharde/widget/default_button.dart';

import '../../../core/sharde/widget/text_forn_field.dart';

class ZakatScreen extends StatelessWidget {
  ZakatScreen({Key? key}) : super(key: key);
  var amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => ZakatViewCubit(),
        child: BlocBuilder<ZakatViewCubit, ZakatState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: 70.h,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final cubit = BlocProvider.of<ZakatViewCubit>(context);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              cubit.changSelectedIndex(index: index);
                            },
                            child: Container(
                              padding: EdgeInsets.all(3),
                              width: 70.w,
                              height: 60.h,
                              child: ClipRRect(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Colors.white,
                                  ),
                                  child: Image.asset(AppAssets.logo),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: (cubit.selectedIndex == index)
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (BlocProvider.of<ZakatViewCubit>(context).selectedIndex == 0)
                  ZakatAlMaal(),




               if (BlocProvider.of<ZakatViewCubit>(context).selectedIndex == 1||BlocProvider.of<ZakatViewCubit>(context).selectedIndex ==2)
                 ZakatOfGold()
              ],
            );
          },
        ),
      ),
    );
  }
}

class ZakatAlMaal extends StatelessWidget {
  ZakatAlMaal({super.key});

  var amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'المبلغ المراد حسابه',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            fontFamily: 'Tajawal',
          ),
        ),
        5.verticalSpace,
        CustomTextFormField(
          hintText: 'ادخل المبلغ',
          controller: amountController,
          textInputType: const TextInputType.numberWithOptions(signed: false),),

            20.verticalSpace,

        Column(
          children: [
            Text(
              'زكاتك المستحقه بالجنيه المصرى ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                fontFamily: 'Tajawal',
              ),
            ),
            Row(
              children: [

                Expanded(flex: 1,child: DefaultButton(text:'احسب الان ', function: (){
                  BlocProvider.of<ZakatViewCubit>(context).ClcZakatAlMaa(Amount: num.parse(amountController.text));
                })),
                Expanded(flex: 2,child: Text('${BlocProvider.of<ZakatViewCubit>(context).AmountZakat}')),
              ],
            )
          ],
        )


      ],
    );
  }
}

class ZakatOfGold extends StatelessWidget {
  ZakatOfGold({super.key});

  var numberOfGramController = TextEditingController();

  var amountGramController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'الوزن (بالجرم)',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            fontFamily: 'Tajawal',
          ),
        ),
        5.verticalSpace,
        CustomTextFormField(
          hintText: 'ادخل الوزن المراد حسابه',
          controller: numberOfGramController,
          textInputType: const TextInputType.numberWithOptions(signed: false),
        ),
        Text(
          'السعر/ جرام واحد (بالجنيه)',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            fontFamily: 'Tajawal',
          ),
        ),
        5.verticalSpace,
        CustomTextFormField(
          hintText: 'ادخل سعر الجرام الواحد',
          controller: amountGramController,
          textInputType: const TextInputType.numberWithOptions(signed: false),
        ),
20.verticalSpace,

        Column(
          children: [
            Text(
              'زكاتك المستحقه بالجنيه المصرى ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                fontFamily: 'Tajawal',
              ),
            ),
            Row(
              children: [

                Expanded(flex: 1,child: DefaultButton(text:'احسب الان ', function: (){
                  BlocProvider.of<ZakatViewCubit>(context).ClcZakatGoald(amountGram:num.parse(amountGramController.text) ,numberOfGram: num.parse(numberOfGramController.text));
                })),
                Expanded(flex: 2,child: Text('${BlocProvider.of<ZakatViewCubit>(context).AmountGoald}')),
              ],
            )
          ],
        )


      ],
    );
  }
}


