import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wazzi/Pages/register.dart';
import 'package:wazzi/drawer/Drawerwidget.dart';
import 'package:wazzi/drawer/custom_route.dart';
import 'package:wazzi/drawer/googlemap.dart';

///import 'package:waazi/drawer/googlemap.dart';

class MainPage extends StatefulWidget {
  @override
  Mainpage createState() => Mainpage();
}

class Mainpage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    ///final user = FirebaseAuth.instance.currentUser!;
    ////UserDetails? details = UserDetails as UserDetails?;

    ///UserProvider userProvider = Provider.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
          elevation: 0,
          title: const Text(
            "Welcome to Waazi",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),
            textAlign: TextAlign.start,
          ),
          actions: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.alignRight),
              color: Colors.green,
              onPressed: () {
                Navigator.of(context)
                    .push(CustomPageRoute(child: const ProfileDrawer()));
              },
              alignment: Alignment.topRight,
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/machanics.jpg"),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(children: [
                  Expanded(

                      ///flex: 1,
                      child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 130, bottom: 60)),
                      Text('Make your Car Brand New!!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 19))
                    ],
                  ))
                ]),
              ),
              const SizedBox(height: 19),
              const Row(children: [
                Expanded(
                    child: Column(
                  children: [
                    Text('EASIER | QUICKER | CHEAPER',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 18)),
                  ],
                ))
              ]),
              const SizedBox(height: 19),
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Choose your Service as Required',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: (13),
                  ),
                  textAlign: TextAlign.center,
                )
              ]),
              const SizedBox(height: 20),
              //GridDashboard(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Gridviewgooglemap()));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 140,
                        width: 130,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),

                              ///flex: 1,
                              child: Image(
                                image: AssetImage(
                                  "images/tows.png",
                                ),
                                width: 45,
                              ),
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Roadside \n Assistance',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Register()));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 140,
                        width: 130,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Image(
                                image: AssetImage("images/services.png"),
                                width: 40,
                              ),
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Repair \n Service',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /*GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Gridviewgooglemap()));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(25),
                        child: Image(
                          image: AssetImage("images/tows.png"),
                          width: 40,
                        ),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Tow carrier',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              ),*/
            ],
          ),
        ),

        ///bottomNavigationBar: MyHome(),
      ),
    );
  }
}
