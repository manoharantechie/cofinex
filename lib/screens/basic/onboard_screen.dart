import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/localization/localizations.dart';
import 'package:cofinex/common/onboard/background_final_button.dart';
import 'package:cofinex/common/onboard/flutter_onboarding_slider.dart';
import 'package:cofinex/screens/basic/splash_home_screen.dart';
import 'package:flutter/material.dart';

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
      finishButtonText: 'Register',
      onFinish: () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => SplashHomeScreen()));
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
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => SplashHomeScreen()));
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
      speed: 1.8,
      pageBodies: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 460,
              ),
              Text(
                'Exchange, Buy & Sell Cryptocurrency',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Easily buy Bitcoin and other cryptocurrencies using a wide range of payment options',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (context) => SplashHomeScreen()));
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
                    SizedBox(height: 10.0,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          Navigator.pop(context);
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
              ),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 460,
              ),
              Text(
                'Track Value Change Each Digital Currency ',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'For each digital currency, there is information about its current market cap, price, 24-hour trading volume',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
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
                    SizedBox(height: 10.0,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          Navigator.pop(context);
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
              ),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 460,
              ),
              Text(
                'Collect, Sell & Buy Digital Arts',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Discover exclusive digital collectibles and their non-fungible tokens using Cofinex today',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
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
                    SizedBox(height: 10.0,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          Navigator.pop(context);
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
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}