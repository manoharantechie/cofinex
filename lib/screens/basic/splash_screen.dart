import 'package:cofinex/screens/basic/onboard_screen.dart';
import 'package:cofinex/screens/basic/splash_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
      color:  Theme.of(context).backgroundColor,
      padding: EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0.0),
      child: Center(
        child: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 150.0,
        )
        // child:Image.asset('assets/images/god.png', height: 300.0,),
      ),
    );
  }
}
