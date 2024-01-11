import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_image_widget.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_form_field.dart';
import 'package:wilatone_restaurant/utils/app_icon_assets.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';
import 'package:wilatone_restaurant/utils/validations_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';

class Bottomnavigationbar extends StatefulWidget{
  const Bottomnavigationbar({Key? key}) : super(key: key);

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar>{

  int _selectedIndex = 0;
  static const TextStyle optionStyle =  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<String> _imageAssets = [
    AppIconAssets.homeicon,
    AppIconAssets.rewardicon,
    AppIconAssets.searchoicon,
  ];

  Color _getIconColor(int index){
    return index == _selectedIndex ? ColorUtils.black : ColorUtils.lightGreyA6;
  }


  static  final List<Widget> _widgetOptions = <Widget>[

   Padding(
     padding: EdgeInsets.symmetric(horizontal: 20.w),
     child: Column(
       children: [

         SizedBox(
           height: 20.h,
         ),
         WileToneTextFormField(
           height: 52.h,
           borderSide: BorderSide.none,
           // fillcolor: ColorUtils.greyEC,
           borderRadius: 57.sp,
           hintText: VariablesUtils.searchstores,
           hintStyle: TextStyle(
               fontSize: 14.sp, color: ColorUtils.lightGreyA6),
           regularExpression: RegularExpression.alphabetSpacePattern,
         ),
       ],
     ),
   ),

    const Text(
      'Index 1: Rewards',
      style: optionStyle,
    ),

    const Text(
      'Index 2: Explore',
      style: optionStyle,
    ),

  ];

  void _onItemTapped(int index){
    setState((){
      print("Index :- $index");
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
      
        // appBar: AppBar(
        //   title: const Text('BottomNavigationBar Sample'),
        // ),
      
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      
        bottomNavigationBar : BottomNavigationBar(
          items : [
      
            BottomNavigationBarItem(
              icon : WileToneImageWidget(
                color: _getIconColor(0),
                image: _imageAssets[0],
                imageType: ImageType.png,
                height: 27.h,
                width: 24.w,
              ),
              label: 'Home',
            ),
      
            BottomNavigationBarItem(
              icon: WileToneImageWidget(
                color: _getIconColor(1),
                image: _imageAssets[1],
                imageType: ImageType.png,
                height: 27.h,
                width: 24.w,
              ),
              label: 'Rewards',
            ),
      
            BottomNavigationBarItem(
              icon: WileToneImageWidget(
                color: _getIconColor(2),
                image: _imageAssets[2],
                imageType: ImageType.png,
                height: 27.h,
                width: 24.w,
              ),
              label : 'Explore',
            ),
          ],
      
          currentIndex : _selectedIndex,
          selectedItemColor: ColorUtils.black,
          selectedFontSize: 12.sp,
          unselectedItemColor : ColorUtils.lightGreyA6,
          unselectedFontSize : 12.sp,
          selectedLabelStyle :  TextStyle(color: ColorUtils.black,fontSize: 12.sp),
          // unselectedLabelStyle : TextStyle(color: ColorUtils.black,fontSize: 12.sp),
          onTap : _onItemTapped,
      
        ),
      ),
    );
  }
}