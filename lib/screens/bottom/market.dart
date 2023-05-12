import 'dart:convert';

import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/data_model/api_utils.dart';
import 'package:cofinex/data_model/graph_ql_utils.dart';
import 'package:cofinex/data_model/model/ticker_data_model.dart';
import 'package:cofinex/data_model/query_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  ScrollController _scrollController = ScrollController();
  APIUtils apiUtils = APIUtils();


  bool loading = false;
  List<AllTicker> allTicker = [];

  GraphAPIUtils qlapiUtils = GraphAPIUtils();

  String token = "";

  IOWebSocketChannel? channelOpenOrder;
  bool loginStatus=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3);

    getDetails();


  }
  getDetails()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    setState(() {

      loginStatus=preferences.getBool("login")!;
      if(loginStatus)
        {
          loading = true;

          fillList();
        }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme
          .of(context)
          .backgroundColor,
      body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: CustomTheme
              .of(context)
              .backgroundColor,
          child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 35.0,
                        decoration: BoxDecoration(
                            color: CustomTheme
                                .of(context)
                                .focusColor,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                                color: CustomTheme
                                    .of(context)
                                    .accentColor,
                                width: 1.0)),
                        child: TabBar(
                          controller: _tabController,
                          labelStyle: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              13.0,
                              Theme
                                  .of(context)
                                  .accentColor,
                              FontWeight.w600,
                              'FontRegular'),

                          labelColor: CustomTheme
                              .of(context)
                              .primaryColor,
                          //<-- selected text color
                          unselectedLabelColor: CustomTheme
                              .of(context)
                              .primaryColor
                              .withOpacity(0.5),
                          // isScrollable: true,
                          indicatorColor: CustomTheme
                              .of(context)
                              .cardColor,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            // Creates border
                            color: CustomTheme
                                .of(context)
                                .buttonColor,
                          ),
                          tabs: <Widget>[
                            Tab(
                              text: "Favourites",
                            ),
                            Tab(
                              text: "Coins",
                            ),
                            Tab(
                              text: "Zones",
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          color: CustomTheme
                              .of(context)
                              .backgroundColor,
                          child: TabBarView(
                            controller: _tabController,
                            children: <Widget>[
                              favWidget(),
                              coinWidget(),
                              zonesWidget()
                              // spotList()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  loading
                      ? CustomWidget(context: context).loadingIndicator(
                    CustomTheme
                        .of(context)
                        .buttonColor,
                  )
                      : Container()
                ],
              ))),
    );
  }

  Widget favWidget() {
    return Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // Add one stop for each color
                // Values should increase from 0.0 to 1.0
                stops: [
                  0.1,
                  0.5,
                  0.9,
                ],
                colors: [
                  Theme
                      .of(context)
                      .backgroundColor,
                  Theme
                      .of(context)
                      .backgroundColor,
                  Theme
                      .of(context)
                      .backgroundColor,
                ])),
        child: Center(
          child: Text(
            " No records Found..!",
            style: CustomWidget(context: context).CustomSizedTextStyle(16.0,
                Theme
                    .of(context)
                    .primaryColor, FontWeight.w500, 'FontRegular'),
          ),
        ));
    // return  Container(
    //     child: ListView.builder(
    //   physics: ScrollPhysics(),
    //   itemCount: list_name.length,
    //   shrinkWrap: true,
    //   controller: _scrollController,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Column(
    //       children: [
    //         Container(
    //           width: MediaQuery.of(context).size.width,
    //           padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
    //           decoration: BoxDecoration(
    //               border: Border.all(
    //                   color: Theme.of(context).splashColor, width: 1.0),
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(15.0),
    //                 topRight: Radius.circular(15.0),
    //                 bottomRight: Radius.circular(15.0),
    //                 bottomLeft: Radius.circular(15.0),
    //               ),
    //               color: Theme.of(context).focusColor),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Flexible(
    //                     child: Container(
    //                       child: Row(
    //                         crossAxisAlignment: CrossAxisAlignment.center,
    //                         children: [
    //                           SvgPicture.asset("assets/icon/fav.svg"),
    //                           const SizedBox(
    //                             width: 10.0,
    //                           ),
    //                           Container(
    //                             padding:
    //                                 EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
    //                             decoration: BoxDecoration(
    //                               border: Border.all(
    //                                   color: Theme.of(context).splashColor,
    //                                   width: 1.0),
    //                               borderRadius: BorderRadius.circular(10.0),
    //                               color: Theme.of(context).highlightColor,
    //                             ),
    //                             child: SvgPicture.asset(
    //                               "assets/images/bit.svg",
    //                               height: 25.0,
    //                             ),
    //                           ),
    //                           Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             children: [
    //                               Text(
    //                                 list_name[index].toString(),
    //                                 style: CustomWidget(context: context)
    //                                     .CustomSizedTextStyle(
    //                                         12.0,
    //                                         Theme.of(context).primaryColor,
    //                                         FontWeight.w600,
    //                                         'FontRegular'),
    //                                 textAlign: TextAlign.center,
    //                               ),
    //                               SizedBox(
    //                                 height: 8.0,
    //                               ),
    //                               Text(
    //                                 "BTC",
    //                                 style: CustomWidget(context: context)
    //                                     .CustomSizedTextStyle(
    //                                         12.0,
    //                                         Theme.of(context).canvasColor,
    //                                         FontWeight.w500,
    //                                         'FontRegular'),
    //                                 textAlign: TextAlign.center,
    //                               ),
    //                             ],
    //                           )
    //                         ],
    //                       ),
    //                     ),
    //                     flex: 2,
    //                   ),
    //                   Flexible(
    //                     child: Text(
    //                       " \$ 123.12",
    //                       style: CustomWidget(context: context)
    //                           .CustomSizedTextStyle(
    //                               12.0,
    //                               Theme.of(context).primaryColor,
    //                               FontWeight.w600,
    //                               'FontRegular'),
    //                       textAlign: TextAlign.center,
    //                     ),
    //                   ),
    //                   Container(
    //                       decoration: BoxDecoration(
    //                           color: index % 2 == 0
    //                               ? Theme.of(context).indicatorColor
    //                               : Theme.of(context).scaffoldBackgroundColor,
    //                           borderRadius: BorderRadius.circular(5.0)),
    //                       padding: EdgeInsets.only(
    //                           left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
    //                       child: Center(
    //                         child: Text(
    //                           "0.1832",
    //                           style: CustomWidget(context: context)
    //                               .CustomSizedTextStyle(
    //                                   10.0,
    //                                   Theme.of(context).focusColor,
    //                                   FontWeight.w600,
    //                                   'FontRegular'),
    //                           textAlign: TextAlign.center,
    //                         ),
    //                       ))
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: 15.0,
    //               ),
    //             ],
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 10.0,
    //         )
    //       ],
    //     );
    //   },
    // ));
  }

  Widget coinWidget() {
    return Container(
        child: allTicker.length > 0
            ? ListView.builder(
          physics: ScrollPhysics(),
          itemCount: allTicker.length,
          shrinkWrap: true,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            bool test = false;
            String coinImage = allTicker[index].pair!.split("-")[0].toString();
            if (double.parse(
                allTicker[index].priceChangePercent24Hr.toString()) >
                0) {
              test = true;
            } else {
              test = false;
            }
            return Column(
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  padding: EdgeInsets.fromLTRB(15.0, 16.0, 15.0, 0.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme
                              .of(context)
                              .splashColor,
                          width: 1.0),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                      ),
                      color: Theme
                          .of(context)
                          .focusColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icon/favs.svg",
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Theme
                                          .of(context)
                                          .splashColor, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Theme
                                          .of(context)
                                          .accentColor.withOpacity(0.5),
                                    ),
                                    child: SvgPicture.network(
                                      "https://images.cofinex.io/crypto/ico/" +
                                          coinImage.toLowerCase() + ".svg",
                                      height: 15.0,),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        allTicker[index].pair.toString(),
                                        style:
                                        CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            13.0,
                                            Theme
                                                .of(context)
                                                .primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),

                                      Text(
                                        coinImage,
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            12.0,
                                            Theme
                                                .of(context)
                                                .canvasColor,
                                            FontWeight.w500,
                                            'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            flex: 2,
                          ),
                          Flexible(
                            child: Text(
                              " \$ " +
                                  double.parse(allTicker[index]
                                      .marketPrice
                                      .toString())
                                      .toStringAsFixed(2),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  12.0,
                                  Theme
                                      .of(context)
                                      .primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                              textAlign: TextAlign.end,
                            ),
                            flex: 1,
                          ),
                          const SizedBox(width: 10.0,),
                          Container(
                              decoration: BoxDecoration(
                                  color: test
                                      ? Theme
                                      .of(context)
                                      .indicatorColor
                                      : Theme
                                      .of(context)
                                      .scaffoldBackgroundColor,
                                  borderRadius:
                                  BorderRadius.circular(5.0)),
                              padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 5.0,
                                  bottom: 5.0),
                              child: Center(
                                child: Text(
                                  double.parse(allTicker[index]
                                      .priceChangePercent24Hr
                                      .toString())
                                      .toStringAsFixed(2),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      12.0,
                                      Theme
                                          .of(context)
                                          .focusColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                )
              ],
            );
          },
        )
            : Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // Add one stop for each color
                    // Values should increase from 0.0 to 1.0
                    stops: [
                      0.1,
                      0.5,
                      0.9,
                    ],
                    colors: [
                      Theme
                          .of(context)
                          .backgroundColor,
                      Theme
                          .of(context)
                          .backgroundColor,
                      Theme
                          .of(context)
                          .backgroundColor,
                    ])),
            child: Center(
              child: Text(
                " No records Found..!",
                style: CustomWidget(context: context).CustomSizedTextStyle(
                    16.0,
                    Theme
                        .of(context)
                        .primaryColor,
                    FontWeight.w500,
                    'FontRegular'),
              ),
            )));
  }

  Widget zonesWidget() {
    return Container(
        child: allTicker.length > 0
            ? ListView.builder(
          physics: ScrollPhysics(),
          itemCount: allTicker.length,
          shrinkWrap: true,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            bool test = false;
            if (double.parse(
                allTicker[index].priceChangePercent24Hr.toString()) >
                0) {
              test = true;
            } else {
              test = false;
            }
            String coinImage = allTicker[index].pair!.split("-")[0].toString();
            return Column(
              children: [
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme
                                .of(context)
                                .splashColor,
                            width: 1.0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                        ),
                        color: Theme
                            .of(context)
                            .focusColor),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme
                                  .of(context)
                                  .splashColor, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                              color: Theme
                                  .of(context)
                                  .highlightColor,
                            ),
                            child: SvgPicture.network(
                              "https://images.cofinex.io/crypto/ico/" +
                                  coinImage.toLowerCase() + ".svg",
                              height: 15.0,),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),

                          Text(
                            allTicker[index].pair.toString(),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme
                                    .of(context)
                                    .primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                          Column(
                            children: [
                              Text(
                                coinImage,
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    14.0,
                                    Theme
                                        .of(context)
                                        .primaryColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                allTicker[index]
                                    .priceChangePercent24Hr
                                    .toString(),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    12.0,
                                    test
                                        ? Theme
                                        .of(context)
                                        .indicatorColor
                                        : Theme
                                        .of(context)
                                        .scaffoldBackgroundColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 10.0,
                )
              ],
            );
          },
        )
            : Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // Add one stop for each color
                    // Values should increase from 0.0 to 1.0
                    stops: [
                      0.1,
                      0.5,
                      0.9,
                    ],
                    colors: [
                      Theme
                          .of(context)
                          .backgroundColor,
                      Theme
                          .of(context)
                          .backgroundColor,
                      Theme
                          .of(context)
                          .backgroundColor,
                    ])),
            child: Center(
              child: Text(
                " No records Found..!",
                style: CustomWidget(context: context).CustomSizedTextStyle(
                    16.0,
                    Theme
                        .of(context)
                        .primaryColor,
                    FontWeight.w500,
                    'FontRegular'),
              ),
            )));
  }

  fillList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    QueryMutation queryMutation = QueryMutation();

    GraphQLClient _client =
    qlapiUtils.clientToQuery(preferences.getString("token").toString());
    QueryResult result = await _client.query(
      QueryOptions(document: gql(queryMutation.getTickeDetails())),
    );

    List<dynamic> listData = result.data!["getAllTickerInfoV2"]["items"];

    setState(() {
      loading = false;
      allTicker = (listData).map((item) => AllTicker.fromJson(item)).toList();

      allTicker
        ..sort((a, b) =>
        ((double.parse(b.marketPrice.toString())+
            (double.parse(b.volumeTotal24Hr.toString())))
            .compareTo ((double.parse(a.marketPrice.toString()) +
          (double.parse(a.volumeTotal24Hr.toString()))))));
    });
  }

}
