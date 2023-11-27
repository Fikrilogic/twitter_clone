import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class UserModel extends Equatable {
  final String email;
  final String name;
  final String profilePic;
  final String bannerPic;
  final String uid;
  final String bio;
  final bool isTwitterBlue;
  final List<String> followers;
  final List<String> following;

//<editor-fold desc="Data Methods">
  const UserModel({
    required this.email,
    required this.name,
    required this.profilePic,
    required this.bannerPic,
    required this.uid,
    required this.bio,
    required this.isTwitterBlue,
    required this.followers,
    required this.following,
  });

  @override
  String toString() {
    return 'UserModel{' +
        ' email: $email,' +
        ' name: $name,' +
        ' profilePic: $profilePic,' +
        ' bannerPic: $bannerPic,' +
        ' uid: $uid,' +
        ' bio: $bio,' +
        ' isTwitterBlue: $isTwitterBlue,' +
        ' followers: $followers,' +
        ' following: $following,' +
        '}';
  }

  UserModel copyWith({
    String? email,
    String? name,
    String? profilePic,
    String? bannerPic,
    String? uid,
    String? bio,
    bool? isTwitterBlue,
    List<String>? followers,
    List<String>? following,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      bannerPic: bannerPic ?? this.bannerPic,
      uid: uid ?? this.uid,
      bio: bio ?? this.bio,
      isTwitterBlue: isTwitterBlue ?? this.isTwitterBlue,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'name': this.name,
      'profilePic': this.profilePic,
      'bannerPic': this.bannerPic,
      'bio': this.bio,
      'isTwitterBlue': this.isTwitterBlue,
      'followers': this.followers,
      'following': this.following,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      profilePic: map['profilePic'] ?? '',
      bannerPic: map['bannerPic'] ?? '',
      uid: map['\$id'] ?? '',
      bio: map['bio'] ?? '',
      isTwitterBlue: map['isTwitterBlue'] ?? false,
      followers: List<String>.from(map['followers']),
      following: List<String>.from(map['following']),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        email,
        name,
        profilePic,
        bannerPic,
        uid,
        bio,
        isTwitterBlue,
        followers,
        following
      ];

//</editor-fold>
}
