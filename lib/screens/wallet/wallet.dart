import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Wallet_Screen extends StatefulWidget {
  const Wallet_Screen({Key? key}) : super(key: key);

  @override
  State<Wallet_Screen> createState() => _Wallet_ScreenState();
}

class _Wallet_ScreenState extends State<Wallet_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        leading: Padding(
            padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
            child: InkWell(
                onTap: () {
                  // Navigator.push(context,MaterialPageRoute(builder:(context)=> Home_Screen()));
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).bottomAppBarColor,
                ),)),
        title: Text(
          AppLocalizations.instance
              .text("loc_wallet"),
          style: CustomWidget(context: context).CustomSizedTextStyle(
              18.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        ),
        centerTitle: true,
        actions: [
          Padding(
              padding: EdgeInsets.only(left: 0.0, top: 5.0, bottom: 5.0, right: 20.0),
              child: InkWell(
                  onTap: () {
                    // Navigator.push(context,MaterialPageRoute(builder:(context)=> Home_Screen()));
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).backgroundColor,
                        border: Border.all(width: 1.0,color: Theme.of(context).splashColor,)
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/images/mic.svg",
                        color: Theme.of(context).bottomAppBarColor,
                        height: 20.0,
                      ),
                    ),
                  ))),

        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 0.0,20.0,0.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color:  Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 15.0, 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color:  Theme.of(context).primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.instance.text("loc_tot_asset"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        12.0,
                        Theme.of(context).accentColor,
                        FontWeight.w600,
                        'FontRegular'),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15.0,),
                  Row(
                    children: [
                      Text(
                        "2,460.89",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            22.0,
                            Theme.of(context).focusColor,
                            FontWeight.w700,
                            'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        "USD",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Row(
                    children: [
                      Text(
                        "0.23415600",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).focusColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        "BTC",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              child: Row(
                children: [
                  Flexible(child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 1.0,color: Theme.of(context).splashColor,)
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/images/deposite.svg",
                          height: 25.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          AppLocalizations.instance
                              .text("loc_deposite"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              12.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),flex: 1,),
                  SizedBox(width: 10.0,),
                  Flexible(child: Container(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 1.0,color: Theme.of(context).splashColor,)
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/images/withdraw.svg",
                          height: 25.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          AppLocalizations.instance
                              .text("loc_widthdraw"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              12.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),flex: 1,),
                  SizedBox(width: 10.0,),
                  Flexible(child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 1.0,color: Theme.of(context).splashColor,)
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/images/exchange.svg",
                          height: 25.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          AppLocalizations.instance
                              .text("loc_exchange"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              12.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),flex: 1,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
