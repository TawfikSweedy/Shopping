import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Utilities/theme_helper.dart';

class TitleTextFiledWidget extends StatelessWidget {
  final String? title;
  final double?fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const TitleTextFiledWidget({super.key, this.title, this.fontSize, this.fontWeight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(title??'',style: TextStyle(
        fontSize:fontSize??14.sp ,
        fontWeight:fontWeight?? FontWeight.w500,
        color:color?? ThemeClass.color1E1E1E
    ),);
  }
}