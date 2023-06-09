import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/localization/localizations.dart';
import 'package:cofinex/common/onboard/background_final_button.dart';
import 'package:cofinex/common/onboard/flutter_onboarding_slider.dart';
import 'package:cofinex/screens/basic/splash_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  // final Color kDarkBlueColor = const Color(0xFF053149);

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: '',

      onFinish: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SplashHomeScreen()));
      },
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      // skipTextButton: Text(
      //   'Skip',
      //   style: TextStyle(
      //     fontSize: 16,
      //     color: kDarkBlueColor,
      //     fontWeight: FontWeight.w600,
      //   ),
      // ),
      // trailing: Text(
      //   'Login',
      //   style: TextStyle(
      //     fontSize: 16,
      //     color: kDarkBlueColor,
      //     fontWeight: FontWeight.w600,
      //   ),
      // ),
      trailingFunction: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SplashHomeScreen()));
      },
      controllerColor: Theme.of(context).focusColor,
      totalPage: 3,
      headerBackgroundColor: Theme.of(context).primaryColor,
      pageBackgroundColor: Theme.of(context).primaryColor,
      background: [
        SizedBox(
          height: 400.0,
        ),
        SizedBox(
          height: 400.0,
        ),
        SizedBox(
          height: 400.0,
        ),
      ],
      speed: 0.1,
      pageBodies: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Text(
                'Exchange, Buy & Sell Cryptocurrency',
                textAlign: TextAlign.start,
                style:
                CustomWidget(context: context)
                    .CustomSizedTextStyle(
                    32.0,
                 Colors.white,
                    FontWeight.w700,
                    'FontRegular'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Easily buy Bitcoin and other cryptocurrencies using a wide range of payment options',
                textAlign: TextAlign.start,
                style:
                CustomWidget(context: context)
                    .CustomSizedTextStyle(
                    14.0,
                    Color(0xFFE8E8E8),
                    FontWeight.w500,
                    'FontRegular'),
              ),
              SizedBox(
                height: 50,
              ),
            bottomSkip(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Text(
                'Track Value Change Each Digital Currency ',
                textAlign: TextAlign.start,
                style:
                CustomWidget(context: context)
                    .CustomSizedTextStyle(
                    32.0,
                   Colors.white,
                    FontWeight.w700,
                    'FontRegular'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'For each digital currency, there is information about its current market cap, price, 24-hour trading volume',
                textAlign: TextAlign.start,
                style:
                CustomWidget(context: context)
                    .CustomSizedTextStyle(
                    14.0,
                    Color(0xFFE8E8E8),
                    FontWeight.w500,
                    'FontRegular'),
              ),

              SizedBox(
                height: 50,
              ),
             bottomSkip(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[


              Text(
                'Collect, Sell & Buy Digital Arts',
                textAlign: TextAlign.start,
                style:
                CustomWidget(context: context)
                    .CustomSizedTextStyle(
                    32.0,
                    Colors.white,
                    FontWeight.w700,
                    'FontRegular'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Discover exclusive digital collectibles and their non-fungible tokens using Cofinex today',
                textAlign: TextAlign.start,
                style:
                CustomWidget(context: context)
                    .CustomSizedTextStyle(
                    14.0,
                    Color(0xFFE8E8E8),
                    FontWeight.w500,
                    'FontRegular'),
              ),

              SizedBox(
                height: 50,
              ),
              bottomSkip(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget bottomSkip(){
    return  Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                storeData();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => SplashHomeScreen()));
              });
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
              decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  AppLocalizations.instance.text("loc_continue"),
                  style: CustomWidget(context: context)
                      .CustomSizedTextStyle(
                      14.0,
                      Theme.of(context).primaryColor,
                      FontWeight.w600,
                      'FontRegular'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          InkWell(
            onTap: () {
              setState(() {

                storeData();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => SplashHomeScreen()));
              });
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  AppLocalizations.instance.text("loc_skip"),
                  style: CustomWidget(context: context)
                      .CustomSizedTextStyle(
                      14.0,
                      Theme.of(context).backgroundColor,
                      FontWeight.w600,
                      'FontRegular'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  storeData()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString("first", "First");
  }
}
