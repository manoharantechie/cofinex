import 'package:cofinex/screens/bottom/verification1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class ProfileVerification_Screen extends StatefulWidget {
  const ProfileVerification_Screen({Key? key}) : super(key: key);

  @override
  State<ProfileVerification_Screen> createState() => _ProfileVerification_ScreenState();
}

class _ProfileVerification_ScreenState extends State<ProfileVerification_Screen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: Scaffold(
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
          AppLocalizations.instance.text("loc_verify"),
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
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      padding: EdgeInsets.only(
                          top: 20.0, right: 15.0, left: 15.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage("assets/icon/back.png"),
                          fit: BoxFit.cover,
                        ),
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
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Theme.of(context).toggleableActiveColor.withOpacity(0.2),
                                ),
                                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                                child: Text(
                                  AppLocalizations.instance
                                      .text("loc_unverified"),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      8.0,
                                      Theme.of(context).dialogBackgroundColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                ),
                              )
                            ],
                          ),flex: 1,)
                        ],
                      ),
                    ),
                    SizedBox(height: 25.0,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.instance
                                .text("loc_current_services"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                10.0,
                                Theme.of(context).canvasColor,
                                FontWeight.w500,
                                'FontRegular'),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(child: SvgPicture.asset("assets/images/width.svg",height: 20.0,color: Theme.of(context).primaryColor,),flex: 1,),
                                  SizedBox(width: 10.0,),
                                  Flexible(child: Text(
                                    AppLocalizations.instance
                                        .text("loc_width"),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),flex: 1,)
                                ],
                              ),),
                              Flexible(child: Text(
                                "1BTC per day",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).accentColor,
                                    FontWeight.w400,
                                    'FontRegular'),
                              ),)

                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(child: SvgPicture.asset("assets/images/p2p.svg",height: 20.0,color: Theme.of(context).primaryColor,),flex: 1,),
                                  SizedBox(width: 10.0,),
                                  Flexible(child: Text(
                                    AppLocalizations.instance
                                        .text("loc_p2p"),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),flex: 1,)
                                ],
                              ),),
                              Flexible(child: Text(
                                "2,000 USD per day",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).accentColor,
                                    FontWeight.w400,
                                    'FontRegular'),
                              ),)

                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(child: SvgPicture.asset("assets/images/fiat.svg",height: 20.0,color: Theme.of(context).primaryColor,),flex: 1,),
                                  SizedBox(width: 10.0,),
                                  Flexible(child: Text(
                                    AppLocalizations.instance
                                        .text("loc_fiat_dep"),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),flex: 1,)
                                ],
                              ),),
                              Flexible(child: Text(
                                "Fiat Deposit",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).accentColor,
                                    FontWeight.w400,
                                    'FontRegular'),
                              ),)

                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0,),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 1.0,color: Theme.of(context).splashColor,)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(15.0,15.0,15.0,10.0),
                      child: Text(
                        AppLocalizations.instance
                            .text("loc_all_serv"),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),),
                    Padding(padding: EdgeInsets.fromLTRB(15.0,0.0,15.0,10.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet consectetur. Vivamus pellentesque urna ut.",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            10.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w500,
                            'FontRegular'),
                      ),),
                    Container(
                      height: 1.0,
                      color: Theme.of(context).splashColor,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0,15.0,15.0,10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(child: SvgPicture.asset("assets/images/width.svg",height: 20.0,color: Theme.of(context).primaryColor,),flex: 1,),
                                  SizedBox(width: 10.0,),
                                  Flexible(child: Text(
                                    AppLocalizations.instance
                                        .text("loc_width"),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),flex: 1,)
                                ],
                              ),),
                              Flexible(child: Text(
                                "200BTC per day",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).accentColor,
                                    FontWeight.w400,
                                    'FontRegular'),
                              ),)

                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(child: SvgPicture.asset("assets/images/p2p.svg",height: 20.0,color: Theme.of(context).primaryColor,),flex: 1,),
                                  SizedBox(width: 10.0,),
                                  Flexible(child: Text(
                                    AppLocalizations.instance
                                        .text("loc_p2p"),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),flex: 1,)
                                ],
                              ),),
                              Flexible(child: Text(
                                "500,000 USD per day",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).accentColor,
                                    FontWeight.w400,
                                    'FontRegular'),
                              ),)

                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(child: SvgPicture.asset("assets/images/fiat.svg",height: 20.0,color: Theme.of(context).primaryColor,),flex: 1,),
                                  SizedBox(width: 10.0,),
                                  Flexible(child: Text(
                                    AppLocalizations.instance
                                        .text("loc_fiat_dep"),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),flex: 1,)
                                ],
                              ),),
                              Flexible(child: Text(
                                "Available ",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).accentColor,
                                    FontWeight.w400,
                                    'FontRegular'),
                              ),)

                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      height: 1.0,
                      color: Theme.of(context).splashColor,
                    ),
                    SizedBox(height: 5.0,),

                    Padding(padding: EdgeInsets.fromLTRB(15.0,15.0,15.0,10.0),child: Center(
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => Verification_Screen1()));
                        },
                        child:Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Theme.of(context).buttonColor,
                          ),
                          padding: EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 10.0),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Center(
                            child: Text(
                              AppLocalizations.instance
                                  .text("loc_verify_now"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  13.0,
                                  Theme.of(context).focusColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                          ),
                        ),
                      ),
                    ),),
                    SizedBox(height: 10.0,),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
