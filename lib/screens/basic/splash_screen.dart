import 'dart:convert';

import 'package:cofinex/data_model/api_utils.dart';
import 'package:cofinex/screens/basic/home.dart';
import 'package:cofinex/screens/basic/onboard_screen.dart';
import 'package:cofinex/screens/basic/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String address = "";
  String token = "";
  APIUtils apiUtils=APIUtils();

  @override
  void initState() {
    super.initState();

    getdata();



  }

  getdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    address = preferences.getString("first").toString();

    getToken();

  }

  onLoad() {
    if (address.toString() == "" ||
        address.toString() == null ||
        address.toString() == "null") {
      setState(() {
        Future.delayed(const Duration(seconds:3), () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => OnboardScreen()));
        });
        // checkDeviceID(deviceData['device_id'].toString());
      });
    } else {


      Future.delayed(const Duration(seconds:0), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Home_Screen(loginStatus: false)));
      });


      // Future.delayed(const Duration(seconds: 3), () {

      // });
   getToken();




  }}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0.0),
      child: Center(
          child: Image.asset(
        'assets/icon/logo.gif',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height ,fit: BoxFit.cover,
      )
          // child: SvgPicture.asset(
          //   'assets/images/logo.svg',
          //   height: 150.0,
          // )
          // child:Image.asset('assets/images/god.png', height: 300.0,),
          ),
    );
  }
  getToken() {
    apiUtils.generateToken().then((dynamic loginData) {
      setState(() {
     String   tokens = loginData["header"];


        List<int> decodedint = base64.decode(tokens);
        var decodedstring = utf8.decode(decodedint);
        Map cake=json.decode(decodedstring) ;
        String val=cake["Authorization"];
        val=val.replaceAll("Bearer", "");
        val=val.replaceAll(" ", "");

        token=val;

     storeData(token);

        onLoad();

        // storeData(datas["Authorization"].toString());
        // storeData(token);

      });

      //socketHistoryData();
    }).catchError((Object error) {
      setState(() {

      });
    });
  }

  storeData(String token) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);






  }
}
