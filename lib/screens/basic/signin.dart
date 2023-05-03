import 'package:cofinex/common/localization/localizations.dart';
import 'package:cofinex/screens/basic/login.dart';
import 'package:cofinex/screens/basic/login_first.dart';
import 'package:cofinex/screens/basic/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/custom_widget.dart';

class Sign_In_Screen extends StatefulWidget {
  const Sign_In_Screen({Key? key}) : super(key: key);

  @override
  State<Sign_In_Screen> createState() => _Sign_In_ScreenState();
}

class _Sign_In_ScreenState extends State<Sign_In_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        toolbarHeight: 10.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Theme.of(context).backgroundColor,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(20.0, 0.0,20.0,0.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color:  Theme.of(context).backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 70.0),
                // height: MediaQuery.of(context).size.height*0.55,
                child: Center(
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: SvgPicture.asset('assets/images/logo.svg', height: 60.0,),),
                      SizedBox(height: 15.0,),
                      Text(
                        AppLocalizations.instance.text("loc_welcome_txt"),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            27.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w700,
                            'FontRegular'),
                      ),
                      SizedBox(height: 35.0,),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 1.0, color: Theme.of(context).accentColor,),
                          color: Theme.of(context).focusColor,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/images/f_logo.svg', height: 20.0,),
                            SizedBox(width: 10.0,),
                            Text(
                              AppLocalizations.instance.text("loc_fb_txt"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 1.0, color: Theme.of(context).accentColor,),
                          color: Theme.of(context).focusColor,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/images/logo-apple.svg', height: 20.0,),
                            SizedBox(width: 10.0,),
                            Text(
                              AppLocalizations.instance.text("loc_apple_txt"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 1.0, color: Theme.of(context).accentColor,),
                          color: Theme.of(context).focusColor,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/images/logo-google.svg', height: 20.0,),
                            SizedBox(width: 10.0,),
                            Text(
                              AppLocalizations.instance.text("loc_google_txt"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => Register()));
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).buttonColor,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Theme.of(context).backgroundColor, ),
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.instance.text("loc_sign_up_txt"),
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
                    ],
                  ),
                ),
              ),
              Container(
                // height: MediaQuery.of(context).size.height*0.3,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding:const EdgeInsets.only(left: 25.0, right: 25.0,bottom: 20.0),
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: Text(
                          AppLocalizations.instance.text("loc_all_account"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              14.0,
                              Theme.of(context).canvasColor,
                              FontWeight.w600,
                              'FontRegular'),
                        ),
                      )
                    ),
                    InkWell(
                      onTap: (){

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => LoginFirst()));

                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15.0),
                        padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Theme.of(context).backgroundColor, ),
                        ),
                        child: Center(
                          child: Text(
                            AppLocalizations.instance.text("loc_signin"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).backgroundColor,
                                FontWeight.w600,
                                'FontRegular'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0,)

                  ],
                ),
              ),

            ],
          )
      ),
    );
  }
}
