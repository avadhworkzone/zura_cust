import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';

class TimingBottomSheet {

  String? restaurantTime;
  int? selectedOption;

  void showTimingData(BuildContext context) {

    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),

      context : context,
      builder : (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return SafeArea(
            child : SingleChildScrollView(
              child : Wrap(
                children : [

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        SizedBox(
                          height: 16.h,
                        ),

                        /// Timing
                        WileToneTextWidget(
                          title: VariablesUtils.timing,
                          fontSize: 18.sp,
                          fontFamily: AssetsUtils.poppins,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.black,
                        ),

                        SizedBox(
                          height: 15.h,
                        ),

                        /// All
                        Row(
                          children: [

                            WileToneTextWidget(
                              title: VariablesUtils.all,
                              fontSize: 18.sp,
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black,
                            ),

                            const Spacer(),

                            Radio(
                                activeColor: ColorUtils.green,
                                value: 1,
                                groupValue: selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    selectedOption = value;
                                  });
                                }),
                          ],
                        ),

                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 15.h),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: VariablesUtils.restaurantTime.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [

                                  WileToneTextWidget(
                                      title:  VariablesUtils.restaurantTime[index]),

                                  const Spacer(),

                                  Radio(
                                      activeColor: ColorUtils.green,
                                      toggleable: true,
                                      value: VariablesUtils.restaurantTime[index],
                                      groupValue: restaurantTime,
                                      visualDensity : VisualDensity(
                                          horizontal : 0.w,vertical : 0.h),
                                      onChanged: (value) {
                                        setState(() {
                                          print("Value :- $value");
                                        restaurantTime = value.toString();
                                        });
                                      })
                                ],
                              );
                            }),
                        // SizedBox(height: 10.h,),

                        ///Buttons
                        Row(
                          children: [
                            WileToneCustomButton(
                              buttonHeight:
                              MediaQuery.of(context).size.height / 14,
                              buttonWidth:
                              MediaQuery.of(context).size.width / 2.3,
                              buttonColor: ColorUtils.white,
                              onPressed: () {},
                              buttonName: VariablesUtils.clearAll,
                              fontColor: ColorUtils.green,
                            ),
                            WileToneCustomButton(
                              buttonHeight:
                              MediaQuery.of(context).size.height / 14,
                              buttonWidth:
                              MediaQuery.of(context).size.width / 2.2,
                              buttonColor: ColorUtils.green,
                              onPressed: () {},
                              buttonName: VariablesUtils.ApplyBtn,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },);
      },
    );
  }
}
