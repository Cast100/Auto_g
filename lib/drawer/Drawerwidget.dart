import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
//import 'package:verse_one/helper/SignIn.dart';
//import 'package:verse_one/src/Auth.dart';
import 'package:app_settings/app_settings.dart';
//import 'package:verse_one/src/dialog.dart';
//import 'package:verse_one/src/text_spring.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    //final user = FirebaseAuth.instance.currentUser!;
    //final details = Provider.of<AuthProvid>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(2.0),
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 4),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                      color: Colors.black87.withOpacity(0.7),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.cancel,
                      size: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30, height: 30),
            RichText(
              text: const TextSpan(
                text: "Hi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
                children: <InlineSpan>[
                  WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: SizedBox(width: 2)),
                  TextSpan(
                    text: "Rashid",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
            const Text(
              "rashidcast@hotmail.com",
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
              indent: 25,
              endIndent: 25,
              color: Colors.black,
              height: 5,
            ),
            const SizedBox(
              height: 10,
            ),
            MenuWidget(
              title: "My info",
              icon: LineAwesomeIcons.user,
              onPress: () {},
            ),
            const SizedBox(height: 10),
            MenuWidget(
              title: "History",
              icon: LineAwesomeIcons.history,
              onPress: () {},
            ),
            const SizedBox(height: 10),
            MenuWidget(
              title: "Notification ",
              icon: LineAwesomeIcons.bell,
              onPress: () {
                AppSettings.openAppSettings(type: AppSettingsType.notification);
              },
            ),
            const SizedBox(height: 10),
            MenuWidget(
              title: "Refer to Friends",
              icon: LineAwesomeIcons.user_friends,
              onPress: () {
                Share.share("com.example.verse_one");
              },
            ),
            const SizedBox(height: 10),
            MenuWidget(
              title: "Setting",
              icon: LineAwesomeIcons.cog,
              onPress: () {},
            ),
            const SizedBox(height: 10),
            MenuWidget(
              title: "Logout",
              icon: LineAwesomeIcons.alternate_sign_out,
              textColor: Colors.red,
              endIcon: true,
              onPress: () {
                /*showDialog(
                    barrierColor: Colors.black26,
                    context: context,
                    builder: (context) {
                      return const CustomAlertDialog(
                          title: "Oops!",
                          description: "Are you sure you want to logout?");
                    });*/
              },
            ),
          ]),
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  MenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.textColor,
    this.endIcon = false,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final Color? textColor;
  final bool endIcon;

  @override
  Widget build(BuildContext context) {
    //var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    //var iconColor = isDark ? tPrimaryColor :
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.red.withOpacity(0.1)),
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
      title: Text(title,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                size: 18.0,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
