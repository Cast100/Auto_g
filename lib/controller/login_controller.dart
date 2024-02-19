import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:wazzi/controller/user_model.dart';

class loginControl with ChangeNotifier {
  Map? userData;
  UserDetails? userDetails;
  late AccessToken _accessToken;

  facebooklogin() async {
    var result = await FacebookAuth.i.login(
      permissions: ["public_profile", "email"],
    );

    // check the status of our login
    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken!;
      final requestData = await FacebookAuth.i.getUserData(
        fields: "email, name, picture",
      );

      userDetails = UserDetails(
        displayName: requestData["name"],
        email: requestData["email"],
        photoURL: requestData["picture"]["data"]["url"] ?? " ",
      );
      notifyListeners();
    }
  }

  // logout
  logout() async {
    await FacebookAuth.i.logOut();
    userData = null;
    notifyListeners();
  }
}
