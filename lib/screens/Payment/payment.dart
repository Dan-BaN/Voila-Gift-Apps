// import 'dart:html';

import 'package:VoilaGiftApp/constants.dart';
import 'package:VoilaGiftApp/screens/OrderCart/voilaAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Payment extends StatefulWidget {
  Payment({Key key, this.totPrice}) : super(key: key);
  final double totPrice;

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool checkBoxVal1 = false;
  bool checkBoxVal2 = false;
  bool checkBoxVal3 = false;

  final _formKey = GlobalKey<FormState>();
  final cardNumber = TextEditingController();
  final cvc = TextEditingController();
  final expiryDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // print()
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: VoilaAppBar(title: "Select Payment"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                    activeColor: PrimaryColor,
                    checkColor: Colors.black,
                    value: checkBoxVal1,
                    onChanged: (bool val1) {
                      setState(() {
                        checkBoxVal1 = val1;
                      });
                    },
                  ),
                  Text("Cash on Delivery ?")
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.ccVisa,
                          color: Colors.blue,
                          size: 60,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Checkbox(
                        activeColor: PrimaryColor,
                        checkColor: Colors.black,
                        value: checkBoxVal2,
                        onChanged: (bool val2) {
                          setState(() {
                            checkBoxVal2 = val2;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.ccMastercard,
                          color: Colors.blue[700],
                          size: 60,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Checkbox(
                        activeColor: PrimaryColor,
                        checkColor: Colors.black,
                        value: checkBoxVal3,
                        onChanged: (bool val3) {
                          setState(() {
                            checkBoxVal3 = val3;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: cardNumber,
                      decoration: InputDecoration(hintText: 'Card Number'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Card Number";
                        } else if (value.length < 3 || value.length > 3) {
                          return "enter a 3 number cvc";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: cvc,
                      decoration: InputDecoration(hintText: 'CVC'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter CVC";
                        } else if (value.length < 16) {
                          return "Enter 16 numbers";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: expiryDate,
                      decoration: InputDecoration(hintText: 'Expiry Date'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Expiry date";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 120,
                height: 50,
                child: Center(
                  child: Text("3200 LKR"),
                ),
                color: Colors.grey[400],
              ),
            ),
            FlatButton(
              onPressed: () {
                if (cardNumber.text.isNotEmpty &&
                    cardNumber.text.length == 16 &&
                    cvc.text.length == 3 &&
                    cvc.text.isNotEmpty &&
                    expiryDate.text.isNotEmpty) {
                  Firestore.instance.collection('Payment').add({
                    'cardNumber': cardNumber.text,
                    'cvc': cvc.text,
                    'expiryDate': expiryDate.text,
                  }).then((_) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Successfully Added')));
                    cardNumber.clear();
                    cvc.clear();
                    expiryDate.clear();
                  });
                }
              },
              child: Text("Pay"),
              color: PrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
