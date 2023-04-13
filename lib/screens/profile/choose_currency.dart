import 'package:cofinex/common/localization/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/theme/custom_theme.dart';
import '../wallet/deposite.dart';
import '../wallet/wallet_address.dart';

class Choose_Currency extends StatefulWidget {

  const Choose_Currency({Key? key}) : super(key: key);

  @override
  State<Choose_Currency> createState() => _Choose_CurrencyState();
}

class _Choose_CurrencyState extends State<Choose_Currency> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  ScrollController _scrollController = ScrollController();

  List list_name=[
    "Bitcoin","Tether","Cardano","Ethereum","Solana","Chainlink","Binance USD","Theta Network","Polygon","Ripple","Dogecoin"
  ];

  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

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
              .text("loc_choose"),
          style: CustomWidget(context: context).CustomSizedTextStyle(
              18.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 8.0, right: 20.0),
              child: InkWell(
                  onTap: () {
                   // Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10.0, 3.0, 10.0,3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).backgroundColor,
                        border: Border.all(width: 1.0,color: Theme.of(context).splashColor,)
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icon/search.svg",
                        height: 20.0,
                      ),
                    ),
                  ))),

        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color:  Theme.of(context).backgroundColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 15.0,20.0,0.0),
          child: Column(
            children: [
              Container(
                height: 35.0,
                decoration: BoxDecoration(
                    color: CustomTheme.of(context).errorColor,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: CustomTheme.of(context).splashColor)
                ),
                child:
                TabBar(
                  controller: _tabController,
                  labelStyle:CustomWidget(context: context)
                      .CustomSizedTextStyle(
                      13.0,
                      Theme.of(context).splashColor,
                      FontWeight.w600,
                      'FontRegular'),

                  labelColor: CustomTheme.of(context).splashColor,
                  unselectedLabelStyle:CustomWidget(context: context)
                      .CustomSizedTextStyle(
                      13.0,
                      Theme.of(context).splashColor,
                      FontWeight.w600,
                      'FontRegular'),

                  //<-- selected text color
                  unselectedLabelColor: CustomTheme.of(context)
                      .hintColor,
                  // isScrollable: true,
                  indicatorColor: CustomTheme.of(context).cardColor,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), // Creates border
                    color: CustomTheme.of(context).buttonColor,),
                  tabs: <Widget>[
                    Tab(
                      text: "Crypto",
                    ),
                    Tab(
                      text: "Fiat",
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  color: CustomTheme.of(context).backgroundColor,
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      currencyWidget(),
                      sampleWidget()
                      // spotList()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget currencyWidget(){
    return  Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ),
          color:  Theme.of(context).focusColor,
        ),
        child: ListView.builder(
          physics: ScrollPhysics(),
          itemCount: list_name.length,
          shrinkWrap: true,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Wallet_Address()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
                                    decoration: BoxDecoration(
                                      // border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Theme.of(context).highlightColor,
                                    ),
                                    child: SvgPicture.asset("assets/images/bit.svg", height: 22.0,),
                                  ),
                                  SizedBox(width: 8.0,),
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
                                      SizedBox(height: 6.0,),
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
                            InkWell(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Theme.of(context).accentColor,
                                size: 15.0,
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
                ),
                Container(
                  height: 1.0,
                  color: Theme.of(context).splashColor,
                )
              ],
            );
          },
        )
    );
  }

  Widget sampleWidget(){
    return  Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ),
          color:  Theme.of(context).focusColor,
        ),
        child: ListView.builder(
          physics: ScrollPhysics(),
          itemCount: list_name.length,
          shrinkWrap: true,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Deposite_Screen()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
                                    decoration: BoxDecoration(
                                      // border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Theme.of(context).highlightColor,
                                    ),
                                    child: SvgPicture.asset("assets/images/bit.svg", height: 22.0,),
                                  ),
                                  SizedBox(width: 8.0,),
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
                                      SizedBox(height: 6.0,),
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
                            InkWell(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Theme.of(context).accentColor,
                                size: 15.0,
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
                ),
                Container(
                  height: 1.0,
                  color: Theme.of(context).splashColor,
                )
              ],
            );
          },
        )
    );
  }
}
