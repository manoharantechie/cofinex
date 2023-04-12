import 'package:cofinex/screens/basic/bind_email.dart';
import 'package:cofinex/screens/basic/change_password.dart';
import 'package:cofinex/screens/basic/trade_changepassword.dart';
import 'package:cofinex/screens/bottom/verification_final.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Security_Screen extends StatefulWidget {
  const Security_Screen({Key? key}) : super(key: key);

  @override
  State<Security_Screen> createState() => _Security_ScreenState();
}

class _Security_ScreenState extends State<Security_Screen> {
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
          AppLocalizations.instance.text("loc_security"),
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
                        color: Theme.of(context).bottomAppBarColor,
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
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      padding: EdgeInsets.only(
                          top: 20.0, right: 15.0, left: 15.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(child: SvgPicture.asset(
                            "assets/profile/Icon.svg",
                          ),flex: 1,),
                          SizedBox(
                            width: 20.0,
                          ),
                          Flexible(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dan Tourlan",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(context).focusColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                              ),
                              SizedBox(height: 8.0,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.instance
                                        .text("loc_uid")+" :",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        10.0,
                                        Theme.of(context).dialogBackgroundColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),
                                  Text(
                                    "1773854678",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        10.0,
                                        Theme.of(context).dialogBackgroundColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),
                                  SizedBox(width: 5.0,),
                                  Icon(Icons.copy_outlined, size: 12,color: Theme.of(context).dialogBackgroundColor,)

                                ],
                              ),
                              SizedBox(height: 8.0,),
                              InkWell(
                                onTap: (){
                                  // Navigator.of(context)
                                  //     .push(MaterialPageRoute(builder: (context) => ProfileVerification_Screen()));
                                },
                                child:  Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Theme.of(context).toggleableActiveColor.withOpacity(0.2),
                                  ),
                                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                                  child: Text(
                                    AppLocalizations.instance
                                        .text("loc_verified"),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        8.0,
                                        Theme.of(context).buttonColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),
                                ),
                              )
                            ],
                          ),flex: 1,)
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).focusColor,
                          borderRadius: BorderRadius.circular(12.0),
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
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) => ChangePassword_Screen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.instance
                                        .text("loc_log_pass"),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.instance
                                            .text("loc_change"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            12.0,
                                            Theme.of(context).accentColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                      ),
                                      SizedBox(
                                        width: 10.0,
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
                                  .push(MaterialPageRoute(builder: (context) => Trade_Change_Screen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.instance
                                        .text("loc_trd_pass"),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.instance
                                            .text("loc_not_config"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            12.0,
                                            Theme.of(context).accentColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                      ),
                                      SizedBox(
                                        width: 10.0,
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
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).focusColor,
                          borderRadius: BorderRadius.circular(12.0),
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
                              // Navigator.of(context)
                              //     .push(MaterialPageRoute(builder: (context) => Security_Screen()));
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
                                      Text(
                                        AppLocalizations.instance
                                            .text("loc_phone"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            12.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                      ),
                                      SizedBox(width: 15.0,),
                                      Container(
                                        width: MediaQuery.of(context).size.width *0.5,
                                        child: Text(
                                          "+91 95565 ******",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              12.0,
                                              Theme.of(context).primaryColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.instance
                                            .text("loc_change"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            12.0,
                                            Theme.of(context).accentColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                      ),
                                      SizedBox(
                                        width: 10.0,
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
                                  .push(MaterialPageRoute(builder: (context) => Bind_Email_Screen()));
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
                                      Text(
                                        AppLocalizations.instance
                                            .text("loc_email"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            12.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                      ),
                                      SizedBox(width: 15.0,),
                                      Container(
                                        width: MediaQuery.of(context).size.width *0.5,
                                        child: Text(
                                          "",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              12.0,
                                              Theme.of(context).primaryColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.instance
                                            .text("loc_bind"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            12.0,
                                            Theme.of(context).accentColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                      ),
                                      SizedBox(
                                        width: 10.0,
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
                                  .push(MaterialPageRoute(builder: (context) => Verification_Final()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.instance
                                        .text("loc_veri_goo"),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.instance
                                            .text("loc_change"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            12.0,
                                            Theme.of(context).accentColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                      ),
                                      SizedBox(
                                        width: 10.0,
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
                              // Navigator.of(context)
                              //     .push(MaterialPageRoute(builder: (context) => Security_Screen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.instance
                                        .text("loc_anti_code"),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.instance
                                            .text("loc_not_config"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            12.0,
                                            Theme.of(context).accentColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                      ),
                                      SizedBox(
                                        width: 10.0,
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
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).focusColor,
                          borderRadius: BorderRadius.circular(12.0),
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
                            Text(
                              AppLocalizations.instance
                                  .text("loc_pay_method"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
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
                      height: 15.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).focusColor,
                          borderRadius: BorderRadius.circular(12.0),
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
              )


            ],
          ),
        ),
      ),
    );
  }
}
