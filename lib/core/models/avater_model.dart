import 'package:movies/core/constants/app_avatars.dart';

class AvatarModel {
  String avatarId;
  String avatarPath;
  AvatarModel({required this.avatarId,required this.avatarPath});
  static List<AvatarModel>getAvatars(){
    return [
      AvatarModel(avatarId: 'avatar1', avatarPath: AppAvatars.avatar1),
      AvatarModel(avatarId: 'avatar2', avatarPath: AppAvatars.avatar2),
      AvatarModel(avatarId: 'avatar3', avatarPath: AppAvatars.avatar3),
      AvatarModel(avatarId: 'avatar4', avatarPath: AppAvatars.avatar4),
      AvatarModel(avatarId: 'avatar5', avatarPath: AppAvatars.avatar5),
      AvatarModel(avatarId: 'avatar6', avatarPath: AppAvatars.avatar6),
      AvatarModel(avatarId: 'avatar7', avatarPath: AppAvatars.avatar7),
      AvatarModel(avatarId: 'avatar8', avatarPath: AppAvatars.avatar8),
      AvatarModel(avatarId: 'avatar9', avatarPath: AppAvatars.avatar9),
    ];
  }
}