import 'package:flutter/material.dart';
import 'package:wazzi/Pages/price_detail.dart';
import 'package:wazzi/widget/themehelp.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  var selectedType;
  final List<String> _service = <String>[
    'Repair',
    'Car Service',
    'Service Contracts'
  ];

  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Details'),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 20, 20, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Form(
                        child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    width: 10,
                                    color: Colors.white,
                                  ),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20,
                                        offset: Offset(5, 5))
                                  ]),
                              child: Image.asset(
                                "images/tows.png",
                                width: 100,
                                height: 90,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 80, left: 90),
                              child: RawMaterialButton(
                                elevation: 10,

                                ///fillColor: Color(0xFFD50000),
                                child: const Icon(Icons.add_a_photo),
                                padding: const EdgeInsets.all(15.0),
                                shape: const CircleBorder(),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            'Choose Option',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.red),
                                          ),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: [
                                                InkWell(
                                                  ///onTap: _pickImageCamera,
                                                  splashColor: Colors.red,
                                                  child: Row(
                                                    children: const [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          Icons.camera,
                                                          color: Colors
                                                              .amberAccent,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Camera',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .redAccent,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  //onTap: _pickImageGallery,
                                                  splashColor: Colors.red,
                                                  child: Row(
                                                    children: const [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          Icons.image,
                                                          color: Colors
                                                              .amberAccent,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Gallery',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .redAccent,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  //onTap: _remove,
                                                  splashColor: Colors.red,
                                                  child: Row(
                                                    children: const [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          Icons
                                                              .remove_circle_outline,
                                                          color: Colors
                                                              .amberAccent,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Remove',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .redAccent,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelp()
                                .textInputDecoration('Enter your name'),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            decoration:
                                ThemeHelp().textInputDecoration('Date & Time'),
                          ),
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                decoration: ThemeHelp().textInputDecoration(
                                    'Model', 'Enter Car type'),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextFormField(
                                  decoration:
                                      ThemeHelp().textInputDecoration('Year')),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                decoration: ThemeHelp().textInputDecoration(
                                    'Color', 'Enter Car Color'),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextFormField(
                                  decoration: ThemeHelp().textInputDecoration(
                                      'Plate No', 'Enter Number Plate')),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            DropdownButton(
                              items: _service
                                  .map((value) => DropdownMenuItem(
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              color: Color(0xff11b719)),
                                        ),
                                        value: value,
                                      ))
                                  .toList(),
                              onChanged: (selectedAccountType) {
                                /*setState((){
                               
                               selectedType = selectedAccountType;
                              });*/
                              },
                              value: selectedType,
                              isExpanded: false,
                              hint: Text(
                                'Choose A Service',
                                style: TextStyle(color: Color(0xff11b719)),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: ThemeHelp().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelp().buttonStyle(),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => pricesDetail()));
                            },
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
