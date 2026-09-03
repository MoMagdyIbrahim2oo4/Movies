import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/models/avater_model.dart';
import 'package:movies/features/updateProfile/presentation/widget/avatar_holder.dart';

Future<dynamic> showAvatarsSheet(BuildContext context,void Function(AvatarModel)onAvatarClicked,List<AvatarModel>avatars,AvatarModel currentAvatar) {


  return showModalBottomSheet(
    context: context,
    backgroundColor: Theme.of(context).colorScheme.onSurface,
    isDismissible: true,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16.r),
            margin: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(24.r)
            ),
            child: GridView.builder(
              itemCount: avatars.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.h,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 1
              ),
              itemBuilder: (context, index) {
                final itemAvatar = avatars[index];
                final bool isSelected = currentAvatar.avatarPath == itemAvatar.avatarPath;
                return InkWell(
                  onTap: (){
                    onAvatarClicked(avatars[index]);
                    Navigator.pop(context);
                  },
                    child: AvatarHolder(avatar: avatars[index].avatarPath,isSelected: isSelected,));
              },
            ),
          )
        ],
      );
    },
  );
}

