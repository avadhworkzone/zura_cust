import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/font_style_utils.dart';

import '../../utils/typedef_utils.dart';

class WileToneCustomButton extends StatelessWidget {
  final OnTap? onPressed;
  final EdgeInsetsGeometry padding;
  final String buttonName;
  final double? fontSize;
  final Color fontColor;
  final double? buttonRadius;
  final Color buttonColor;
  final double? buttonHeight;
  final double buttonWidth;
  final double? elevation;
  final bool isBorderShape;
  final FontWeight? fontWeight;
  final Widget? icon;

  const WileToneCustomButton(
      {Key? key,
      required this.onPressed,
      this.padding = EdgeInsets.zero,
      required this.buttonName,
      this.fontSize,
      this.fontColor = ColorUtils.white,
      this.buttonRadius,
      this.buttonColor = ColorUtils.black,
      this.buttonHeight,
      this.buttonWidth = double.infinity,
      this.elevation,
      this.fontWeight,
      this.icon,
      this.isBorderShape = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all(Size(buttonWidth, buttonHeight ?? 52)),
          shape: isBorderShape
              ? MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius ?? 8),
                    side: BorderSide(color: buttonColor),
                  ),
                )
              : MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius ?? 8),
                  ),
                ),
          elevation:
              elevation == null ? null : MaterialStateProperty.all(elevation),
          backgroundColor: MaterialStateProperty.all(
              isBorderShape ? ColorUtils.white : buttonColor),
        ),
        child: Row(
          mainAxisSize: icon != null ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment:
              icon != null ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            WileToneTextWidget(
              title: buttonName,
              fontSize: fontSize,
              color: isBorderShape ? buttonColor : fontColor,
              fontWeight: fontWeight ?? FontWeightClass.semiB,
            ),
          ],
        ),
      ),
    );
  }
}
