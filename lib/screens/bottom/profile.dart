

import 'package:cofinex/common/custom_switch.dart';
import 'package:cofinex/common/theme/themes.dart';
import 'package:cofinex/screens/bottom/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/theme/custom_theme.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {

  bool light=false;
  String themeType="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }



  getDetails()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    setState(() {

      themeType=preferences.getString('theme').toString();
      print(themeType);

      if(themeType==null || themeType=="null")
      {
        CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.LIGHT);
        light=true;
      }
      else if(themeType=="dark"){
        CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.DARK);
        light=false;

      }
      else
      {
        CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.LIGHT);
        light=true;
      }
    });
  }
  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  setData(String type)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString("theme", type);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        leading: Padding(
            padding: EdgeInsets.only(left: 12.0, top: 10.0, bottom: 10.0),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Theme.of(context).bottomAppBarColor,
                  ),
                ))),
        title: Text(
          AppLocalizations.instance.text("loc_acc"),
          style: CustomWidget(context: context).CustomSizedTextStyle(18.0,
              Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(
                  left: 0.0, top: 10.0, bottom: 8.0, right: 20.0),
              child: InkWell(
                  onTap: () {
                    // Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).backgroundColor,
                        border: Border.all(
                          width: 1.0,
                          color: Theme.of(context).splashColor,
                        )),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/images/mic.svg",
                        height: 20.0,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                  ))),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => ProfileDetailsScreen()));
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: 15.0, right: 15.0, left: 15.0, bottom: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/profile/Icon.svg",
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Dan Tourlan",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).focusColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      width: 1.0,
                      color: Theme.of(context).splashColor,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/profile/verification.svg",
                                height: 18.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                AppLocalizations.instance
                                    .text("loc_verification"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15.0,
                            color: Theme.of(context).splashColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 1.0,
                      color: Theme.of(context).splashColor,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/profile/security.svg",
                                height: 18.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                AppLocalizations.instance.text("loc_security"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15.0,
                            color: Theme.of(context).splashColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 1.0,
                      color: Theme.of(context).splashColor,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/profile/icon_aml.svg",
                                height: 18.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                AppLocalizations.instance.text("loc_aml"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15.0,
                            color: Theme.of(context).splashColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      width: 1.0,
                      color: Theme.of(context).splashColor,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/profile/language.svg",
                                height: 18.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "Language",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15.0,
                            color: Theme.of(context).splashColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 1.0,
                      color: Theme.of(context).splashColor,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/profile/dark.svg",
                                height: 18.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "Dark Theme",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                              ),
                            ],
                          ),
                          CustomSwitch(
                              value: light,
                              activeColor: Theme.of(context).accentColor.withOpacity(0.5),
                              circleColor:  Theme.of(context).focusColor,
                              inactiveColor:  Theme.of(context).accentColor.withOpacity(0.5),
                              activeTextColor: Theme.of(context).focusColor,
                              chanegStatus: light,
                            onChanged: (val){
                                setState(() {

                                  print(val);

                                  if(val)
                                    {
                                      _changeTheme(context, MyThemeKeys.LIGHT);

                                      light=val;
                                      setData("light");

                                    }
                                  else{

                                    _changeTheme(context, MyThemeKeys.DARK);

                                    light=val;
                                    setData("dark");

                                  }



                                });
                            },
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 1.0,
                      color: Theme.of(context).splashColor,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/notification.svg",
                                height: 18.0,
                                color: Theme.of(context).accentColor,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                AppLocalizations.instance.text("loc_aml"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15.0,
                            color: Theme.of(context).splashColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 1.0,
                      color: Theme.of(context).splashColor,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/profile/check.svg",
                                height: 18.0,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                AppLocalizations.instance.text("loc_ctx_info"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "ver. 2.2.1",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).accentColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15.0,
                                color: Theme.of(context).splashColor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      width: 1.0,
                      color: Theme.of(context).splashColor,
                    )),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/profile/exit.svg",
                            height: 18.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Logout",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      width: 1.0,
                      color: Theme.of(context).splashColor,
                    )),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/profile/delete.svg",
                            height: 18.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Delete Account",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).scaffoldBackgroundColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
