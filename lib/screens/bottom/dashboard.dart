import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/localization/localizations.dart';
import 'package:cofinex/screens/basic/choose_currency.dart';
import 'package:cofinex/screens/basic/aml_check.dart';
import 'package:cofinex/screens/basic/exchange.dart';
import 'package:cofinex/screens/basic/leader_board.dart';
import 'package:cofinex/screens/dashboard/staking.dart';
import 'package:cofinex/screens/wallet/widthdraw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../basic/invite.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  ScrollController _scrollController = ScrollController();
  List grid_name=[
    "Widthdraw","Exchange","Staking","NFT","AML","Leaders","Invite","Support"
  ];

  List grid_img=["assets/images/withdraw.svg","assets/images/exchange.svg","assets/images/staking.svg","assets/images/nft.svg","assets/images/aml.svg","assets/images/cup.svg","assets/images/invite.svg","assets/images/mic.svg"

  ];
  List list_name=[
    "Bitcoin","Binance USD","Ethereum","Ripple"
  ];
  List list_img=["assets/images/bit.svg","assets/images/binance.svg","assets/images/eth.svg","assets/images/xrp.svg"

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 0.0,20.0,0.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color:  Theme.of(context).backgroundColor,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0,),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.instance.text("loc_actions"),
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          18.0,
                          Theme.of(context).primaryColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(width: 1.0,color: Theme.of(context).splashColor,),
                              color:  Theme.of(context).focusColor,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/deposite.svg",
                                        height: 25.0,
                                      ),
                                      SizedBox(
                                        width: 10.0,
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
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15.0,
                                  color: Theme.of(context).accentColor,
                                ),
                              ],
                            ),
                          ),flex: 1,),
                        SizedBox(width: 15.0,),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(width: 1.0,color: Theme.of(context).splashColor,),
                              color:  Theme.of(context).focusColor,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/crypco.svg",
                                        height: 25.0,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        AppLocalizations.instance
                                            .text("loc_buy_cryp"),
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
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15.0,
                                  color: Theme.of(context).accentColor,
                                ),
                              ],
                            ),
                          ),flex: 1,)
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        controller: _scrollController,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        // physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 8,
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: (){

                              if(index==5)
                                {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Leader_Board_Screen()));
                                }
                              else if(index==6)
                                {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Invite_Screen()));

                                }
                              else if(index==4)
                              {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Aml_Check_Screen()));

                              }
                              else if(index==1)
                              {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Exchange_Screen()));

                              }


                            },
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 5.0, bottom: 5.0, right: 12.0, left: 12.0),
                                decoration: BoxDecoration(
                                  color:  Theme.of(context).focusColor,
                                  border: Border.all(width: 1.0,color: Theme.of(context).splashColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      grid_img[index].toString(),
                                      height: 25.0,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      // AppLocalizations.instance.text("loc_widthdraw"),
                                      grid_name[index].toString(),
                                      style: CustomWidget(context: context).CustomSizedTextStyle(
                                          10.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0,),

              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 15.0, 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color:  Theme.of(context).primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   Row(children: [
                     Flexible(child:  Text(
                       "Get rewarded up to 4030 USDT for signing up!",
                       style: CustomWidget(context: context)
                           .CustomSizedTextStyle(
                           22.0,
                           Theme.of(context).focusColor,
                           FontWeight.w600,
                           'FontRegular'),
                       textAlign: TextAlign.start,
                     ),flex: 2,),
                     Flexible(child: Container(),flex: 1,),
                   ],),
                    SizedBox(height: 15.0,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color:  Theme.of(context).buttonColor,
                      ),
                      child: Center(
                        child:  Text(
                          AppLocalizations.instance.text("loc_signup"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              14.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0,),

                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "Top Cryptocurency",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        18.0,
                        Theme.of(context).primaryColor,
                        FontWeight.w600,
                        'FontRegular'),
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    children: [
                      Text(
                        "See All",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 3.0,),
                      Container(
                        width: 50,
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                    physics: ScrollPhysics(),
                    itemCount: list_name.length,
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
                                              borderRadius: BorderRadius.circular(10.0),
                                              color: Theme.of(context).highlightColor,
                                            ),
                                            child: SvgPicture.asset("assets/images/bit.svg", height: 25.0,),
                                          ),
                                          SizedBox(width: 5.0,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                list_name[index].toString(),
                                                style: CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                    14.0,
                                                    Theme.of(context).primaryColor,
                                                    FontWeight.w600,
                                                    'FontRegular'),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(height: 8.0,),
                                              Text(
                                                "BTC",
                                                style: CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                    12.0,
                                                    Theme.of(context).canvasColor,
                                                    FontWeight.w500,
                                                    'FontRegular'),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SvgPicture.asset(index%2==0?'assets/icon/graph_success.svg':'assets/icon/graph_fail.svg'),


                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "0.1832",
                                            style: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                14.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 8.0,),
                                          Row(
                                            children: [
                                              Text(
                                                "1.0%",
                                                style: CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                    12.0,
                                                    index%2==0?Theme.of(context).indicatorColor:Theme.of(context).scaffoldBackgroundColor,
                                                    FontWeight.w600,
                                                    'FontRegular'),
                                                textAlign: TextAlign.center,
                                              ),

                                            ],
                                          )
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1.0,
                            color: Theme.of(context).splashColor,
                          )
                        ],
                      );
                    },
                  )
              ),
              SizedBox(height: 30.0,),

            ],
          ),
        ),
      ),
    );
  }
}
