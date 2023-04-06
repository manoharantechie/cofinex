import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/localization/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SplashHomeScreen extends StatefulWidget {
  const SplashHomeScreen({Key? key}) : super(key: key);

  @override
  State<SplashHomeScreen> createState() => _SplashHomeScreenState();
}

class _SplashHomeScreenState extends State<SplashHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          toolbarHeight: 10.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Theme.of(context).primaryColor,

            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(25.0, 0.0,25.0,0.0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color:  Theme.of(context).primaryColor,
            child: Padding(
              padding: EdgeInsets.only(bottom: 45.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.48,
                    child: Center(
                      child:    Image.asset('assets/images/god.png', height: 300.0,),
                    ),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding:const EdgeInsets.only(left: 25.0, right: 25.0,bottom: 35.0),
                          child: Text(
                            AppLocalizations.instance.text("loc_welcome"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                28.0,
                                Theme.of(context).backgroundColor,
                                FontWeight.w500,
                                'FontRegular'),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {

                            });
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: Theme.of(context).backgroundColor, ),
                            ),
                            child: Center(
                              child: Text(
                                AppLocalizations.instance.text("loc_login"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    16.0,
                                    Theme.of(context).backgroundColor,
                                    FontWeight.w500,
                                    'FontRegular'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        InkWell(
                          onTap: (){
                            setState(() {


                            });
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Theme.of(context).backgroundColor, ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Center(
                              child: Text(
                                AppLocalizations.instance.text("loc_signup"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    16.0,
                                    Theme.of(context).backgroundColor,
                                    FontWeight.w500,
                                    'FontRegular'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0,),
                      ],
                    ),
                  ),

                ],
              ),
            )
        )
    );
  }
}
