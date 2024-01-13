import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_form_field.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/validations_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/auth/enable_location_screen.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {

  Rx<TextEditingController> namecontroller = TextEditingController().obs;
  Rx<TextEditingController> emailcontroller = TextEditingController().obs;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WileToneAppBar(title: ""),
            SizedBox(
              height: 20.h,
            ),
            WileToneTextWidget(
              title: VariablesUtils.helpUsToLetYouKnow,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),

            SizedBox(
              height: 20.h,
            ),

            WileToneTextFormField(
              borderRadius: 10.sp,

              controller: namecontroller.value,
              borderSide: const BorderSide(color: ColorUtils.lightGreyD3),
              hintText: VariablesUtils.name,
              regularExpression: RegularExpression.alphabetSpacePattern,
              hintStyle: TextStyle(color: ColorUtils.lightGreyA6,fontSize: 14.sp,fontWeight: FontWeight.w500),
            ),

            SizedBox(
              height: 20.h,
            ),

            WileToneTextFormField(
              borderRadius: 10.sp,
              controller: emailcontroller.value,
              borderSide: const BorderSide(color: ColorUtils.lightGreyD3),
              hintText: VariablesUtils.email,
              regularExpression: RegularExpression.digitsPattern,
              textInputType: TextInputType.emailAddress,
              hintStyle: TextStyle(color: ColorUtils.lightGreyA6,fontSize: 14.sp,fontWeight: FontWeight.w500),

            ),

            SizedBox(
              height: 30.h,
            ),

            WileToneCustomButton(
              onPressed: () {
                Get.to(() => const LocationScreen());
              },
              buttonHeight: 52,
              buttonColor: ColorUtils.greenColor,
              buttonName: VariablesUtils.continueText,
            ),
          ],
        ),
      )),
    );
  }
}
