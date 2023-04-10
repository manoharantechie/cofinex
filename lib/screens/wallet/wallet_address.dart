import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Wallet_Address extends StatefulWidget {
  const Wallet_Address({Key? key}) : super(key: key);

  @override
  State<Wallet_Address> createState() => _Wallet_AddressState();
}

class _Wallet_AddressState extends State<Wallet_Address> {
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
                  Icons.arrow_back_ios_new,
                  color: Theme.of(context).bottomAppBarColor,
                ),
              ),)),

        title: Text(
          AppLocalizations.instance
              .text("loc_deposite")+" "+"BTC",
          style: CustomWidget(context: context).CustomSizedTextStyle(
              18.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color:  Theme.of(context).focusColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0,20.0,0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.instance.text("loc_wallet_address"),
                style: CustomWidget(context: context).CustomSizedTextStyle(
                    18.0,
                    Theme.of(context).primaryColor,
                    FontWeight.w600,
                    'FontRegular'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              SvgPicture.asset("assets/images/qr_code.svg", height: 280.0,),
              SizedBox(
                height: 25.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(width: 1.0,color: Theme.of(context).splashColor,)
                ),
                padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0,bottom: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.instance.text("loc_address"),
                          style: CustomWidget(context: context).CustomSizedTextStyle(
                              8.0,
                              Theme.of(context).canvasColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          "bc2wqkj78…458hdwq34",
                          style: CustomWidget(context: context).CustomSizedTextStyle(
                              12.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),flex: 3,),
                    Flexible(child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Theme.of(context).primaryColor,
                        ),
                        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                        child: Text(
                            AppLocalizations.instance.text("loc_copy"),
                          style: CustomWidget(context: context).CustomSizedTextStyle(
                              12.0,
                              Theme.of(context).focusColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),flex: 1,)

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
