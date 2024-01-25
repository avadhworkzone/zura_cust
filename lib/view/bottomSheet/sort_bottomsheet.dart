import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';

class Sortbottomsheet{

  int? selectedOption;

  void  showSortData(BuildContext context){

    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 16.h,
                    ),
                    WileToneTextWidget(
                      title: VariablesUtils.sorttext,
                      fontSize: 18.sp,
                      fontFamily: AssetsUtils.poppins,
                      fontWeight: FontWeight.w600,
                      color: ColorUtils.black,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      children: [
                        WileToneTextWidget(
                          title: VariablesUtils.relevance,
                          fontSize: 14.sp,
                          fontFamily: AssetsUtils.poppins,
                          fontWeight: FontWeight.w500,
                          // color: ColorUtils.black,
                        ),
                        const Spacer(),
                        Radio(
                            activeColor: ColorUtils.green,
                            value: 2,
                            groupValue: selectedOption,
                            onChanged: (value) {
                              selectedOption = value;
                              // setState(() {
                              // });
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        WileToneTextWidget(
                          title: VariablesUtils.lowToHigh,
                          fontSize: 14.sp,
                          fontFamily: AssetsUtils.poppins,
                          fontWeight: FontWeight.w500,
                          // color: ColorUtils.black,
                        ),
                        const Spacer(),
                        Radio(
                            activeColor: ColorUtils.green,
                            value: 2,
                            groupValue: selectedOption,
                            onChanged: (value) {
                              // setState(() {
                                selectedOption = value;
                              // });
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        WileToneTextWidget(
                          title: VariablesUtils.highToLow,
                          fontSize: 14.sp,
                          fontFamily: AssetsUtils.poppins,
                          fontWeight: FontWeight.w500,
                          // color: ColorUtils.black,
                        ),
                        const Spacer(),
                        Radio(
                            activeColor: ColorUtils.green,
                            value: 2,
                            groupValue: selectedOption,
                            onChanged: (value) {
                              selectedOption = value;
                              // setState(() {
                              // });
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    /// buttons
                    Row(
                      children: [
                        WileToneCustomButton(
                          buttonHeight: MediaQuery.of(context).size.height / 14,
                          buttonWidth: MediaQuery.of(context).size.width / 2.3,
                          buttonColor: ColorUtils.white,
                          onPressed: () {},
                          buttonName: VariablesUtils.clearAll,
                          fontColor: ColorUtils.green,
                        ),
                        WileToneCustomButton(
                          buttonHeight:MediaQuery.of(context).size.height / 14,
                          buttonWidth: MediaQuery.of(context).size.width / 2.2,
                          buttonColor: ColorUtils.green,
                          onPressed: () {},
                          buttonName: VariablesUtils.ApplyBtn,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }


}
