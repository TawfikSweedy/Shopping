

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utilities/theme_helper.dart';

class ButtonWidget extends StatelessWidget {
  final String? title;
  final double? width,height,borderRadius,fontSize,titleHeight,borderSize;
  final Color? backGroundColor,titleColor,borderColor;
  final FontWeight? fontWeight;
  final Widget? customTitle;
  final Function() onTap;
  const ButtonWidget({Key? key, this.title, this.width, this.height,required this.onTap, this.backGroundColor, this.titleColor,this.customTitle ,this.borderRadius, this.fontSize, this.fontWeight, this.borderColor, this.titleHeight, this.borderSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onTap,
      child: Container(
        width: width??343.w,
        height:height??43.h ,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backGroundColor??ThemeClass.primaryColor,
            borderRadius: BorderRadius.circular(borderRadius??10.r),
            border: Border.all(width:borderSize?? 1.w,color:borderColor??ThemeClass.primaryColor )
        ),
        child:customTitle?? Text(title??'',style: TextStyle(
            fontSize: fontSize??16.sp,
            fontWeight:fontWeight?? FontWeight.w500,
            color:titleColor?? ThemeClass.whiteColor,
            height: titleHeight
        ),),
      ),
    );
  }
}