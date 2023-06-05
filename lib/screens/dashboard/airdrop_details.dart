import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class AirdropDetails extends StatefulWidget {
  const AirdropDetails({Key? key}) : super(key: key);

  @override
  State<AirdropDetails> createState() => _AirdropDetailsState();
}

class _AirdropDetailsState extends State<AirdropDetails> {
  ScrollController _scrollController = ScrollController();
  ScrollController controller = ScrollController();

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
          AppLocalizations.instance.text("loc_air"),
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
          child: SingleChildScrollView(
            controller: controller,
            child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 10.0, right: 15.0, left: 15.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/back2.png"),
                          fit: BoxFit.cover,
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: Image.asset(
                              "assets/images/airdrop.png",
                            ),
                            flex: 1,
                          ),
                          Flexible(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Embark on an adventure with Arbitrum and Cofinex Wallet",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).errorColor,
                                        FontWeight.w800,
                                        'FontRegular'),
                                  ),
                                  SizedBox(
                                    height: 3.0,
                                  ),
                                  Text(
                                    "Arbitrum Airdrop Extravaganza Campaign",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        18.0,
                                        Theme.of(context).errorColor,
                                        FontWeight.w700,
                                        'FontRegular'),
                                  ),
                                  SizedBox(
                                    height: 3.0,
                                  ),
                                  Text(
                                    "On Going",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        8.0,
                                        Theme.of(context).primaryColorLight,
                                        FontWeight.w800,
                                        'FontRegular'),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Prize #1: Exclusive",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).errorColor,
                                        FontWeight.w800,
                                        'FontRegular'),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Airdrop ',
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          12.0,
                                          Theme.of(context).errorColor,
                                          FontWeight.w800,
                                          'FontRegular'),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '\$10000',
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              12.0,
                                              Theme.of(context).primaryColorLight,
                                              FontWeight.w800,
                                              'FontRegular'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icon/share.svg",
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            SvgPicture.asset(
                                                "assets/images/gift.svg"),
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ),
                            flex: 2,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SingleChildScrollView(
                      controller: controller,
                      child: ListView.builder(
                        itemCount: 15,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        controller: controller,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .canvasColor
                                          .withOpacity(0.5),
                                    )),
                                child: Column(
                                  children: [
                                    Theme(
                                      data: Theme.of(context).copyWith(
                                          dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        key: PageStorageKey(index.toString()),
                                        title: Column(

                                          children: [
                                            Text(
                                              "Prize #" +
                                                  (index+1).toString() +
                                                  " : ARB Earn Giveaway (\$10,000)",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  16.0,
                                                  Theme.of(context)
                                                      .primaryColor,
                                                  FontWeight.w700,
                                                  'FontRegular'),
                                              softWrap: true,
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              "(Finished)",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  10.0,
                                                  Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.5),
                                                  FontWeight.w400,
                                                  'FontRegular'),
                                              softWrap: true,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                        ),
                                        children: [
                                          Column(

                                            children: [
                                              Container(
                                                child: Flexible(
                                                  child: Text(
                                                    "New users of CofinexWallet Earn who meet the requirements will share \$10,000 worth of ARB rewards during the event! Guaranteed prize for participation, prize amount randomized.",
                                                    style: CustomWidget(
                                                        context: context)
                                                        .CustomTextStyle(
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w400,
                                                        'FontRegular'),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.only(
                                                    left: 10.0, right: 10.0),
                                              ),
                                              const SizedBox(
                                                height: 8.0,
                                              ),

                                              Container(

                                                child: Text(
                                                  "Duration:",
                                                  style: CustomWidget(
                                                      context: context)
                                                      .CustomTextStyle(
                                                      Theme.of(context)
                                                          .primaryColor,
                                                      FontWeight.w500,
                                                      'FontRegular'),
                                                  softWrap: true,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                ),
                                                width: MediaQuery.of(context).size.width,
                                                padding:  EdgeInsets.only(left: 10.0),
                                              ),
                                              const SizedBox(
                                                height: 8.0,
                                              ),

                                              Container(

                                                child: Text(
                                                  "- March 27, 20:00 - April 9, 20:00 (UTC+8)",
                                                  style: CustomWidget(
                                                      context: context)
                                                      .CustomSizedTextStyle(
                                                      10.0,
                                                      Theme.of(context)
                                                          .primaryColor,
                                                      FontWeight.w400,
                                                      'FontRegular'),
                                                  softWrap: true,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                ),
                                                width: MediaQuery.of(context).size.width,
                                                padding:  EdgeInsets.only(left: 10.0),
                                              ),

                                              const SizedBox(
                                                height: 15.0,
                                              ),
                                              InkWell(
                                                child: Container(

                                                  margin: EdgeInsets.only(
                                                      left: 15.0, right: 15.0),
                                                  padding: EdgeInsets.only(
                                                      top: 7.0, bottom:7.0),
                                                  child: Center(
                                                    child: Text(
                                                      "Go earning",
                                                      style: CustomWidget(
                                                          context: context)
                                                          .CustomSizedTextStyle(
                                                          14.0,Theme.of(
                                                          context)
                                                          .focusColor,
                                                          FontWeight.w600,
                                                          'FontRegular'),
                                                      softWrap: true,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                      border: Border.all(
                                                        color: Theme.of(context)
                                                            .primaryColorLight,
                                                      ),
                                                      color: Theme.of(context)
                                                          .primaryColorLight),
                                                  width: MediaQuery.of(context).size.width*0.5,
                                                ),
                                                onTap: () {
                                                  // Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                        ],
                                        trailing: Container(
                                          width: 1.0,
                                          height: 10.0,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),

                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                          );
                        },
                      ),
                    )
                  ],
                )),
          )
      ),
    ));
  }
}
