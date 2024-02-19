// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:waazi/Pages/register.dart';

class GridDashboard extends StatelessWidget {
  Item item1 = Item(name: "Repair", img: 'images/repairs.png');
  Item item2 = Item(name: "Service", img: 'images/services.png');
  Item item3 = Item(name: "Tow truck", img: 'images/tows.png');
  @override
  Widget build(BuildContext context) {
    List<Item> mylist = [item1, item2, item3];
    var color = 0xffFFFFFF;
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: const EdgeInsets.only(left: 16, right: 16),
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        crossAxisCount: 2,
        children: mylist.map((data) {
          return GestureDetector(
            child: Container(
                height: 3,
                decoration: BoxDecoration(
                  color: Color(color),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        data.img,
                        width: 60,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        data.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      )
                    ])),
            onTap: () {
              /*Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Register()));*/
            },
          );
        }).toList(),
      ),
    );
  }
}

class Item {
  String name;
  String img;

  Item({
    required this.name,
    required this.img,
  });
}
