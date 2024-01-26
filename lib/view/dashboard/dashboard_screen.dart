import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_image_widget.dart';
import 'package:wilatone_restaurant/utils/app_icon_assets.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';
import 'package:wilatone_restaurant/view/Home/home_screen.dart';
import 'package:wilatone_restaurant/view/dashboard/explore_screen.dart';
import 'package:wilatone_restaurant/view/dashboard/reward_screen.dart';


class DashBoardScreen extends StatefulWidget{
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static Rx<TextEditingController> searchstores = TextEditingController().obs;

  final List<String> _imageAssets = [
    AppIconAssets.homeicon,
    AppIconAssets.rewardicon,
    AppIconAssets.searchoicon,
  ];

  static List imagename = [
    'Restaurant',
    'Cafe',
    'Sweet Shop',
    'Salon',
    'Stationery',
    'Pharmacy',
    'Fitness',
    'Fashion',
  ];

  static int currentIndex = 0;

  Color _getIconColor(int index) {
    return index == _selectedIndex ? ColorUtils.black : ColorUtils.lightGreyA6;
  }




  void _onItemTapped(int index){

    if(index==1){
      Get.to(()=>const RewardScreen());
    }
    else if(index==2){
      Get.to(()=>const ExploreScreen());
    }
    else{
      setState(() {
        log("_selectedIndex :- $_selectedIndex");
        _selectedIndex = index;
      });
    }

  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){

     final List<Widget> widgetOptions = <Widget>[

      /// Home Screen
      const HomeScreen(),

      /// Reward screen

      const RewardScreen(),

      const ExploreScreen(),
    ];


    return SafeArea(
      child : Scaffold(
        body : widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar : BottomNavigationBar(

          items : [

            BottomNavigationBarItem(
              icon: WileToneImageWidget(
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
              label: 'Explore',
            ),

          ],

          currentIndex: _selectedIndex,
          selectedItemColor: ColorUtils.black,
          selectedFontSize: 12.sp,
          unselectedItemColor: ColorUtils.lightGreyA6,
          unselectedFontSize: 12.sp,
          selectedLabelStyle:
          TextStyle(color: ColorUtils.black, fontSize: 12.sp),
          // unselectedLabelStyle : TextStyle(color: ColorUtils.black,fontSize: 12.sp),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}