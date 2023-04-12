import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class GiftCard_Details extends StatefulWidget {
  const GiftCard_Details({Key? key}) : super(key: key);

  @override
  State<GiftCard_Details> createState() => _GiftCard_DetailsState();
}

class _GiftCard_DetailsState extends State<GiftCard_Details> {
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
          AppLocalizations.instance.text("loc_gift_card"),
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
    );
  }
}
