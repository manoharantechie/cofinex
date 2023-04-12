import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Verification_Final extends StatefulWidget {
  const Verification_Final({Key? key}) : super(key: key);

  @override
  State<Verification_Final> createState() => _Verification_FinalState();
}

class _Verification_FinalState extends State<Verification_Final> {
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
              SizedBox(height: 80.0,),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(15.0, 50, 15.0, 50.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.instance
                          .text("loc_cong"),
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          18.0,
                          Theme.of(context).focusColor,
                          FontWeight.w600,
                          'FontRegular'),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      AppLocalizations.instance
                          .text("loc_verified_kyc"),
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).focusColor,
                          FontWeight.w600,
                          'FontRegular'),
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
