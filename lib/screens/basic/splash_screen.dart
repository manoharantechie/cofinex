import 'package:cofinex/screens/basic/onboard_screen.dart';
import 'package:cofinex/screens/basic/splash_home_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    onLoad();
  }

  onLoad() {

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => OnboardScreen()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color:  Theme.of(context).primaryColor,
      child: Center(
        child:Image.asset('assets/images/god.png', height: 300.0,),
      ),
    );
  }
}
