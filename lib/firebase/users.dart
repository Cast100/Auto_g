// ignore_for_file: prefer_collection_literals

class UserDetail {
  String? displayName;
  String? email;
  String? photoURL;

  UserDetail(
      {required this.displayName, required this.email, required this.photoURL});

  UserDetail.fromJson(Map<String, dynamic> json) {
    displayName = json["Name"];
    email = json["email"];
    photoURL = json["photo"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['displayName'] = displayName;
    data['email'] = email;
    data['photo'] = photoURL;

    return data;
  }
}
