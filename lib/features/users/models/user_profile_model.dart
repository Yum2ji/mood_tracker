class UserProfileModel {
  final String uid;

  // users.dart 에 있는 내용 확인함.
  final String email;


  UserProfileModel({
    required this.uid,
    required this.email,
  });

  UserProfileModel.empty()
      : uid = "",
        email = "";

  UserProfileModel.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        email = json["email"];

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
    };
  }

  UserProfileModel copyWith({
    String? uid,
    String? email,
  }) {
    return UserProfileModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
    );
  }
}
