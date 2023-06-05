import 'package:cofinex/common/localization/localizations.dart';
import 'package:cofinex/data_model/api_utils.dart';
import 'package:cofinex/data_model/model/currency_list_model.dart';
import 'package:cofinex/data_model/model/network_list_model.dart';
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

class _Choose_CurrencyState extends State<Choose_Currency>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScrollController _scrollController = ScrollController();
  APIUtils apiUtils = APIUtils();
  bool loading = false;

  List<CurrencyList> cyrptoCurrecy = [];
  List<CurrencyList> fiatCurrecy = [];
  List<NetworkList> networkList = [];

  List<String> coinNet=[];
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    loading = true;
    getCurrency();
    getNetworks();
  }

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
                  Icons.arrow_back_ios_new,
                  color: Theme.of(context).bottomAppBarColor,
                ),
              ),
            )),
        title: Text(
          AppLocalizations.instance.text("loc_choose"),
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
                        "assets/icon/search.svg",
                        height: 20.0,
                        color: Theme.of(context).secondaryHeaderColor,
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
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
          child: Column(
            children: [
              Container(
                height: 35.0,
                decoration: BoxDecoration(
                    color: CustomTheme.of(context).errorColor,
                    borderRadius: BorderRadius.circular(15.0),
                    border:
                    Border.all(color: CustomTheme.of(context).splashColor)),
                child: TabBar(
                  controller: _tabController,
                  labelStyle: CustomWidget(context: context)
                      .CustomSizedTextStyle(13.0, Theme.of(context).splashColor,
                      FontWeight.w600, 'FontRegular'),

                  labelColor: CustomTheme.of(context).splashColor,
                  unselectedLabelStyle: CustomWidget(context: context)
                      .CustomSizedTextStyle(13.0, Theme.of(context).splashColor,
                      FontWeight.w600, 'FontRegular'),

                  //<-- selected text color
                  unselectedLabelColor: CustomTheme.of(context).hintColor,
                  // isScrollable: true,
                  indicatorColor: CustomTheme.of(context).cardColor,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), // Creates border
                    color: CustomTheme.of(context).primaryColorLight,
                  ),
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
                      loading
                          ? CustomWidget(context: context).loadingIndicator(
                        CustomTheme.of(context).primaryColorLight,
                      )
                          : currencyWidget(),
                      loading
                          ? CustomWidget(context: context).loadingIndicator(
                        CustomTheme.of(context).primaryColorLight,
                      )
                          : fiatWidget()
                      // spotList()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget currencyWidget() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ),
          color: Theme.of(context).focusColor,
        ),
        child: ListView.builder(
          physics: ScrollPhysics(),
          itemCount: cyrptoCurrecy.length,
          shrinkWrap: true,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Wallet_Address(
                          coin:cyrptoCurrecy[index].symbol.toString() ,
                          network: cyrptoCurrecy[index].networktype.toString(),
                        )));
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
                                    width: 40,
                                    height: 40,
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context).splashColor,
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Theme.of(context).highlightColor,
                                    ),
                                    child: SvgPicture.network(
                                      "https://images.cofinex.io/crypto/ico/" +
                                          cyrptoCurrecy[index]
                                              .symbol
                                              .toString()
                                              .toLowerCase() +
                                          ".svg",
                                      height: 15.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        cyrptoCurrecy[index].name.toString(),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                14.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        cyrptoCurrecy[index].symbol.toString(),
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
                                color: Theme.of(context).unselectedWidgetColor,
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
        ));
  }

  Widget fiatWidget() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ),
          color: Theme.of(context).focusColor,
        ),
        child: ListView.builder(
          physics: ScrollPhysics(),
          itemCount: fiatCurrecy.length,
          shrinkWrap: true,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => Wallet_Address(
                    //       coin:fiatCurrecy[index].symbol.toString() ,
                    //       network: fiatCurrecy[index].networktype.toString(),
                    //     )));
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
                                    width: 40,
                                    height: 40,
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context).splashColor,
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Theme.of(context).highlightColor,
                                    ),
                                    child: SvgPicture.network(
                                      "https://images.cofinex.io/crypto/ico/" +
                                          fiatCurrecy[index]
                                              .symbol
                                              .toString()
                                              .toLowerCase() +
                                          ".svg",
                                      height: 15.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        fiatCurrecy[index].name.toString(),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                14.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        fiatCurrecy[index].symbol.toString(),
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
                                color: Theme.of(context).unselectedWidgetColor,
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
        ));
  }

  getCurrency() {
    apiUtils.getAllCurrency().then((CurrencyListModel loginData) {
      setState(() {
        if (loginData.status!) {
          loading = false;
          List<CurrencyList> listV = loginData.data!;
          for (int m = 0; m < listV.length; m++) {
            if (listV[m].cryptotype.toString().toLowerCase() == "crypto") {
              cyrptoCurrecy.add(listV[m]);
            } else {
              fiatCurrecy.add(listV[m]);
            }
          }
          print(cyrptoCurrecy.length);
          cyrptoCurrecy=cyrptoCurrecy.toSet().toList();
          print(cyrptoCurrecy.length);
        } else {
          fiatCurrecy = [];
          loading = false;
          cyrptoCurrecy = [];
        }
      });
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }

  getNetworks() {
    apiUtils.getAllNetworks().then((NetworkListModel loginData) {
      setState(() {
        if (loginData.status!) {
          loading = false;
          networkList = loginData.data!;
        } else {
          fiatCurrecy = [];
          loading = false;
          cyrptoCurrecy = [];
        }
      });
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }
}
