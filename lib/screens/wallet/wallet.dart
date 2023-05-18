import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/data_model/graph_ql_utils.dart';
import 'package:cofinex/data_model/model/ticker_data_model.dart';
import 'package:cofinex/data_model/model/wallet_details.dart';
import 'package:cofinex/data_model/query_utils.dart';
import 'package:cofinex/screens/basic/register.dart';
import 'package:cofinex/screens/basic/signin.dart';
import 'package:cofinex/screens/dashboard/exchange.dart';
import 'package:cofinex/screens/profile/choose_currency.dart';
import 'package:cofinex/screens/wallet/widthdraw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Wallet_Screen extends StatefulWidget {
  const Wallet_Screen({Key? key}) : super(key: key);

  @override
  State<Wallet_Screen> createState() => _Wallet_ScreenState();
}

class _Wallet_ScreenState extends State<Wallet_Screen> {
  ScrollController _scrollController = ScrollController();

  bool checkHide = false;

  bool loading = false;
  List<WalletDetails> allTicker = [];

  GraphAPIUtils qlapiUtils = GraphAPIUtils();

  String token = "";

  bool loginStatus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  getDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      loginStatus = preferences.getBool("login")!;
      print(loginStatus);
      if (loginStatus) {

        loading = true;

        fillList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).backgroundColor,
          child: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 15.0, 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage("assets/icon/back.png"),
                          fit: BoxFit.cover,
                        ),
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
                                Theme.of(context).errorColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "0.000000",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    22.0,
                                    Theme.of(context).errorColor,
                                    FontWeight.w700,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
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
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "0.000000",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(context).errorColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                if (loginStatus) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Choose_Currency()));
                                } else {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Register()));
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding:
                                EdgeInsets.fromLTRB(5.0, 12.0, 5.0, 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Theme.of(context).splashColor,
                                  ),
                                  color: Theme.of(context).focusColor,
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/deposite.svg",
                                      height: 25.0,
                                      color:
                                      Theme.of(context).bottomAppBarColor,
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
                              ),
                            ),
                            flex: 1,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                if (loginStatus) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          Widthdraw_Screen()));
                                } else {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Sign_In_Screen()));
                                }
                              },
                              child: Container(
                                padding:
                                EdgeInsets.fromLTRB(5.0, 12.0, 5.0, 12.0),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Theme.of(context).splashColor,
                                  ),
                                  color: Theme.of(context).focusColor,
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/withdraw.svg",
                                      height: 25.0,
                                      color:
                                      Theme.of(context).bottomAppBarColor,
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
                              ),
                            ),
                            flex: 1,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Exchange_Screen()));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding:
                                EdgeInsets.fromLTRB(5.0, 12.0, 5.0, 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Theme.of(context).splashColor,
                                  ),
                                  color: Theme.of(context).focusColor,
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/exchange.svg",
                                      height: 25.0,
                                      color:
                                      Theme.of(context).bottomAppBarColor,
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
                              ),
                            ),
                            flex: 1,
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Theme(
                            data: ThemeData(
                              primarySwatch: Colors.cyan,
                              unselectedWidgetColor: Colors.grey, // Your color
                            ),
                            child: Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              value: checkHide,
                              checkColor: Theme.of(context).focusColor,
                              onChanged: (bool? value) {
                                setState(() {
                                  checkHide = value!;
                                });
                              },
                            )),
                        Text(
                          AppLocalizations.instance.text("loc_hide_bal"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              10.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w500,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.34),
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        allTicker.length > 0
                            ?      Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: allTicker.length > 0
                                        ? Theme.of(context).splashColor
                                        : Theme.of(context).backgroundColor,
                                    width: 1.0),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                ),
                                color: Theme.of(context).focusColor),
                            child:  ListView.builder(
                              physics: ScrollPhysics(),
                              itemCount: allTicker.length,
                              shrinkWrap: true,
                              controller: _scrollController,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                String coinImage =
                                allTicker[index].token.toString();
                                return Column(
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width,
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              15.0, 10.0, 15.0, 0.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Container(
                                                          width: 40,
                                                          height: 40,
                                                          padding:
                                                          EdgeInsets
                                                              .all(
                                                              8.0),
                                                          decoration:
                                                          BoxDecoration(
                                                            border: Border.all(
                                                                color: Theme.of(
                                                                    context)
                                                                    .splashColor,
                                                                width:
                                                                1.0),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                10.0),
                                                            color: Theme.of(
                                                                context)
                                                                .highlightColor,
                                                          ),
                                                          child: SvgPicture
                                                              .network(
                                                            "https://images.cofinex.io/crypto/ico/" +
                                                                coinImage
                                                                    .toLowerCase() +
                                                                ".svg",
                                                            height: 15.0,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5.0,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            Text(
                                                              coinImage,
                                                              style: CustomWidget(context: context).CustomSizedTextStyle(
                                                                  14.0,
                                                                  Theme.of(context)
                                                                      .primaryColor,
                                                                  FontWeight
                                                                      .w600,
                                                                  'FontRegular'),
                                                              textAlign:
                                                              TextAlign
                                                                  .center,
                                                            ),
                                                            SizedBox(
                                                              height: 8.0,
                                                            ),
                                                            Text(
                                                              coinImage,
                                                              style: CustomWidget(context: context).CustomSizedTextStyle(
                                                                  12.0,
                                                                  Theme.of(context)
                                                                      .canvasColor,
                                                                  FontWeight
                                                                      .w500,
                                                                  'FontRegular'),
                                                              textAlign:
                                                              TextAlign
                                                                  .center,
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .end,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                          allTicker[index]
                                                              .balance
                                                              .toString(),
                                                          style: CustomWidget(
                                                              context:
                                                              context)
                                                              .CustomSizedTextStyle(
                                                              14.0,
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                              FontWeight
                                                                  .w600,
                                                              'FontRegular'),
                                                          textAlign:
                                                          TextAlign
                                                              .center,
                                                        ),
                                                        SizedBox(
                                                          height: 8.0,
                                                        ),
                                                        // Row(
                                                        //   children: [
                                                        //     Text(
                                                        //       " \$ " +
                                                        //           double.parse(
                                                        //               allTicker[index]
                                                        //                   .marketPrice
                                                        //                   .toString())
                                                        //               .toStringAsFixed(2),
                                                        //       style: CustomWidget(
                                                        //           context: context)
                                                        //           .CustomSizedTextStyle(
                                                        //           12.0,
                                                        //           Theme.of(context)
                                                        //               .canvasColor,
                                                        //           FontWeight.w500,
                                                        //           'FontRegular'),
                                                        //       textAlign: TextAlign.center,
                                                        //     ),
                                                        //     SizedBox(
                                                        //       width: 2.0,
                                                        //     ),
                                                        //     Text(
                                                        //       coinImage1,
                                                        //       style: CustomWidget(
                                                        //           context: context)
                                                        //           .CustomSizedTextStyle(
                                                        //           12.0,
                                                        //           Theme.of(context)
                                                        //               .canvasColor,
                                                        //           FontWeight.w500,
                                                        //           'FontRegular'),
                                                        //       textAlign: TextAlign.center,
                                                        //     ),
                                                        //   ],
                                                        // )
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
                                        )),
                                    Container(
                                      height: 1.0,
                                      color:
                                      Theme.of(context).splashColor,
                                    )
                                  ],
                                );
                              },
                            )
                        ): Container(
                            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
                            height: MediaQuery.of(context).size.height *
                                0.3,
                            decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                " No records Found..!",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    16.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w500,
                                    'FontRegular'),
                              ),
                            )),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  )),
              loading
                  ? CustomWidget(context: context).loadingIndicator(
                CustomTheme.of(context).buttonColor,
              )
                  : Container()
            ],
          )),
    ));
  }

  fillList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    QueryMutation queryMutation = QueryMutation();

    GraphQLClient _client = qlapiUtils
        .clientSecondToQuery(preferences.getString("token").toString());
    QueryResult result = await _client.query(
      QueryOptions(document: gql(queryMutation.getWalletBalance())),
    );
    List<dynamic> listData = result.data!["getAllWalletBalances"]["items"];

    print(listData.length);
    setState(() {
      loading = false;
      allTicker =
          (listData).map((item) => WalletDetails.fromJson(item)).toList();

    });
  }
}
