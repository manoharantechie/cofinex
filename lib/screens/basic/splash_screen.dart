import 'package:cofinex/screens/basic/onboard_screen.dart';
import 'package:cofinex/screens/basic/splash_home_screen.dart';
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

  @override
  void initState() {
    super.initState();

    getdata();
  }

  getdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    address = preferences.getString("first").toString();
    onLoad();
  }

  onLoad() {
    if (address.toString() == "" ||
        address.toString() == null ||
        address.toString() == "null") {
      setState(() {
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => OnboardScreen()));
        });
        // checkDeviceID(deviceData['device_id'].toString());
      });
    } else {
      Future.delayed(const Duration(seconds: 10), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SplashHomeScreen()));
      });
    }
  }

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
        height: MediaQuery.of(context).size.height ,
      )
          // child: SvgPicture.asset(
          //   'assets/images/logo.svg',
          //   height: 150.0,
          // )
          // child:Image.asset('assets/images/god.png', height: 300.0,),
          ),
    );
  }
}
