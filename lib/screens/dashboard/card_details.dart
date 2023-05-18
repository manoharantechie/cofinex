import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_switch.dart';
import '../../common/custom_widget.dart';
import '../../common/theme/custom_theme.dart';
import 'dart:math' as math;

class Card_Details_Screen extends StatefulWidget {
  const Card_Details_Screen({Key? key}) : super(key: key);

  @override
  State<Card_Details_Screen> createState() => _Card_Details_ScreenState();
}

class _Card_Details_ScreenState extends State<Card_Details_Screen> {

  bool light= false;
  bool cofinex= false;
  bool green= true;
  bool purple = false;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: Scaffold(
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
                  Icons.arrow_back_ios_new,
                  color: Theme.of(context).bottomAppBarColor,
                ),
              ),
            )),
        title: Text(
          "Your'e Applied for",
          style: CustomWidget(context: context).CustomSizedTextStyle(18.0,
              Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: Stack(
          children: [

            buyDetails(),

            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
                  padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "View or Upgrade",
                    // "This is Your Current Card",
                    // "Upgrade to Ruby Steel",
                    // "Continue",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        14.0,
                        Theme.of(context).focusColor,
                        FontWeight.w600,
                        'FontRegular'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    )
    );
  }

  Widget cardSetup(){
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(80.0, 10.0, 80.0, 10.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor.withOpacity(0.2),
                  ),
                  child: Text(
                    "NEO",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        20.0,
                        Theme.of(context).primaryColor,
                        FontWeight.w700,
                        'FontRegular'),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15.0,),
                Text(
                  "View or Upgrade",
                  style: CustomWidget(context: context)
                      .CustomSizedTextStyle(
                      16.0,
                      Theme.of(context).cardColor,
                      FontWeight.w600,
                      'FontRegular'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15.0,),
                Padding(padding: EdgeInsets.fromLTRB(35.0, 5.0, 35.0, 5.0), child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Color(0xff000000),
                        Color(0xff146b98),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15.0,),
                      Text(
                        "Cofinex Card Design",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            16.0,
                            Theme.of(context).focusColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10.0,),
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset("assets/images/crypto_currency.svg", color: Theme.of(context).backgroundColor, height: 100.0,),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          "assets/images/visaCard.svg",
                          height: 22.0,
                          width: 22.0,
                          alignment: Alignment.center,
                          matchTextDirection: false,
                        ),
                      ),
                    ],
                  ),
                ),),
                const SizedBox(height: 30.0,),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.24),
            padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 15.0),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10.0,),
               Container(
                 padding: EdgeInsets.all(10.0),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8.0),
                   color: Theme.of(context).accentColor.withOpacity(0.3),
                 ),
                 child:  Text(
                   "We appreciate your interest and support. Our team is dedicated to making the cofinex.io when Visa/Mastercard available in your market. Rest assured, we will inform you as soon as there is an update on its status.",
                   style: CustomWidget(context: context)
                       .CustomSizedTextStyle(
                       12.0,
                       Theme.of(context).primaryColor,
                       FontWeight.w600,
                       'FontRegular'),
                   textAlign: TextAlign.start,
                 ),
               ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget normalCard() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0), child: Container(
            padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color(0xff000000),
                  Color(0xff146b98),
                ],
                tileMode: TileMode.mirror,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15.0,),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/images/crypto_currency.svg", color: Theme.of(context).backgroundColor, height: 100.0,),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    "assets/images/visaCard.svg",
                    height: 22.0,
                    width: 22.0,
                    alignment: Alignment.center,
                    matchTextDirection: false,
                  ),
                ),
              ],
            ),
          ),),
          const SizedBox(height: 30.0,),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor.withOpacity(0.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50.0,),
                Align(alignment: Alignment.center,child: Text(
                  "Other Information",
                  style: CustomWidget(context: context)
                      .CustomSizedTextStyle(
                      16.0,
                      Theme.of(context).cardColor,
                      FontWeight.w600,
                      'FontRegular'),
                  textAlign: TextAlign.center,
                ),),
                const SizedBox(height: 10.0,),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fees",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        " ",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Monthly Fee",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "No Charge",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).buttonColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Annual Fee",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "No Charge",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).buttonColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),

                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Fee",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "No Charge",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).buttonColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Limits",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        " ",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Free ATM Limit",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "\$200"+" SGD",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w700,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Card",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        " ",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Card Type",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "Classic",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Material",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "PVC",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Contactless Payment",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Icon(Icons.check, color: Theme.of(context).indicatorColor, size: 20.0,),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pay anywhere VISA is accepted",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Icon(Icons.check, color: Theme.of(context).indicatorColor, size: 20.0,),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Crypto.com Visa Card Terms & Conditions",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        " ",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Terms & Conditions",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Icon(Icons.chevron_right_rounded, color: Theme.of(context).accentColor, size: 22.0,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80.0,),

        ],
      ),
    );
  }


  Widget rubyCard(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0), child: Container(
            padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xff000020),
                  Color(0xff5e0009),
                  Color(0xff9e0212),
                ],
                tileMode: TileMode.mirror,
              ),

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15.0,),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/images/crypto_currency.svg", color: Theme.of(context).backgroundColor, height: 100.0,),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    "assets/images/visaCard.svg",
                    height: 22.0,
                    width: 22.0,
                    alignment: Alignment.center,
                    matchTextDirection: false,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Platinum",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        10.0,
                        Theme.of(context).focusColor,
                        FontWeight.w500,
                        'FontRegular'),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
          ),),
          const SizedBox(height: 30.0,),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor.withOpacity(0.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50.0,),
                Align(alignment: Alignment.center,child: Text(
                  "Atlas Benefits",
                  style: CustomWidget(context: context)
                      .CustomSizedTextStyle(
                      18.0,
                      Theme.of(context).cardColor,
                      FontWeight.w700,
                      'FontRegular'),
                  textAlign: TextAlign.center,
                ),),
                const SizedBox(height: 5.0,),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: Text(
                            "Without \nCNX Lockup",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                12.0,
                                cofinex ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.end,
                          ),flex: 1,),
                          const SizedBox(width: 15.0,),
                          Flexible(child: CustomSwitch(
                            value: cofinex,
                            activeColor: Theme.of(context).cardColor.withOpacity(0.5),
                            circleColor:  Theme.of(context).focusColor,
                            inactiveColor:  Theme.of(context).accentColor.withOpacity(0.5),
                            activeTextColor: Theme.of(context).focusColor,
                            chanegStatus: light,
                            onChanged: (val){
                              setState(() {
                                if(!val)
                                {
                                  cofinex=val;
                                }
                                else{
                                  cofinex=val;
                                }
                              });
                            },
                          ),flex: 1,),
                          const SizedBox(width: 15.0,),
                          Flexible(child: Text(
                            "With \nCNX Lockup",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                12.0,
                                cofinex ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),flex: 1,)
                        ],
                      ),
                      const SizedBox(height: 20.0,),
                      cofinex ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width* 0.35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "1%",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      22.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10.0,),
                                Text(
                                  "Card Cashback",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      16.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Theme.of(context).accentColor,
                            height: MediaQuery.of(context).size.height* 0.18,
                            width: 2.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width* 0.35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "100%",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      22.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 5.0,),
                                Text(
                                  "Back",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      16.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10.0,),
                                Image.asset("assets/images/spotify.png", height: 20.0,)
                              ],
                            ),
                          )
                        ],
                      ): Container()
                    ],
                  ),
                ),
                const SizedBox(height: 10.0,),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Card Benefits",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        " ",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           "Card Cashback",
                           style: CustomWidget(context: context)
                               .CustomSizedTextStyle(
                               14.0,
                               Theme.of(context).primaryColor,
                               FontWeight.w600,
                               'FontRegular'),
                           textAlign: TextAlign.start,
                         ),
                         cofinex ? Text(
                           "(Up to €25.00 USD equiv every month )",
                           style: CustomWidget(context: context)
                               .CustomSizedTextStyle(
                               12.0,
                               Theme.of(context).accentColor,
                               FontWeight.w400,
                               'FontRegular'),
                           textAlign: TextAlign.start,
                         ): Text(
                           "(Up to €0.00 USD equiv every month )",
                           style: CustomWidget(context: context)
                               .CustomSizedTextStyle(
                               12.0,
                               Theme.of(context).accentColor,
                               FontWeight.w400,
                               'FontRegular'),
                           textAlign: TextAlign.start,
                         )
                       ],
                     ),
                      cofinex ? Text(
                        "1%",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ) : Icon(Icons.close, size: 20.0, color: Theme.of(context).primaryColor,),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Spotify reimbursement",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          cofinex  ? Container(
                           width: MediaQuery.of(context).size.width * 0.7,
                           child:  Text(
                             "(Up to €25.00 USD equiv every month for 6 months)",
                             style: CustomWidget(context: context)
                                 .CustomSizedTextStyle(
                                 12.0,
                                 Theme.of(context).accentColor,
                                 FontWeight.w400,
                                 'FontRegular'),
                             textAlign: TextAlign.start,
                           ),
                         ) : Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child:  Text(
                              "(Up to €13.99 USD equiv every month for 6 months)",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).accentColor,
                                  FontWeight.w400,
                                  'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                      cofinex ? Icon(Icons.check, color: Theme.of(context).indicatorColor, size: 20.0,): Icon(Icons.close, size: 20.0, color: Theme.of(context).primaryColor,),
                    ],
                  ),
                ),


                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "1. Paid in CNX token to your CNX Wallet. Requires an ongoing CNX lockup.",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 10.0,),
                      Text(
                        "2. This offer is launched by Crypto.com independenly and there is no partnership between Crypto.com and merchants in this offer.",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 10.0,),
                      Text(
                        "This offer is only available to your first card and will expire 6 months after card activation. Crypto.com has the sole discretion to modify this offer at any time.",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 50.0,),
                    Align(alignment: Alignment.center,child: Text(
                      "Other Information",
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          16.0,
                          Theme.of(context).cardColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textAlign: TextAlign.center,
                    ),),
                    const SizedBox(height: 10.0,),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Fees",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                12.0,
                                Theme.of(context).canvasColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            " ",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).accentColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.0,width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                    ),
                    Container(
                      color: Theme.of(context).focusColor,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Monthly Fee",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "No Charge",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).buttonColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.0,width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                    ),
                    Container(
                      color: Theme.of(context).focusColor,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Annual Fee",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "No Charge",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).buttonColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.0,width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                    ),

                    Container(
                      color: Theme.of(context).focusColor,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Fee",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "No Charge",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).buttonColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.0,width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "CNX Token Purchase Required",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                12.0,
                                Theme.of(context).canvasColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            " ",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).accentColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.0,width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                    ),
                    Container(
                      color: Theme.of(context).focusColor,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Purchase and hold €500 SGD worth of CNX tokens for 180 days to receive the Ruby Steel card.",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 10.0,),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                showSuccessAlertDialog();
                              });
                            },
                            child: Text(
                              "Learn More",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).buttonColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                    ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Limits",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        " ",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Free ATM Limit",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "€400"+" SGD",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w700,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Card",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                12.0,
                                Theme.of(context).canvasColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            " ",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).accentColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.0,width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                    ),
                    Container(
                      color: Theme.of(context).focusColor,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Card Type",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "Platinum",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.0,width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                    ),
                    Container(
                      color: Theme.of(context).focusColor,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Material",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "Metal",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.0,width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                    ),
                    Container(
                      color: Theme.of(context).focusColor,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Contactless Payment",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          Icon(Icons.check, color: Theme.of(context).indicatorColor, size: 20.0,),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.0,width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                    ),
                    Container(
                      color: Theme.of(context).focusColor,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pay anywhere VISA is accepted",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          Icon(Icons.check, color: Theme.of(context).indicatorColor, size: 20.0,),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.0,width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Crypto.com Visa Card Terms & Conditions",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                12.0,
                                Theme.of(context).canvasColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            " ",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).accentColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.0,width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                    ),
                    Container(
                      color: Theme.of(context).focusColor,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Terms & Conditions",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          Icon(Icons.chevron_right_rounded, color: Theme.of(context).accentColor, size: 22.0,),
                        ],
                      ),
                    ),
              ],
            ),
          ),
          const SizedBox(height: 80.0,),

        ],
      ),
    );
  }

  Widget jadeGreen(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0), child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xff000000),
                      green?  Color(0xff034a01): Color(0xff0e014a),
                    ],
                    tileMode: TileMode.mirror,
                  ),

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15.0,),
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset("assets/images/crypto_currency.svg", color: Theme.of(context).backgroundColor, height: 100.0,),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(
                        "assets/images/visaCard.svg",
                        height: 22.0,
                        width: 22.0,
                        alignment: Alignment.center,
                        matchTextDirection: false,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Platinum",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            10.0,
                            Theme.of(context).focusColor,
                            FontWeight.w500,
                            'FontRegular'),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: InkWell(
                    onTap: (){
                      setState(() {
                        green = true;
                        purple = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: green ? BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Theme.of(context).cardColor.withOpacity(0.3),
                          border: Border.all(width: 1.0, color: Color(0xff034a01).withOpacity(0.5),)
                      ) :BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Theme.of(context).cardColor.withOpacity(0.3),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff034a01),
                            ),
                          ),
                          const SizedBox(width: 10.0,),
                          Text(
                            "Jade Green",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).focusColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ),
                  ), flex: 1,),
                  const SizedBox(width: 15.0,),
                  Flexible(child: InkWell(
                    onTap: (){
                      setState(() {
                        green = false;
                        purple = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: purple ? BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Theme.of(context).cardColor.withOpacity(0.3),
                          border: Border.all(width: 1.0, color: Color(0xff0e014a).withOpacity(0.5),)
                      ) : BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Theme.of(context).cardColor.withOpacity(0.3),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff0e014a),
                            ),
                          ),
                          const SizedBox(width: 10.0,),
                          Text(
                            "Royal Indigo",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).focusColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ),
                  ),flex: 1,)
                ],
              )
            ],
          ),),
          const SizedBox(height: 30.0,),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor.withOpacity(0.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50.0,),
                Align(alignment: Alignment.center,child: Text(
                  green ? "Jade Green Privileges" : "Royal Indigo Privileges",
                  style: CustomWidget(context: context)
                      .CustomSizedTextStyle(
                      18.0,
                      Theme.of(context).cardColor,
                      FontWeight.w700,
                      'FontRegular'),
                  textAlign: TextAlign.center,
                ),),
                const SizedBox(height: 5.0,),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: Text(
                            "Without \nCNX Lockup",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                12.0,
                                cofinex ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.end,
                          ),flex: 1,),
                          const SizedBox(width: 15.0,),
                          Flexible(child: CustomSwitch(
                            value: cofinex,
                            activeColor: Theme.of(context).cardColor.withOpacity(0.5),
                            circleColor:  Theme.of(context).focusColor,
                            inactiveColor:  Theme.of(context).accentColor.withOpacity(0.5),
                            activeTextColor: Theme.of(context).focusColor,
                            chanegStatus: light,
                            onChanged: (val){
                              setState(() {
                                if(!val)
                                {
                                  cofinex=val;
                                }
                                else{
                                  cofinex=val;
                                }
                              });
                            },
                          ),flex: 1,),
                          const SizedBox(width: 15.0,),
                          Flexible(child: Text(
                            "With \nCNX Lockup",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                12.0,
                                cofinex?  Theme.of(context).primaryColor : Theme.of(context).accentColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),flex: 1,)
                        ],
                      ),
                      const SizedBox(height: 20.0,),
                      cofinex ? Container(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width* 0.35,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "2%",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            22.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 10.0,),
                                      Text(
                                        "Card Cashback",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            16.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Theme.of(context).accentColor,
                                  height: MediaQuery.of(context).size.height* 0.18,
                                  width: 2.0,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width* 0.35,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "100%",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            22.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 5.0,),
                                      Text(
                                        "Back",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            16.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 10.0,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Netflix",
                                            style: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                16.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(width: 10.0,),
                                          Image.asset("assets/images/spotify.png", height: 20.0,)
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1.0,
                              color: Theme.of(context).accentColor,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width* 0.35,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Transform.rotate(
                                        angle: 30 * math.pi / 180,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.airplanemode_active_outlined, color: Theme.of(context).primaryColor,
                                          ),
                                          onPressed: null,
                                        ),
                                      ),
                                      Text(
                                        "Airport Lounge",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            16.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Theme.of(context).accentColor,
                                  height: MediaQuery.of(context).size.height* 0.18,
                                  width: 2.0,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width* 0.35,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "4%",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            22.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 5.0,),
                                      Text(
                                        "CNX Lockup Rewards",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            16.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ): Container()
                    ],
                  ),
                ),
                const SizedBox(height: 10.0,),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Card Benefits",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        " ",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Card Cashback",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 5.0,),
                          cofinex ? Text(
                            "(Up to €50.00 USD equiv every month )",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                12.0,
                                Theme.of(context).accentColor,
                                FontWeight.w400,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ): Text(
                            "(Up to €0.00 USD equiv every month )",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                12.0,
                                Theme.of(context).accentColor,
                                FontWeight.w400,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                      cofinex ? Text(
                        "2%",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ) : Icon(Icons.close, size: 20.0, color: Theme.of(context).primaryColor,),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(
                    "Airport Lounge",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        14.0,
                        Theme.of(context).primaryColor,
                        FontWeight.w600,
                        'FontRegular'),
                    textAlign: TextAlign.start,
                    ),
                      cofinex ? Icon(Icons.check, color: Theme.of(context).indicatorColor, size: 20.0,): Icon(Icons.close, size: 20.0, color: Theme.of(context).primaryColor,),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context)  .accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Spotify reimbursement",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 5.0,),
                          cofinex  ? Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child:  Text(
                              "(Up to €13.99 USD equiv every month for 6 months)",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).accentColor,
                                  FontWeight.w400,
                                  'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                          ) : Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child:  Text(
                              "(Up to €13.99 USD equiv every month for 6 months)",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).accentColor,
                                  FontWeight.w400,
                                  'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                      cofinex ? Icon(Icons.check, color: Theme.of(context).indicatorColor, size: 20.0,): Icon(Icons.close, size: 20.0, color: Theme.of(context).primaryColor,),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context)  .accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Netflix reimbursement",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 5.0,),
                          cofinex  ? Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child:  Text(
                              "(Up to €13.99 USD equiv every month for 6 months)",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).accentColor,
                                  FontWeight.w400,
                                  'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                          ) : Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child:  Text(
                              "(Up to €13.99 USD equiv every month for 6 months)",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).accentColor,
                                  FontWeight.w400,
                                  'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                      cofinex ? Icon(Icons.check, color: Theme.of(context).indicatorColor, size: 20.0,): Icon(Icons.close, size: 20.0, color: Theme.of(context).primaryColor,),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Extra Lockup Benefits",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        " ",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CNX Lockup Rewards",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 5.0,),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child:  Text(
                              "Better rates and higher limits in Crypto Earn",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).accentColor,
                                  FontWeight.w400,
                                  'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),

                      Text(
                        "4%",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w700,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "1. Paid in CNX token to your CNX Wallet. Requires an ongoing CNX lockup.",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 10.0,),
                      Text(
                        "2. This offer is launched by Crypto.com independenly and there is no partnership between Crypto.com and merchants in this offer.",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 10.0,),
                      Text(
                        "This offer is only available to your first card and will expire 6 months after card activation. Crypto.com has the sole discretion to modify this offer at any time.",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 50.0,),
                Align(alignment: Alignment.center,child: Text(
                  "Other Information",
                  style: CustomWidget(context: context)
                      .CustomSizedTextStyle(
                      16.0,
                      Theme.of(context).cardColor,
                      FontWeight.w600,
                      'FontRegular'),
                  textAlign: TextAlign.center,
                ),),
                const SizedBox(height: 10.0,),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fees",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        " ",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Monthly Fee",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "No Charge",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).buttonColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Annual Fee",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "No Charge",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).buttonColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),

                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Fee",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "No Charge",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).buttonColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CNX Token Purchase Required",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        " ",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Purchase and hold €500 SGD worth of CNX tokens for 180 days to receive the Ruby Steel card.",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 10.0,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            showSuccessAlertDialog();
                          });
                        },
                        child: Text(
                          "Learn More",
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              14.0,
                              Theme.of(context).buttonColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Limits",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        " ",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Free ATM Limit",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "€800"+" SGD",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w700,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Card",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        " ",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Card Type",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "Platinum",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Material",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "Metal",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Contactless Payment",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Icon(Icons.check, color: Theme.of(context).indicatorColor, size: 20.0,),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pay anywhere VISA is accepted",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Icon(Icons.check, color: Theme.of(context).indicatorColor, size: 20.0,),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Crypto.com Visa Card Terms & Conditions",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        " ",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                ),
                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Terms & Conditions",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      Icon(Icons.chevron_right_rounded, color: Theme.of(context).accentColor, size: 22.0,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80.0,),
        ],
      ),
    );
  }

  Widget buyDetails(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  "Ruby Steel",
                  style: CustomWidget(context: context)
                      .CustomSizedTextStyle(
                      20.0,
                      Theme.of(context).primaryColor,
                      FontWeight.w700,
                      'FontRegular'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15.0,),
                Text(
                  "View Details",
                  style: CustomWidget(context: context)
                      .CustomSizedTextStyle(
                      12.0,
                      Theme.of(context).cardColor,
                      FontWeight.w600,
                      'FontRegular'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15.0,),
                Padding(padding: EdgeInsets.fromLTRB(35.0, 5.0, 35.0, 5.0), child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Color(0xff000000),
                        Color(0xff146b98),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15.0,),
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset("assets/images/crypto_currency.svg", color: Theme.of(context).backgroundColor, height: 100.0,),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          "assets/images/visaCard.svg",
                          height: 22.0,
                          width: 22.0,
                          alignment: Alignment.center,
                          matchTextDirection: false,
                        ),
                      ),
                    ],
                  ),
                ),),
                const SizedBox(height: 30.0,),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You have 1 more step to finish your card application",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            18.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 20.0,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lock_outline_rounded, size: 22.0, color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(width: 10.0,),
                          Text(
                            "Purches CNX & Hold for 180 days",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.credit_card_outlined, size: 22.0, color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(width: 10.0,),
                          Text(
                            "Accept Card Terms & Conditions",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.face_unlock_outlined, size: 22.0, color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(width: 10.0,),
                          Text(
                            "Name on Card",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  showSuccessAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)), //this right here
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                    colors: [CustomTheme.of(context).splashColor, CustomTheme.of(context).splashColor],
                    begin: Alignment.topRight,
                    //const FractionalOffset(0.0, 0.5),
                    end: Alignment.bottomLeft,
                    //const FractionalOffset(1.0, 0.6),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              height: MediaQuery.of(context).size.height * 0.30,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "CNX Token Purchase Required",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSansBold',
                      ),
                    ),
                    // Container(
                    //     margin: EdgeInsets.only(top: 7.0, bottom: 10.0),
                    //     height: 2.0,
                    //     color: CustomTheme.of(context).primaryColor
                    // ),
                    Text(
                      "CNX Token Purchase Required Purchase and hold \$500 SGD worth of CNX tokens for 180 days. After that, you can transfer your tokens back to your CRO account and continue to use your card fee-free, no strings attached.",
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    SizedBox(
                      child: GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.fromLTRB(10.0, 10.0, 15.0, 0.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "ok".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "OpenSansBold",
                                  color: CustomTheme.of(context).cardColor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
    // show the dialog
  }
}


