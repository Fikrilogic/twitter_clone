import 'package:data/data.dart';

class UserDto {
  final String email;
  final String password;
  final String name;
  final String profilePic;
  final String bannerPic;
  final String uid;
  final String bio;
  final bool isTwitterBlue;
  final List<String> followers;
  final List<String> following;

//<editor-fold desc="Data Methods">
  const UserDto({
    required this.email,
    required this.password,
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDto &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          password == other.password &&
          name == other.name &&
          profilePic == other.profilePic &&
          bannerPic == other.bannerPic &&
          uid == other.uid &&
          bio == other.bio &&
          isTwitterBlue == other.isTwitterBlue &&
          followers == other.followers &&
          following == other.following);

  @override
  int get hashCode =>
      email.hashCode ^
      password.hashCode ^
      name.hashCode ^
      profilePic.hashCode ^
      bannerPic.hashCode ^
      uid.hashCode ^
      bio.hashCode ^
      isTwitterBlue.hashCode ^
      followers.hashCode ^
      following.hashCode;

  @override
  String toString() {
    return 'UserDto{' +
        ' email: $email,' +
        ' password: $password,' +
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

  UserDto copyWith({
    String? email,
    String? password,
    String? name,
    String? profilePic,
    String? bannerPic,
    String? uid,
    String? bio,
    bool? isTwitterBlue,
    List<String>? followers,
    List<String>? following,
  }) {
    return UserDto(
      email: email ?? this.email,
      password: password ?? this.password,
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
      'password': this.password,
      'name': this.name,
      'profilePic': this.profilePic,
      'bannerPic': this.bannerPic,
      'uid': this.uid,
      'bio': this.bio,
      'isTwitterBlue': this.isTwitterBlue,
      'followers': this.followers,
      'following': this.following,
    };
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      bannerPic: map['bannerPic'] as String,
      uid: map['uid'] as String,
      bio: map['bio'] as String,
      isTwitterBlue: map['isTwitterBlue'] as bool,
      followers: map['followers'] as List<String>,
      following: map['following'] as List<String>,
    );
  }

//</editor-fold>
}

