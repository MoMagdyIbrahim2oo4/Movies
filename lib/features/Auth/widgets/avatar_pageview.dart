import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/constants/app_avatars.dart';

class AvatarPageview extends StatefulWidget {
  const AvatarPageview({super.key});

  @override
  State<AvatarPageview> createState() => _AvatarPageviewState();
}

class _AvatarPageviewState extends State<AvatarPageview> {

    final PageController _pageController = PageController( viewportFraction: 0.35 , initialPage: 1 ) ;
    int currentAvatar = 1 ; // initially 
    final List<String> avatars = [ 
    AppAvatars.avatar1 ,
    AppAvatars.avatar2 ,
    AppAvatars.avatar3 ,
    AppAvatars.avatar4 ,
    AppAvatars.avatar5 ,
    AppAvatars.avatar6 ,
    AppAvatars.avatar7 ,
    AppAvatars.avatar8 ,
    AppAvatars.avatar9 ,
  ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController ,
      onPageChanged: (index) {
        setState(() {
          currentAvatar = index ;
        });
      },
      itemCount: avatars.length ,
      itemBuilder: (context , index ) {
        bool isSelected = index == currentAvatar ;
        return AnimatedContainer(
          duration: Duration(milliseconds: 200) ,
          margin: .all( isSelected ? 0 : 25.r ), 
          width:  394.w ,
          height: 161.h ,
          child: FittedBox(
            fit: .contain ,
            child: Image.asset(avatars[index]) ,
          ) ,
        ) ;
      }
    );
  }
}