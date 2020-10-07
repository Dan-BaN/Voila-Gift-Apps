import 'package:VoilaGiftApp/screens/Delivery/dateandtime.dart';
import 'package:flutter/material.dart';
import 'package:VoilaGiftApp/screens/Delivery/orderconfirm.dart';
import 'package:VoilaGiftApp/screens/Delivery/deliverydetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signUpPage(),
    );
  }
}
class signUpPage extends StatefulWidget {
  @override
  _signUpPageState createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/images/logo.png')
                  )
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dear Customer,", style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'sfpro'
                  ),),
                  Text("Add You'r Delivery Details", style: TextStyle(
                      color: Colors.orange,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'sfpro'
                  ),),
                  SizedBox(height: 10,),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Name",
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Address",
                    ),
                  ),
                  SizedBox(height: 40,),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Any Notes",
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(

                      padding: EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          gradient: LinearGradient(
                              colors: [Color(0xfff3953b), Color(0xffe57509)],
                              stops: [0,1],
                              begin: Alignment.topCenter
                          )
                      ),

                      child: InkWell(
                        onTap: openSignPage,
                        child: Text("                       Add My Details", style: TextStyle(

                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'sfpro'
                        ),),
                      )

                  ),
                  SizedBox(height: 10,),

                ],
              ),
            ),

            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
  void openSignPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>custform()));
  }
}