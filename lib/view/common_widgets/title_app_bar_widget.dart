import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stock/controller/constants/constant.dart';
import 'package:stock/view/common_widgets/text_view_large.dart';



class TitleAppBarWidget extends HookWidget implements PreferredSizeWidget {
  String? title;

   TitleAppBarWidget({required this.title});
  
  @override
  Size get preferredSize => Size.fromHeight(50.0); 

  @override
  Widget build(BuildContext context) {
    
        return AppBar(
          
           backgroundColor: appBackColor,
         title: TextViewLarge(title: title,textcolor: appColor,fontWeight: FontWeight.bold,),
          );
         
   
  }}

