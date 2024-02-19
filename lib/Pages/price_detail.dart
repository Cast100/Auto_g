import 'package:flutter/material.dart';
//import 'package:waazi/mode/user_preferences.dart';
//import 'package:waazi/util/car_preference.dart';
//import 'package:waazi/util/display_details.dart';

class pricesDetail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<pricesDetail> {
  //Servicedetails servicedetails = car_preference as Servicedetails;
  @override
  Widget build(BuildContext context) {
    Colors.white;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking Progress',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              height: 300,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(4),
              ),
              /*child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Vehicle :',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      servicedetails.model,
                      style: const TextStyle(color: Colors.green),
                    ),
                    Text(
                      servicedetails.year,
                      style: const TextStyle(color: Colors.green),
                    ),
                    Text(
                      servicedetails.color,
                      style: const TextStyle(color: Colors.green),
                    ),
                    Text(
                      servicedetails.plateNo,
                      style: const TextStyle(color: Colors.green),
                    )
                  ]),*/
            )
          ]),
        ),
      ),
    );
  }
}
