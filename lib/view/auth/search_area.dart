import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_image_widget.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_form_field.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/app_icon_assets.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';
import 'package:wilatone_restaurant/utils/validations_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';


class SearchArea extends StatefulWidget{
  const SearchArea({Key? key}) : super(key: key);

  @override
  State<SearchArea> createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea>{

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              SizedBox(
                height: 20.h,
              ),
              const WileToneAppBar(title: ''),
              SizedBox(
                height: 24.h,
              ),
              WileToneTextWidget(
                title: VariablesUtils.enterarea,
                fontSize: 20.sp,
                fontFamily: AssetsUtils.poppins,
                fontWeight: FontWeight.w600,
                color: ColorUtils.black,
              ),

              SizedBox(
                height: 20.h,
              ),

              WileToneTextFormField(
                filled: true,
                height: 52.h,
                borderSide: BorderSide.none,
                fillcolor: ColorUtils.greyEC,
                borderRadius: 12.sp,
                hintText: VariablesUtils.areaname,
                hintStyle: TextStyle(
                    fontSize: 14.sp, color: ColorUtils.lightGreyA6),
                regularExpression: RegularExpression.alphabetSpacePattern,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: WileToneTextWidget(
                  title: VariablesUtils.currentlocation,
                  fontSize: 12.sp,
                  fontFamily: AssetsUtils.poppins,
                  fontWeight: FontWeight.w500,
                  color: ColorUtils.greenColor,
                ),
              ),

              SizedBox(
                height: 20.h,
              ),

              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 12,
                  itemBuilder: (context, index){
                    return ListTile(

                      leading: WileToneImageWidget(

                        color: ColorUtils.grey5B,
                        image: AppIconAssets.arealocation,
                        imageType: ImageType.png,
                        height: 13.44.h,
                        width: 12.w,
                        // scale: 1,
                      ),

                      title: WileToneTextWidget(
                        title: VariablesUtils.title,
                        fontSize: 13.sp,
                        fontFamily: AssetsUtils.poppins,
                        fontWeight: FontWeight.w500,
                        color: ColorUtils.grey5B,
                      ),

                      subtitle: WileToneTextWidget(
                      title: VariablesUtils.subtitle,
                      fontSize: 11.sp,
                      fontFamily: AssetsUtils.poppins,
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.lightGreyA6,
                    ),);
                  },),
              )


            ],
          ),
        ),
      ),
    );
  }
}