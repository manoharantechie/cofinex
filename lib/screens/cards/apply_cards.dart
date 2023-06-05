import 'package:cofinex/screens/dashboard/card_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_switch.dart';
import '../../common/custom_widget.dart';
import '../../common/theme/custom_theme.dart';
import 'dart:math' as math;
class ApplyCard extends StatefulWidget {
  const ApplyCard({Key? key}) : super(key: key);

  @override
  State<ApplyCard> createState() => _ApplyCardState();
}

class _ApplyCardState extends State<ApplyCard> {
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

            cardSetup(),

            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Card_Details_Screen()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
                  padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
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
                    color: Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
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
                    color: Theme.of(context).unselectedWidgetColor.withOpacity(0.3),
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


}
