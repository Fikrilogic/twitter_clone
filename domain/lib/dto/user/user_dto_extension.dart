import 'package:data/model/user/user_model.dart';
import 'package:domain/dto/user/user_dto.dart';

extension ConvertUserDto on UserDto {
  UserModel toUserModel() {
    return UserModel(
        email: this.email,
        name: this.name,
        profilePic: this.profilePic,
        bannerPic: this.bannerPic,
        uid: this.uid,
        bio: this.bio,
        isTwitterBlue: this.isTwitterBlue,
        followers: this.followers,
        following: this.following);
  }
}

extension ConvertUserModel on UserModel {
  UserDto toUserDto() {
    return UserDto(
        email: this.email,
        password: '',
        name: this.name,
        profilePic: this.profilePic,
        bannerPic: this.bannerPic,
        uid: this.uid,
        bio: this.bio,
        isTwitterBlue: this.isTwitterBlue,
        followers: this.followers,
        following: this.following);
  }
}