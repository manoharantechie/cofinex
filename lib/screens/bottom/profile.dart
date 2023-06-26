

import 'package:cofinex/common/custom_switch.dart';
import 'package:cofinex/common/theme/themes.dart';
import 'package:cofinex/screens/basic/aml_check.dart';
import 'package:cofinex/screens/basic/home.dart';
import 'package:cofinex/screens/basic/login.dart';
import 'package:cofinex/screens/basic/login_first.dart';
import 'package:cofinex/screens/basic/register.dart';
import 'package:cofinex/screens/dashboard/airdrop.dart';
import 'package:cofinex/screens/basic/future_trade.dart';
import 'package:cofinex/screens/dashboard/gift_card.dart';
import 'package:cofinex/screens/basic/notification.dart';
import 'package:cofinex/screens/basic/security.dart';
import 'package:cofinex/screens/basic/verification.dart';
import 'package:cofinex/screens/bottom/profile_details.dart';
import 'package:cofinex/screens/bottom/verification1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool cofinex=false;
  String themeType="";

  bool loginStatus=false;

  String  name="";
  String  email="";
  String  kycStatus="";
  String  kycLink="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }



  getDetails()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    setState(() {

      loginStatus=preferences.getBool("login")!;
      name=preferences.getString("name").toString();
      email=preferences.getString("name").toString();
      kycLink=preferences.getString("kycLink").toString();

      kycStatus=preferences.getString("kyc").toString();
      themeType=preferences.getString('theme').toString();


      if(themeType==null || themeType=="null")
      {
        CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.LIGHT);
        light=false;
      }
      else if(themeType=="dark"){
        CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.DARK);
        light=true;

      }
      else
      {
        CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.LIGHT);
        light=false;
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
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).backgroundColor,
            statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
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
        body:loginStatus?afterLogin():beforeLogin()
    ));
  }
  Widget afterLogin(){
    return  Container(
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
                  image: DecorationImage(
                    image: AssetImage("assets/icon/back.png"),
                    fit: BoxFit.cover,
                  ),
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
                     name,
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).errorColor,
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
                  InkWell(
                    onTap: (){
                      print(kycStatus);
                      if(kycStatus.toString().toUpperCase()=="PENDING")
                        {

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => Verification_Screen1(url: kycLink,)));
                        }

                    },
                    child: Padding(
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
                              "Cofinex India",
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
                          value: cofinex,
                          activeColor: Theme.of(context).unselectedWidgetColor.withOpacity(0.5),
                          circleColor:  Theme.of(context).focusColor,
                          inactiveColor:  Theme.of(context).unselectedWidgetColor.withOpacity(0.5),
                          activeTextColor: Theme.of(context).focusColor,
                          chanegStatus: light,
                          onChanged: (val){
                            setState(() {

                              print(val);

                              if(!val)
                              {


                                cofinex=val;

                              }
                              else{



                                cofinex=val;


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
                  InkWell(
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Security_Screen()));
                    },
                    child: Padding(
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
                  InkWell(
                    onTap: (){

                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Aml_Check_Screen()));

                    },
                    child: Padding(
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
                          activeColor: Theme.of(context).unselectedWidgetColor.withOpacity(0.5),
                          circleColor:  Theme.of(context).focusColor,
                          inactiveColor:  Theme.of(context).unselectedWidgetColor.withOpacity(0.5),
                          activeTextColor: Theme.of(context).focusColor,
                          chanegStatus: light,
                          onChanged: (val){
                            setState(() {

                              print(val);

                              if(!val)
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
                  InkWell(
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Notification_Screen()));

                    },
                    child:    Padding(
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
                                color: Theme.of(context).unselectedWidgetColor,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                AppLocalizations.instance.text("loc_notify"),
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
                                  Theme.of(context).unselectedWidgetColor,
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
             InkWell(
               onTap: (){
                 showSuccessAlertDialog("Logout",
                     "Are you sure want to logout ?");
               },
               child: Container(
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
    );
  }
  Widget beforeLogin(){
    return  Container(
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

            Text(
              "Welcome to Cofinex",
              style: CustomWidget(context: context)
                  .CustomSizedTextStyle(
                  18.0,
                  Theme.of(context).primaryColor,
                  FontWeight.w600,
                  'FontRegular'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Join the world's fastest-growing crypto exchange",
              style: CustomWidget(context: context)
                  .CustomSizedTextStyle(
                  12.0,
                  Theme.of(context).primaryColor,
                  FontWeight.w600,
                  'FontRegular'),
            ),
            SizedBox(
              height: 15.0,
            ),

           Row(
             children: [
               Flexible(child:  InkWell(
                   onTap: (){

                     Navigator.of(context)
                         .push(MaterialPageRoute(builder: (context) => Register()));

                   },
                   child:  Container(


                     padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0,bottom: 10.0),
                     decoration: BoxDecoration(
                       color:  Theme.of(context).bottomAppBarColor,
                       borderRadius: BorderRadius.circular(5.0),

                     ),
                     child: Center(
                       child:  Text(
                         AppLocalizations.instance.text("loc_signup"),
                         style: CustomWidget(context: context)
                             .CustomSizedTextStyle(
                             14.0,
                             Theme.of(context).focusColor,
                             FontWeight.w600,
                             'FontRegular'),
                       ),
                     ),
                   )
               ),flex: 1,),
               const SizedBox(width: 15.0,),
               Flexible(child:     InkWell(
                 onTap: (){
                   Navigator.of(context)
                       .push(MaterialPageRoute(builder: (context) => LoginFirst()));

                 },
                 child:Container(

                   padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0,bottom: 10.0),
                   decoration: BoxDecoration(
                     color:  Theme.of(context).primaryColorLight,
                     borderRadius: BorderRadius.circular(5.0),

                   ),
                   child: Center(
                     child:  Text(
                       AppLocalizations.instance.text("loc_login"),
                       style: CustomWidget(context: context)
                           .CustomSizedTextStyle(
                           14.0,
                           Theme.of(context).primaryColor,
                           FontWeight.w600,
                           'FontRegular'),
                     ),
                   ),
                 ),
               ),flex: 1,),
             ],
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
                              "assets/profile/dark.svg",
                              height: 18.0,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Cofinex India",
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
                          value: cofinex,
                          activeColor: Theme.of(context).unselectedWidgetColor.withOpacity(0.5),
                          circleColor:  Theme.of(context).focusColor,
                          inactiveColor:  Theme.of(context).unselectedWidgetColor.withOpacity(0.5),
                          activeTextColor: Theme.of(context).focusColor,
                          chanegStatus: light,
                          onChanged: (val){
                            setState(() {

                              print(val);

                              if(!val)
                              {


                                cofinex=val;

                              }
                              else{



                                cofinex=val;


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
                          activeColor: Theme.of(context).unselectedWidgetColor.withOpacity(0.5),
                          circleColor:  Theme.of(context).focusColor,
                          inactiveColor:  Theme.of(context).unselectedWidgetColor.withOpacity(0.5),
                          activeTextColor: Theme.of(context).focusColor,
                          chanegStatus: light,
                          onChanged: (val){
                            setState(() {



                              if(!val)
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
                  InkWell(
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Notification_Screen()));

                    },
                    child:    Padding(
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
                                color: Theme.of(context).unselectedWidgetColor,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                AppLocalizations.instance.text("loc_notify"),
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
                                  Theme.of(context).unselectedWidgetColor,
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

          ],
        ),
      ),
    );
  }
  showSuccessAlertDialog(
      String title,
      String message,
      ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).primaryColor,
              ),
              height: MediaQuery.of(context).size.height * 0.30,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).focusColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'FontRegular',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 7.0, bottom: 10.0),
                      height: 2.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            const Color(0xFF0DD8FF).withOpacity(0.3),
                            const Color(0xFF0FABFF).withOpacity(0.3),
                            const Color(0xFF1457FF).withOpacity(0.3),
                            const Color(0xFF1636FF).withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context).focusColor,
                        fontFamily: 'FontRegular',
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.clear();
                            Navigator.of(context).pop(true);
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                Home_Screen(loginStatus: false)), (Route<dynamic> route) => false);

                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 8.0, bottom: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Theme.of(context).primaryColorLight,
                                  Theme.of(context).primaryColorLight,
                                  Theme.of(context).primaryColorLight,
                                  Theme.of(context).primaryColorLight,
                                ],
                              ),
                            ),
                            child: Text(
                              AppLocalizations.instance
                                  .text("loc_logout"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  16.0,
                                  Theme.of(context).focusColor,
                                  FontWeight.w700,
                                  'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 8.0, bottom: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Theme.of(context).primaryColorLight,
                                  Theme.of(context).primaryColorLight,
                                  Theme.of(context).primaryColorLight,
                                  Theme.of(context).primaryColorLight,
                                ],
                              ),
                            ),
                            child: Text(
                              AppLocalizations.instance
                                  .text("loc_cancel"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  16.0,
                                  Theme.of(context).focusColor,
                                  FontWeight.w700,
                                  'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
    // show the dialog
  }
}
