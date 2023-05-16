import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';

class Card_Details_Screen extends StatefulWidget {
  const Card_Details_Screen({Key? key}) : super(key: key);

  @override
  State<Card_Details_Screen> createState() => _Card_Details_ScreenState();
}

class _Card_Details_ScreenState extends State<Card_Details_Screen> {
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
          "Your'e Applying For",
          style: CustomWidget(context: context).CustomSizedTextStyle(18.0,
              Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0), child: Container(
                      padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Theme.of(context).buttonColor.withOpacity(0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset("assets/images/logo-apple.svg", color: Theme.of(context).backgroundColor, height: 100.0,),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              "assets/images/visaCard.png",
                              height: 40.0,
                              width: 40.0,
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
                  ],
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {

                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
                    padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        "This is Your Current Card",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).focusColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    )
    );
  }
}
