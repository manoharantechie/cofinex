import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Notification_Screen extends StatefulWidget {
  const Notification_Screen({Key? key}) : super(key: key);

  @override
  State<Notification_Screen> createState() => _Notification_ScreenState();
}

class _Notification_ScreenState extends State<Notification_Screen> {

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
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
              .text("loc_notify"),
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
          child: ListView.builder(
            physics: ScrollPhysics(),
            itemCount: 10,
            shrinkWrap: true,
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15.0,),
                  Text(
                    "Today",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        11.0,
                        Theme.of(context).canvasColor,
                        FontWeight.w600,
                        'FontRegular'),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0, top: 18.0, bottom: 18.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                              width: 6.0,
                              height: 6.0,

                            )),
                            SizedBox(width: 8.0,),
                            Flexible(child: Text(
                              "Withdraw Successful",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                              textAlign: TextAlign.center,
                            ),flex: 1,)
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          "You have successful withdraw 243.44870000 WLKN from your account. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare. Et malesuada fames ac turpis egestas maecenas pharetra convallis",
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              12.0,
                              Theme.of(context).canvasColor,
                              FontWeight.w500,
                              'FontRegular'),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0,),
                ],
              );
            },
          ),

        ),
      ),
    ));
  }
}
