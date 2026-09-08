import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_colors.dart';

class Toast {
  static void showToast ({ required String title , required BuildContext context , Color color = AppColors.red }){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title) ,
        behavior: .floating ,
        backgroundColor: color ,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16) ,
          borderSide: BorderSide( color: color , )
        ),
      ),
    );
  }
}