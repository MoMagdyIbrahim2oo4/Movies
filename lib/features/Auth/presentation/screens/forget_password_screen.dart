import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/constants/app_icons.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'package:movies/core/widgets/custom_text_form_field.dart';
import 'package:movies/features/Auth/manager/auth_provider.dart';
import 'package:movies/features/Auth/widgets/circular_loading.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>() ;
  
  final TextEditingController emailController = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of( context , listen: true ) ;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_sharp ,
          ),
        ),
        title: Text( "forget_password".tr() ,
          style: GoogleFonts.roboto(
            fontSize: 16.sp ,
            fontWeight: .w400
          ),
        )  ,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric( horizontal: 16 ) ,
              child: Form(
                key: formKey ,
                child: Column(
                  crossAxisAlignment: .stretch ,
                  spacing: 24.h ,
                  children: [
                    Image( 
                      image: AssetImage(AppImages.forgetPassword) ,
                      width: 332.1.w ,
                      height: 251.89.h ,
                    ) ,
                    CustomTextFormField( hintText: "email".tr() ,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only( left: 20.w , right: 8 ),
                        child: SvgPicture.asset(AppIcons.emailIcon),
                      ) , 
                      controller: emailController ,
                      validator: (value){
                        final RegExp emailRegex = RegExp( r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' );
                        if ( value == null || value.isEmpty ) {
                          return "empty_email_hint".tr() ;
                        }
                        else if ( ! emailRegex.hasMatch(value.trim()) ) {
                          return "invalid_email_hint".tr() ;
                        }
                        else {
                          return null ;
                        }
                      },
                    ) , 
                    CustomElevatedButton(
                      onpressed: authProvider.isLoading
                          ? null
                          : (){
                              if ( formKey.currentState!.validate() ) {
                                authProvider.forgetPassword( context: context , email: emailController.text ) ;
                              }
                            } , 
                      child: Text( "verify_email".tr() , 
                        style: GoogleFonts.roboto(
                          fontSize: 20.sp , 
                          fontWeight: .w400 ,
                        ) ,
                      ),
                    ) ,
                  ],
                ),
              ),
            ),
            if (authProvider.isLoading)
              CircularLoading(),
          ],
        ),
      ),
    );
  }
}
