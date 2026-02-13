import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class TextViewLarge extends StatelessWidget {
  final String? title;
  final FontWeight? fontWeight;
  Color? textcolor;
  double? fontSize;

  TextViewLarge(
      {Key? key, required this.title, this.fontWeight, this.textcolor,this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
          title ?? "",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: fontWeight,color: textcolor ?? Colors.white,fontSize: fontSize??18.sp),
          );
  }
}
