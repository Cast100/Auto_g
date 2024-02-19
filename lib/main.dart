import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
//import 'package:waazi/Home.dart';
import 'package:wazzi/Main_page.dart';
import 'package:wazzi/controller/login_controller.dart';
import 'package:wazzi/drawer/location_provider.dart';
import 'package:wazzi/model/auth.dart';

///import 'package:waazi/screen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.white, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icon color
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider.initialize(),
        ),
        ChangeNotifierProvider(
          create: (context) => loginControl(),
          child: MainPage(),
        ),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
      ],
      child: MaterialApp(
        title: 'Waazi',
        theme: ThemeData(
          primaryColor: const Color(0xFFcecaaa),
        ),
        home: MainPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
