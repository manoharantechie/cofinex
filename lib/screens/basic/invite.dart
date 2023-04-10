import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Invite_Screen extends StatefulWidget {
  const Invite_Screen({Key? key}) : super(key: key);

  @override
  State<Invite_Screen> createState() => _Invite_ScreenState();
}

class _Invite_ScreenState extends State<Invite_Screen> {
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
              .text("loc_invite"),
          style: CustomWidget(context: context).CustomSizedTextStyle(
              18.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color:  Theme.of(context).backgroundColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0,20.0,0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 10.0,),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 15.0, 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color:  Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: AppLocalizations.instance
                                      .text("loc_get"),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      22.0,
                                      Theme.of(context).focusColor,
                                      FontWeight.w700,
                                      'FontRegular'),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' 100 ',
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          22.0,
                                          Theme.of(context).buttonColor,
                                          FontWeight.w700,
                                          'FontRegular'),
                                    ),
                                    TextSpan(
                                      text: AppLocalizations.instance
                                          .text("loc_get_voucher"),
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          22.0,
                                          Theme.of(context).focusColor,
                                          FontWeight.w700,
                                          'FontRegular'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.0,),
                              Text(
                                AppLocalizations.instance.text("loc_get_txt"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).accentColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),flex: 2,),
                          SizedBox(height: 5.0,),
                          Flexible(child: Text(
                            "",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                12.0,
                                Theme.of(context).accentColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),flex: 1,)
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.0,),
                          Text(
                            AppLocalizations.instance.text("loc_reffer_head"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                18.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 15.0,),
                          Text(
                            AppLocalizations.instance.text("loc_reffer_txt"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).canvasColor,
                                FontWeight.w500,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 15.0,),
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
                                      AppLocalizations.instance.text("loc_reffer_id"),
                                      style: CustomWidget(context: context).CustomSizedTextStyle(
                                          8.0,
                                          Theme.of(context).canvasColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(height: 5.0,),
                                    Text(
                                      "bc2w-qkj7-834-jj0h-458h-dwawp-q034",
                                      style: CustomWidget(context: context).CustomSizedTextStyle(
                                          12.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
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
                          ),
                          SizedBox(height: 10.0,),
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
                                      AppLocalizations.instance.text("loc_reffer_link"),
                                      style: CustomWidget(context: context).CustomSizedTextStyle(
                                          8.0,
                                          Theme.of(context).canvasColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(height: 5.0,),
                                    Text(
                                      "https://crypto-merkulove/design-0010",
                                      style: CustomWidget(context: context).CustomSizedTextStyle(
                                          12.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                      textAlign: TextAlign.start,
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
                          ),
                          SizedBox(height: 25.0,),
                          Text(
                            AppLocalizations.instance.text("loc_reffer_txt1"),
                            style: CustomWidget(context: context).CustomSizedTextStyle(
                                12.0,
                                Theme.of(context).canvasColor,
                                FontWeight.w500,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 20.0,),

                          Text(
                            AppLocalizations.instance.text("loc_reffer_txt2"),
                            style: CustomWidget(context: context).CustomSizedTextStyle(
                                12.0,
                                Theme.of(context).canvasColor,
                                FontWeight.w500,
                                'FontRegular'),
                            textAlign: TextAlign.start,
                          ),


                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: InkWell(
                  onTap: (){
                    setState(() {
                      showInviteFriends();
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Theme.of(context).backgroundColor, ),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.instance.text("loc_invite"),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
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
    );
  }

  showInviteFriends() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
          ),
        ),
        barrierColor: Colors.white.withOpacity(0),
        backgroundColor: Theme.of(context).focusColor,
        enableDrag: true,
        context: context,
        builder: (BuildContext con) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter ssetState) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                    ),
                    color: Colors.transparent,
                  ),
                  padding: EdgeInsets.only(right: 15.0, left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8.0,),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            ssetState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 35.0,
                            height: 5.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Theme.of(context).hoverColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.instance.text("loc_invite"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(22.0, Theme.of(context).primaryColor,
                                  FontWeight.w700, 'FontRegular'),
                              textAlign: TextAlign.center,
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                            child: Text(
                              AppLocalizations.instance.text("loc_reffer_txt3"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(14.0, Theme.of(context).canvasColor,
                                  FontWeight.w500, 'FontRegular'),
                              textAlign: TextAlign.center,
                            ),),
                            SizedBox(
                              height: 25.0,
                            ),
                            SvgPicture.asset("assets/images/qr_code.svg", height: 240.0,),
                            SizedBox(
                              height: 25.0,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) => Verification_Screen()));
                              });
                            },
                            child: Container(
                              // margin: EdgeInsets.only(bottom: 15.0),
                              padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).buttonColor,
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: Theme.of(context).backgroundColor, ),
                              ),
                              child: Center(
                                child: Text(
                                  AppLocalizations.instance.text("loc_share"),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      14.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) => Verification_Screen()));
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 5.0),
                              padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).hintColor,
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: Theme.of(context).backgroundColor, ),
                              ),
                              child: Center(
                                child: Text(
                                  AppLocalizations.instance.text("loc_download"),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      14.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                ),
                              ),
                            ),
                          )

                        ],
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
