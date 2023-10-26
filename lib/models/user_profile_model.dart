// class UserProfileModel {
//   UserProfileModel({
//     required this.statusCode,
//     required this.type,
//     required this.userPofile,
//   });
//   late final int statusCode;
//   late final String type;
//   late final List<UserPofile> userPofile;

//   UserProfileModel.fromJson(Map<String, dynamic> json) {
//     statusCode = json['statusCode'];
//     type = json['type'];
//     userPofile = List.from(json['UserPofile'])
//         .map((e) => UserPofile.fromJson(e))
//         .toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['statusCode'] = statusCode;
//     _data['type'] = type;
//     _data['UserPofile'] = userPofile.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

// class UserPofile {
//   UserPofile({
//     required this.username,
//     required this.email,
//     required this.followerCount,
//     required this.followingCount,
//     required this.postCount,
//     required this.UserPosts,
//   });
//   late final String username;
//   late final String email;
//   late final int followerCount;
//   late final int followingCount;
//   late final int postCount;
//   late final List<dynamic> UserPosts;

//   UserPofile.fromJson(Map<String, dynamic> json) {
//     username = json['username'];
//     email = json['email'];
//     followerCount = json['followerCount'];
//     followingCount = json['followingCount'];
//     postCount = json['postCount'];
//     UserPosts = List.castFrom<dynamic, dynamic>(json['UserPosts']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['username'] = username;
//     _data['email'] = email;
//     _data['followerCount'] = followerCount;
//     _data['followingCount'] = followingCount;
//     _data['postCount'] = postCount;
//     _data['UserPosts'] = UserPosts;
//     return _data;
//   }
// }
class UserProfileModel {
  UserProfileModel({
    required this.statusCode,
    required this.type,
    required this.userPofile,
  });
  late final int statusCode;
  late final String type;
  late final List<UserPofile> userPofile;

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    type = json['type'];
    userPofile = List.from(json['UserPofile'])
        .map((e) => UserPofile.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['statusCode'] = statusCode;
    _data['type'] = type;
    _data['UserPofile'] = userPofile.map((e) => e.toJson()).toList();
    return _data;
  }
}

class UserPofile {
  UserPofile({
    required this.username,
    required this.email,
    required this.followerCount,
    required this.followingCount,
    required this.postCount,
    required this.UserPosts,
  });
  late final String username;
  late final String email;
  late final int followerCount;
  late final int followingCount;
  late final int postCount;
  late final List<dynamic> UserPosts;

  UserPofile.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    followerCount = json['followerCount'];
    followingCount = json['followingCount'];
    postCount = json['postCount'];
    UserPosts = List.castFrom<dynamic, dynamic>(json['UserPosts']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['followerCount'] = followerCount;
    _data['followingCount'] = followingCount;
    _data['postCount'] = postCount;
    _data['UserPosts'] = UserPosts;
    return _data;
  }
}
