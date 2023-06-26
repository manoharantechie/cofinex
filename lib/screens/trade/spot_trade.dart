import 'dart:convert';
import 'dart:math';

import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/data_model/api_utils.dart';
import 'package:cofinex/data_model/graph_ql_utils.dart';
import 'package:cofinex/data_model/model/open_trade_model.dart';
import 'package:cofinex/data_model/model/order_book_model.dart';
import 'package:cofinex/data_model/model/ticker_data_model.dart';
import 'package:cofinex/data_model/query_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';

class SpotTrade extends StatefulWidget {
  const SpotTrade({Key? key}) : super(key: key);

  @override
  State<SpotTrade> createState() => _SpotTradeState();
}

class _SpotTradeState extends State<SpotTrade>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();

  List<String> orderType = ["Limit", "Market"];
  List<String> volType = ["Vol(USDT)"];
  List<AllTicker> allTicker = [];
  List<AllTicker> searchPair = [];
  AllTicker? selectPair;
  APIUtils apiUtils = APIUtils();

  List<OrderBookData> buyData = [];
  List<OrderBookData> sellData = [];
  List<OpenOrdersHistory> orderHistory = [];

  TextEditingController searchController = TextEditingController();
  FocusNode searchFocus = FocusNode();

  GraphAPIUtils qlapiUtils = GraphAPIUtils();

  String selectedType = "";
  String selectedVol = "";
  TextEditingController amtController = TextEditingController();
  TextEditingController coinController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  bool collapse = false;
  bool loading = false;
  bool tradeOption = true;
  late TabController _tabTradeController;
  String coinOne = "";

  String coinTwo = "";
  String token = "";
  String bearer = "";

  String num1 = "";
  String num2 = "";

  IOWebSocketChannel? channelOpenOrder, channelTradeHistory;

  bool loginStatus = false;
  String tradeAmount = "0.00";
  String totalAmount = "0.00";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedType = orderType.first;
    selectedVol = volType.first;
    _tabTradeController = TabController(vsync: this, length: 3);

    channelOpenOrder = IOWebSocketChannel.connect(
        Uri.parse(
            "wss://yxeqaxptabeftfyndq527s76se.appsync-realtime-api.us-east-1.amazonaws.com/graphql?header=$token&payload=e30="),
        headers: {"Sec-WebSocket-Protocol": "graphql-ws"},
        pingInterval: Duration(seconds: 30));
    channelOpenOrder!.sink.close();

    getBearer();
    getRand();
    getRand1();
  }

  getRand() {
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      setState(() {
        num1 = (rng.nextInt(1150000)).toString() + DateTime.now().toString();
      });
    }
  }

  getRand1() {
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      setState(() {
        num1 = (rng.nextInt(2150000)).toString() + DateTime.now().toString();
      });
    }
  }

  getBearer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      bearer = preferences.getString("token").toString();

      loginStatus = preferences.getBool("login")!;
      if (loginStatus) {
        getToken();
        loading = true;

        coinList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          body: Container(
              color: CustomTheme.of(context).focusColor,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  SingleChildScrollView(
                      controller: _scrollController,
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                selectPair != null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              InkWell(
                                                child: Text(
                                                  coinOne + coinTwo,
                                                  style: CustomWidget(
                                                          context: context)
                                                      .CustomSizedTextStyle(
                                                          18.0,
                                                          Theme.of(context)
                                                              .primaryColor,
                                                          FontWeight.w600,
                                                          'FontRegular'),
                                                  textAlign: TextAlign.center,
                                                ),
                                                onTap: () {
                                                  showSheeet();
                                                },
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                double.parse(selectPair!
                                                        .priceChangePercent24Hr
                                                        .toString())
                                                    .toStringAsFixed(2),
                                                style: CustomWidget(
                                                        context: context)
                                                    .CustomSizedTextStyle(
                                                        12.0,
                                                        double.parse(selectPair!
                                                                    .priceChangePercent24Hr
                                                                    .toString()) >
                                                                0
                                                            ? Theme.of(context)
                                                                .indicatorColor
                                                            : Theme.of(context)
                                                                .scaffoldBackgroundColor,
                                                        FontWeight.w700,
                                                        'FontRegular'),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .primaryColorLight
                                                          .withOpacity(0.1),
                                                      border: Border.all(
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorLight),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  padding: EdgeInsets.only(
                                                      left: 7.0,
                                                      right: 7.0,
                                                      top: 5.0,
                                                      bottom: 5.0),
                                                  child: Center(
                                                    child: Text(
                                                      "10x",
                                                      style: CustomWidget(
                                                              context: context)
                                                          .CustomSizedTextStyle(
                                                              12.0,
                                                              Theme.of(context)
                                                                  .primaryColorLight,
                                                              FontWeight.w500,
                                                              'FontRegular'),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )),
                                              const SizedBox(
                                                width: 25.0,
                                              ),
                                              SvgPicture.asset(
                                                'assets/icon/togle.svg',
                                                height: 25.0,
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    : Container()
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Candlestick",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                          10.0,
                                          CustomTheme.of(context).canvasColor,
                                          FontWeight.w500,
                                          'FontRegular'),
                                ),

                                // SvgPicture.asset(
                                //   'assets/icon/togle.svg',
                                //   height: 25.0,
                                // ),

                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (collapse) {
                                        collapse = false;
                                      } else {
                                        collapse = true;
                                      }
                                    });
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 10.0,
                                          right: 10.0,
                                          top: 3.0,
                                          bottom: 3.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: CustomTheme.of(context)
                                              .errorColor,
                                          border: Border.all(
                                            color: CustomTheme.of(context)
                                                .canvasColor
                                                .withOpacity(0.5),
                                          )),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            collapse ? "Collapes" : "Expand",
                                            style: CustomWidget(
                                                    context: context)
                                                .CustomSizedTextStyle(
                                                    10.0,
                                                    Theme.of(context).hintColor,
                                                    FontWeight.w500,
                                                    'FontRegular'),
                                          ),
                                          Icon(
                                            collapse
                                                ? Icons.arrow_drop_up_sharp
                                                : Icons.arrow_drop_down,
                                            color: CustomTheme.of(context)
                                                .hintColor,
                                            size: 15.0,
                                          ),
                                        ],
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            collapse
                                ? Image.asset(
                                    'assets/icon/graph.png',
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                  )
                                : Container(),
                            SizedBox(
                              height: collapse ? 15.0 : 1.0,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Flexible(
                                                child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  tradeOption = true;
                                                });
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColorLight,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                padding: EdgeInsets.only(
                                                    top: 7.0, bottom: 7.0),
                                                child: Center(
                                                  child: Text(
                                                    "Buy",
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            10.0,
                                                            CustomTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                  ),
                                                ),
                                              ),
                                            )),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            Flexible(
                                                child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  tradeOption = false;
                                                });
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                padding: EdgeInsets.only(
                                                    top: 7.0, bottom: 7.0),
                                                child: Center(
                                                  child: Text(
                                                    "Sell",
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            10.0,
                                                            CustomTheme.of(
                                                                    context)
                                                                .focusColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                  ),
                                                ),
                                              ),
                                            )),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          height: 30.0,
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10.0,
                                              top: 0.0,
                                              bottom: 0.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: CustomTheme.of(context)
                                                  .errorColor,
                                              border: Border.all(
                                                color: CustomTheme.of(context)
                                                    .canvasColor
                                                    .withOpacity(0.5),
                                              )),
                                          child: Center(
                                            child: Theme(
                                              data: Theme.of(context).copyWith(
                                                canvasColor:
                                                    CustomTheme.of(context)
                                                        .focusColor,
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  items: orderType
                                                      .map(
                                                          (value) =>
                                                              DropdownMenuItem(
                                                                child: Text(
                                                                  value,
                                                                  style: CustomWidget(context: context).CustomSizedTextStyle(
                                                                      10.0,
                                                                      Theme.of(
                                                                              context)
                                                                          .hintColor,
                                                                      FontWeight
                                                                          .w500,
                                                                      'FontRegular'),
                                                                ),
                                                                value: value,
                                                              ))
                                                      .toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedType = value!;
                                                      priceController.clear();
                                                      amtController.clear();
                                                      totalAmount = "0.00";
                                                    });
                                                  },
                                                  isExpanded: true,
                                                  value: selectedType,
                                                  icon: Icon(
                                                    Icons.arrow_drop_down,
                                                    color:
                                                        CustomTheme.of(context)
                                                            .hintColor,
                                                    size: 15.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        selectedType.toString() == "Market"
                                            ? Container()
                                            : Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    0.0, 0.0, 0.0, 0.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: CustomTheme.of(
                                                                context)
                                                            .splashColor
                                                            .withOpacity(0.5),
                                                        width: 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color:
                                                        CustomTheme.of(context)
                                                            .errorColor),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          if (selectedType
                                                                  .toLowerCase() ==
                                                              "limit") {
                                                            tradeAmount =
                                                                "0.00";

                                                            if (priceController
                                                                .text
                                                                .isNotEmpty) {
                                                              double amount =
                                                                  double.parse(
                                                                      priceController
                                                                          .text);

                                                              if (amount > 0) {
                                                                amount =
                                                                    amount -
                                                                        0.01;
                                                                priceController
                                                                        .text =
                                                                    amount
                                                                        .toStringAsFixed(
                                                                            2);

                                                                if (amtController
                                                                    .text
                                                                    .isNotEmpty) {
                                                                  tradeAmount =
                                                                      amtController
                                                                          .text
                                                                          .toString();
                                                                } else {
                                                                  totalAmount =
                                                                      "0.00";
                                                                }
                                                              } else {
                                                                priceController
                                                                    .clear();
                                                                totalAmount =
                                                                    "0.00";
                                                              }
                                                            }
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                          height: 30.0,
                                                          width: 35.0,
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 10.0,
                                                            right: 10.0,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "-",
                                                              style: CustomWidget(
                                                                      context:
                                                                          context)
                                                                  .CustomSizedTextStyle(
                                                                      20.0,
                                                                      Theme.of(
                                                                              context)
                                                                          .hintColor,
                                                                      FontWeight
                                                                          .w500,
                                                                      'FontRegular'),
                                                            ),
                                                          )),
                                                    ),
                                                    Flexible(
                                                        child: Container(
                                                      height: 30.0,
                                                      child: TextField(
                                                        enabled: true,
                                                        controller:
                                                            priceController,
                                                        keyboardType:
                                                            const TextInputType
                                                                    .numberWithOptions(
                                                                decimal: true),
                                                        style: CustomWidget(
                                                                context:
                                                                    context)
                                                            .CustomSizedTextStyle(
                                                                13.0,
                                                                Theme.of(
                                                                        context)
                                                                    .hintColor,
                                                                FontWeight.w500,
                                                                'FontRegular'),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9.]')),
                                                        ],
                                                        onChanged: (value) {},
                                                        decoration: InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        17.0),
                                                            hintText: "Price",
                                                            hintStyle: CustomWidget(
                                                                    context:
                                                                        context)
                                                                .CustomSizedTextStyle(
                                                                    12.0,
                                                                    Theme.of(
                                                                            context)
                                                                        .hintColor,
                                                                    FontWeight
                                                                        .w500,
                                                                    'FontRegular'),
                                                            border: InputBorder
                                                                .none),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )),
                                                    const SizedBox(
                                                      width: 2.0,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          if (selectedType
                                                                  .toLowerCase() ==
                                                              "limit") {
                                                            if (priceController
                                                                .text
                                                                .isNotEmpty) {
                                                              double amount =
                                                                  double.parse(
                                                                      priceController
                                                                          .text);
                                                              print(amount);
                                                              if (amount > 0) {
                                                                amount =
                                                                    amount +
                                                                        0.01;
                                                                priceController
                                                                        .text =
                                                                    amount
                                                                        .toStringAsFixed(
                                                                            2);
                                                                if (amtController
                                                                    .text
                                                                    .isNotEmpty) {
                                                                  totalAmount = (double.parse(amtController
                                                                              .text
                                                                              .toString()) *
                                                                          double.parse(priceController
                                                                              .text
                                                                              .toString()))
                                                                      .toStringAsFixed(
                                                                          8);
                                                                  //   totalController.text=totalAmount;
                                                                  // }
                                                                } else {
                                                                  tradeAmount =
                                                                      "0.00";
                                                                }
                                                              }
                                                            } else {
                                                              print("Mano");
                                                              priceController
                                                                      .text =
                                                                  "0.01";
                                                              totalAmount =
                                                                  "0.00";
                                                            }
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                          height: 30.0,
                                                          width: 35.0,
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 10.0,
                                                            right: 10.0,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "+",
                                                              style: CustomWidget(
                                                                      context:
                                                                          context)
                                                                  .CustomSizedTextStyle(
                                                                      20.0,
                                                                      Theme.of(
                                                                              context)
                                                                          .hintColor,
                                                                      FontWeight
                                                                          .w500,
                                                                      'FontRegular'),
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            selectPair != null
                                                ? "= " +
                                                    selectPair!.marketPrice
                                                        .toString() +
                                                    coinTwo
                                                : "",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        10.0,
                                                        CustomTheme.of(context)
                                                            .canvasColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              0.0, 0.0, 0.0, 0.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: CustomTheme.of(context)
                                                      .splashColor
                                                      .withOpacity(0.5),
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: CustomTheme.of(context)
                                                  .errorColor),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    tradeAmount = "0.0";
                                                    totalAmount = "0.0";

                                                    if (amtController
                                                        .text.isNotEmpty) {
                                                      double amount =
                                                          double.parse(
                                                              amtController
                                                                  .text);
                                                      if (amount > 0) {
                                                        amount = amount - 0.01;
                                                        amtController.text =
                                                            amount
                                                                .toStringAsFixed(
                                                                    2);
                                                        tradeAmount =
                                                            amtController.text;

                                                        if (priceController
                                                            .text.isNotEmpty) {
                                                          totalAmount = (double.parse(
                                                                      amtController
                                                                          .text
                                                                          .toString()) *
                                                                  double.parse(
                                                                      priceController
                                                                          .text
                                                                          .toString()))
                                                              .toStringAsFixed(
                                                                  8);
                                                        }
                                                      } else {
                                                        amtController.clear();
                                                        tradeAmount = "0.0";
                                                        totalAmount = "0.0";
                                                      }
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                    height: 30.0,
                                                    width: 35.0,
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 10.0,
                                                      right: 10.0,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "-",
                                                        style: CustomWidget(
                                                                context:
                                                                    context)
                                                            .CustomSizedTextStyle(
                                                                20.0,
                                                                Theme.of(
                                                                        context)
                                                                    .hintColor,
                                                                FontWeight.w500,
                                                                'FontRegular'),
                                                      ),
                                                    )),
                                              ),
                                              Flexible(
                                                  child: Container(
                                                height: 30.0,
                                                child: TextField(
                                                  enabled: true,
                                                  controller: amtController,
                                                  keyboardType:
                                                      const TextInputType
                                                              .numberWithOptions(
                                                          decimal: true),
                                                  style: CustomWidget(
                                                          context: context)
                                                      .CustomSizedTextStyle(
                                                          13.0,
                                                          Theme.of(context)
                                                              .hintColor,
                                                          FontWeight.w500,
                                                          'FontRegular'),
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(
                                                            RegExp(r'[0-9.]')),
                                                  ],
                                                  onChanged: (value) {},
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              bottom: 20.0),
                                                      hintText: "Amount(BTC)",
                                                      hintStyle: CustomWidget(
                                                              context: context)
                                                          .CustomSizedTextStyle(
                                                              10.0,
                                                              Theme.of(context)
                                                                  .hintColor,
                                                              FontWeight.w500,
                                                              'FontRegular'),
                                                      border: InputBorder.none),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                              const SizedBox(
                                                width: 2.0,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    totalAmount = "0.000";

                                                    if (amtController
                                                        .text.isNotEmpty) {
                                                      double amount =
                                                          double.parse(
                                                              amtController
                                                                  .text);
                                                      if (amount >= 0) {
                                                        amount = amount + 0.01;
                                                        amtController.text =
                                                            amount
                                                                .toStringAsFixed(
                                                                    2);
                                                        tradeAmount =
                                                            amtController.text;
                                                        if (priceController
                                                            .text.isNotEmpty) {
                                                          totalAmount = (double.parse(
                                                                      amtController
                                                                          .text
                                                                          .toString()) *
                                                                  double.parse(
                                                                      priceController
                                                                          .text
                                                                          .toString()))
                                                              .toStringAsFixed(
                                                                  8);
                                                        }
                                                      }
                                                    } else {
                                                      amtController.text =
                                                          "0.01";
                                                      tradeAmount =
                                                          amtController.text;
                                                      totalAmount = "0.000";
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                    height: 30.0,
                                                    width: 35.0,
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 10.0,
                                                      right: 10.0,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "+",
                                                        style: CustomWidget(
                                                                context:
                                                                    context)
                                                            .CustomSizedTextStyle(
                                                                20.0,
                                                                Theme.of(
                                                                        context)
                                                                    .hintColor,
                                                                FontWeight.w500,
                                                                'FontRegular'),
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                // setState(() {
                                                //   priceController.clear();
                                                //   amtController.clear();
                                                //   totalController.clear();
                                                //   first = false;
                                                //   second = true;
                                                //   third = false;
                                                //   fourth = false;
                                                //   priceController.text = price;
                                                //   if (buySell) {
                                                //     double perce = (double.parse(
                                                //         secondBalance) *
                                                //         25) /
                                                //         100;
                                                //
                                                //     totalAmount = double.parse(
                                                //         perce.toString())
                                                //         .toStringAsFixed(8);
                                                //     totalController.text =
                                                //         totalAmount;
                                                //     double a = double.parse(perce
                                                //         .toString()); // this is the value in my first text field (This is the percentage rate i intend to use)
                                                //     double b =
                                                //     double.parse(price);
                                                //     amtController
                                                //         .text = double.parse(
                                                //         (a / b).toString())
                                                //         .toStringAsFixed(8);
                                                //     double amount =
                                                //     double.parse(
                                                //         priceController.text
                                                //             .toString());
                                                //
                                                //   } else {
                                                //     double perce = (double.parse(
                                                //         firstBalance) *
                                                //         25) /
                                                //         100;
                                                //     amtController.text =
                                                //     "0.25";
                                                //     print(perce);
                                                //
                                                //     totalController
                                                //         .text = (0.50 *
                                                //         double.parse(price
                                                //             .toString()))
                                                //         .toString();
                                                //   }
                                                // });

                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      color: CustomTheme.of(
                                                              context)
                                                          .errorColor,
                                                      border: Border.all(
                                                        color: CustomTheme.of(
                                                                context)
                                                            .canvasColor
                                                            .withOpacity(0.5),
                                                      )),
                                                  padding: EdgeInsets.only(
                                                      left: 7.0,
                                                      right: 7.0,
                                                      top: 5.0,
                                                      bottom: 5.0),
                                                  child: Center(
                                                    child: Text(
                                                      "25%",
                                                      style: CustomWidget(
                                                              context: context)
                                                          .CustomSizedTextStyle(
                                                              8.0,
                                                              Theme.of(context)
                                                                  .canvasColor,
                                                              FontWeight.w500,
                                                              'FontRegular'),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )),
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color:
                                                        CustomTheme.of(context)
                                                            .errorColor,
                                                    border: Border.all(
                                                      color: CustomTheme.of(
                                                              context)
                                                          .canvasColor
                                                          .withOpacity(0.5),
                                                    )),
                                                padding: EdgeInsets.only(
                                                    left: 7.0,
                                                    right: 7.0,
                                                    top: 5.0,
                                                    bottom: 5.0),
                                                child: Center(
                                                  child: Text(
                                                    "50%",
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            8.0,
                                                            Theme.of(context)
                                                                .canvasColor,
                                                            FontWeight.w500,
                                                            'FontRegular'),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )),
                                            Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color:
                                                        CustomTheme.of(context)
                                                            .errorColor,
                                                    border: Border.all(
                                                      color: CustomTheme.of(
                                                              context)
                                                          .canvasColor
                                                          .withOpacity(0.5),
                                                    )),
                                                padding: EdgeInsets.only(
                                                    left: 7.0,
                                                    right: 7.0,
                                                    top: 5.0,
                                                    bottom: 5.0),
                                                child: Center(
                                                  child: Text(
                                                    "75%",
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            8.0,
                                                            Theme.of(context)
                                                                .canvasColor,
                                                            FontWeight.w500,
                                                            'FontRegular'),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )),
                                            Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color:
                                                        CustomTheme.of(context)
                                                            .errorColor,
                                                    border: Border.all(
                                                      color: CustomTheme.of(
                                                              context)
                                                          .canvasColor
                                                          .withOpacity(0.5),
                                                    )),
                                                padding: EdgeInsets.only(
                                                    left: 7.0,
                                                    right: 7.0,
                                                    top: 5.0,
                                                    bottom: 5.0),
                                                child: Center(
                                                  child: Text(
                                                    "100%",
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            8.0,
                                                            Theme.of(context)
                                                                .canvasColor,
                                                            FontWeight.w500,
                                                            'FontRegular'),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          height: 30.0,
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10.0,
                                              top: 0.0,
                                              bottom: 0.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: CustomTheme.of(context)
                                                  .errorColor,
                                              border: Border.all(
                                                color: CustomTheme.of(context)
                                                    .canvasColor
                                                    .withOpacity(0.5),
                                              )),
                                          child: Center(
                                            child: Theme(
                                              data: Theme.of(context).copyWith(
                                                canvasColor:
                                                    CustomTheme.of(context)
                                                        .focusColor,
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  items: volType
                                                      .map(
                                                          (value) =>
                                                              DropdownMenuItem(
                                                                child: Text(
                                                                  value,
                                                                  style: CustomWidget(context: context).CustomSizedTextStyle(
                                                                      10.0,
                                                                      Theme.of(
                                                                              context)
                                                                          .hintColor,
                                                                      FontWeight
                                                                          .w500,
                                                                      'FontRegular'),
                                                                ),
                                                                value: value,
                                                              ))
                                                      .toList(),
                                                  onChanged: (value) {
                                                    setState(() {});
                                                  },
                                                  isExpanded: true,
                                                  value: selectedVol,
                                                  icon: Icon(
                                                    Icons.arrow_drop_down,
                                                    color:
                                                        CustomTheme.of(context)
                                                            .hintColor,
                                                    size: 15.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            selectPair != null
                                                ? "= " + totalAmount + coinTwo
                                                : "",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        10.0,
                                                        CustomTheme.of(context)
                                                            .canvasColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Avail",
                                              style: CustomWidget(
                                                      context: context)
                                                  .CustomSizedTextStyle(
                                                      10.0,
                                                      CustomTheme.of(context)
                                                          .canvasColor,
                                                      FontWeight.w600,
                                                      'FontRegular'),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              "=0.00 USD",
                                              style: CustomWidget(
                                                      context: context)
                                                  .CustomSizedTextStyle(
                                                      10.0,
                                                      CustomTheme.of(context)
                                                          .primaryColorLight,
                                                      FontWeight.w600,
                                                      'FontRegular'),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: tradeOption
                                                  ? Theme.of(context)
                                                      .primaryColorLight
                                                  : Theme.of(context)
                                                      .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          padding: EdgeInsets.only(
                                              top: 7.0, bottom: 7.0),
                                          child: Center(
                                            child: Text(
                                              tradeOption
                                                  ? "Buy " + coinOne
                                                  : "Sell " + coinTwo,
                                              style:
                                                  CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                          14.0,
                                                          tradeOption
                                                              ? CustomTheme.of(
                                                                      context)
                                                                  .errorColor
                                                              : CustomTheme.of(
                                                                      context)
                                                                  .focusColor,
                                                          FontWeight.w600,
                                                          'FontRegular'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  flex: 1,
                                ),
                                const SizedBox(width: 10.0),
                                Flexible(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "Price",
                                                  style: CustomWidget(
                                                          context: context)
                                                      .CustomSizedTextStyle(
                                                          14.0,
                                                          CustomTheme.of(
                                                                  context)
                                                              .canvasColor,
                                                          FontWeight.w500,
                                                          'FontRegular'),
                                                ),
                                                Text(
                                                  "(" + coinTwo + ")",
                                                  style: CustomWidget(
                                                          context: context)
                                                      .CustomSizedTextStyle(
                                                          10.0,
                                                          CustomTheme.of(
                                                                  context)
                                                              .canvasColor,
                                                          FontWeight.w500,
                                                          'FontRegular'),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Total",
                                                  style: CustomWidget(
                                                          context: context)
                                                      .CustomSizedTextStyle(
                                                          14.0,
                                                          CustomTheme.of(
                                                                  context)
                                                              .canvasColor,
                                                          FontWeight.w500,
                                                          'FontRegular'),
                                                ),
                                                Text(
                                                  "(" + coinOne + ")",
                                                  style: CustomWidget(
                                                          context: context)
                                                      .CustomSizedTextStyle(
                                                          10.0,
                                                          CustomTheme.of(
                                                                  context)
                                                              .canvasColor,
                                                          FontWeight.w500,
                                                          'FontRegular'),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          child: sellData.length > 0
                                              ? ListView.builder(
                                                  physics: ScrollPhysics(),
                                                  itemCount: sellData.length,
                                                  shrinkWrap: true,
                                                  controller: _scrollController,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              sellData[index]
                                                                  .price
                                                                  .toString(),
                                                              style: CustomWidget(
                                                                      context:
                                                                          context)
                                                                  .CustomSizedTextStyle(
                                                                      10.0,
                                                                      CustomTheme.of(
                                                                              context)
                                                                          .scaffoldBackgroundColor,
                                                                      FontWeight
                                                                          .w400,
                                                                      'FontRegular'),
                                                            ),
                                                            Text(
                                                              sellData[index]
                                                                  .amount
                                                                  .toString(),
                                                              style: CustomWidget(
                                                                      context:
                                                                          context)
                                                                  .CustomSizedTextStyle(
                                                                      10.0,
                                                                      CustomTheme.of(
                                                                              context)
                                                                          .canvasColor,
                                                                      FontWeight
                                                                          .w400,
                                                                      'FontRegular'),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 5.0,
                                                        )
                                                      ],
                                                    );
                                                  },
                                                )
                                              : Center(
                                                  child: Text(
                                                    "No Records Found....!",
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            10.0,
                                                            CustomTheme.of(
                                                                    context)
                                                                .primaryColorLight,
                                                            FontWeight.w500,
                                                            'FontRegular'),
                                                  ),
                                                ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        selectPair == null
                                            ? Container()
                                            : Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Text(
                                                  selectPair!.low24Hr
                                                      .toString(),
                                                  style: CustomWidget(
                                                          context: context)
                                                      .CustomSizedTextStyle(
                                                          10.0,
                                                          CustomTheme.of(
                                                                  context)
                                                              .indicatorColor,
                                                          FontWeight.w500,
                                                          'FontRegular'),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                        selectPair == null
                                            ? Container()
                                            : Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Text(
                                                  "= " +
                                                      selectPair!.marketPrice
                                                          .toString() +
                                                      coinTwo,
                                                  style: CustomWidget(
                                                          context: context)
                                                      .CustomSizedTextStyle(
                                                          10.0,
                                                          CustomTheme.of(
                                                                  context)
                                                              .canvasColor,
                                                          FontWeight.w500,
                                                          'FontRegular'),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          child: buyData.length > 0
                                              ? ListView.builder(
                                                  physics: ScrollPhysics(),
                                                  itemCount: buyData.length,
                                                  shrinkWrap: true,
                                                  controller: _scrollController,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              buyData[index]
                                                                  .price
                                                                  .toString(),
                                                              style: CustomWidget(
                                                                      context:
                                                                          context)
                                                                  .CustomSizedTextStyle(
                                                                      10.0,
                                                                      CustomTheme.of(
                                                                              context)
                                                                          .indicatorColor,
                                                                      FontWeight
                                                                          .w400,
                                                                      'FontRegular'),
                                                            ),
                                                            Text(
                                                              buyData[index]
                                                                  .amount
                                                                  .toString(),
                                                              style: CustomWidget(
                                                                      context:
                                                                          context)
                                                                  .CustomSizedTextStyle(
                                                                      10.0,
                                                                      CustomTheme.of(
                                                                              context)
                                                                          .canvasColor,
                                                                      FontWeight
                                                                          .w400,
                                                                      'FontRegular'),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 5.0,
                                                        )
                                                      ],
                                                    );
                                                  },
                                                )
                                              : Center(
                                                  child: Text(
                                                    "No Records Found....!",
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            10.0,
                                                            CustomTheme.of(
                                                                    context)
                                                                .primaryColorLight,
                                                            FontWeight.w500,
                                                            'FontRegular'),
                                                  ),
                                                ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  flex: 1,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            tradeOpenUI()
                          ],
                        ),
                      )),
                  loading
                      ? CustomWidget(context: context).loadingIndicator(
                          CustomTheme.of(context).primaryColorLight,
                        )
                      : Container()
                ],
              )),
        ));
  }

  Widget tradeOpenUI() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: NestedScrollView(
        controller: _scrollController,
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          //<-- headerSliverBuilder
          return <Widget>[
            SliverAppBar(
              backgroundColor: CustomTheme.of(context).focusColor,
              pinned: true,
              //<-- pinned to true
              floating: true,
              //<-- floating to true
              expandedHeight: 30.0,
              forceElevated: innerBoxIsScrolled,
              //<-- forceElevated to innerBoxIsScrolled
              bottom: TabBar(
                isScrollable: true,
                labelColor: CustomTheme.of(context).primaryColorLight,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3.0,
                //<-- selected text color
                unselectedLabelColor: CustomTheme.of(context).primaryColor,
                // isScrollable: true,
                indicatorPadding:
                    EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                indicatorColor: CustomTheme.of(context).primaryColorLight,
                tabs: <Tab>[
                  Tab(
                    text: "Open Orders",
                  ),
                  Tab(
                    text: "Order History",
                  ),
                  Tab(
                    text: "Funds",
                  ),
                ],
                controller: _tabTradeController,
              ),
            ),
          ];
        },
        body: Container(
          color: CustomTheme.of(context).focusColor,
          height: MediaQuery.of(context).size.height * 0.5,
          child: TabBarView(
            children: <Widget>[
              Container(
                height: 150.0,
                child: Center(
                  child: Text(
                    "No Records Found....!",
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                        14.0,
                        CustomTheme.of(context).primaryColorLight,
                        FontWeight.w500,
                        'FontRegular'),
                  ),
                ),
              ),
              orderHistoryUI(),
              Container(
                height: 150.0,
                child: Center(
                  child: Text(
                    "No Records Found....!",
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                        14.0,
                        CustomTheme.of(context).primaryColorLight,
                        FontWeight.w500,
                        'FontRegular'),
                  ),
                ),
              ),
            ],
            controller: _tabTradeController,
          ),
        ),
      ),
    );
  }

  showSheeet() {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (contexts) {
          return StatefulBuilder(
            builder: (BuildContext contexts, StateSetter setStates) {
              return Container(
                height: MediaQuery.of(contexts).size.height * 0.9,
                width: MediaQuery.of(contexts).size.width,
                color: Theme.of(context).backgroundColor,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Container(
                            height: 45.0,
                            padding: EdgeInsets.only(left: 20.0),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField(
                              controller: searchController,
                              focusNode: searchFocus,
                              enabled: true,
                              onEditingComplete: () {
                                setStates(() {
                                  searchFocus.unfocus();
                                });
                              },
                              onChanged: (value) {
                                setStates(() {
                                  for (int m = 0; m < allTicker.length; m++) {
                                    if (allTicker[m]
                                        .pair
                                        .toString()
                                        .toLowerCase()
                                        .contains(
                                            value.toString().toLowerCase())) {
                                      searchPair.add(allTicker[m]);
                                    }
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 12, right: 0, top: 8, bottom: 8),
                                hintText: "Search",
                                hintStyle: TextStyle(
                                    fontFamily: "FontRegular",
                                    color: Theme.of(context).hintColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400),
                                filled: true,
                                fillColor: CustomTheme.of(context)
                                    .backgroundColor
                                    .withOpacity(0.5),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                      color: CustomTheme.of(context)
                                          .splashColor
                                          .withOpacity(0.5),
                                      width: 1.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                      color: CustomTheme.of(context)
                                          .splashColor
                                          .withOpacity(0.5),
                                      width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                      color: CustomTheme.of(context)
                                          .splashColor
                                          .withOpacity(0.5),
                                      width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                      color: CustomTheme.of(context)
                                          .splashColor
                                          .withOpacity(0.5),
                                      width: 1.0),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 0.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Align(
                              child: InkWell(
                            onTap: () {
                              Navigator.pop(contexts);
                              setStates(() {
                                searchController.clear();
                                searchPair.clear();
                                searchPair.addAll(allTicker);
                              });
                            },
                            child: Icon(
                              Icons.close,
                              size: 20.0,
                              color: Theme.of(context).hintColor,
                            ),
                          )),
                        ),
                        const SizedBox(
                          width: 10.0,
                        )
                      ],
                    ),
                    Expanded(
                        child: ListView.builder(
                            controller: _scrollController,
                            itemCount: searchPair.length,
                            itemBuilder: ((BuildContext context, int index) {
                              String coinImage = searchPair[index]
                                  .pair!
                                  .split("-")[0]
                                  .toString();
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectPair = searchPair[index];
                                        coinOne = selectPair!.pair!
                                            .split("-")[0]
                                            .toString();
                                        coinTwo = selectPair!.pair!
                                            .split("-")[1]
                                            .toString();
                                        getOpenOrders();
                                        getTradeHistory();
                                        getToken();
                                      });

                                      Navigator.pop(contexts);
                                    },
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 20.0,
                                        ),
                                        Container(
                                          height: 25.0,
                                          width: 25.0,
                                          child: SvgPicture.network(
                                            "https://images.cofinex.io/crypto/ico/" +
                                                coinImage.toLowerCase() +
                                                ".svg",
                                            height: 15.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          searchPair[index].pair.toString(),
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  16.0,
                                                  Theme.of(context)
                                                      .primaryColor,
                                                  FontWeight.w500,
                                                  'FontRegular'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Container(
                                    height: 1.0,
                                    width: MediaQuery.of(context).size.width,
                                    color:
                                        CustomTheme.of(context).backgroundColor,
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                ],
                              );
                            }))),
                  ],
                ),
              );
            },
          );
        });
  }

  Widget orderHistoryUI() {
    orderHistory = orderHistory.reversed.toList();
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price",
                style: CustomWidget(context: context).CustomSizedTextStyle(
                    12.0,
                    CustomTheme.of(context).canvasColor,
                    FontWeight.w400,
                    'FontRegular'),
              ),
              Text(
                "Quantity",
                style: CustomWidget(context: context).CustomSizedTextStyle(
                    12.0,
                    CustomTheme.of(context).canvasColor,
                    FontWeight.w400,
                    'FontRegular'),
              ),
              Text(
                "Date",
                style: CustomWidget(context: context).CustomSizedTextStyle(
                    12.0,
                    CustomTheme.of(context).canvasColor,
                    FontWeight.w400,
                    'FontRegular'),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: orderHistory.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: ((BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              orderHistory[index].price.toString(),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      10.0,
                                      orderHistory[index].side.toString() == "1"
                                          ? CustomTheme.of(context)
                                              .indicatorColor
                                          : CustomTheme.of(context)
                                              .scaffoldBackgroundColor,
                                      FontWeight.w400,
                                      'FontRegular'),
                            ),
                            Text(
                              orderHistory[index].qty.toString(),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      10.0,
                                      CustomTheme.of(context).canvasColor,
                                      FontWeight.w400,
                                      'FontRegular'),
                              textAlign: TextAlign.right,
                            ),
                            Text(
                              orderHistory[index]
                                  .time
                                  .toString()
                                  .substring(10, 19),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      10.0,
                                      CustomTheme.of(context).canvasColor,
                                      FontWeight.w400,
                                      'FontRegular'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                      ],
                    );
                  })))
        ],
      ),
    );
  }

  coinList() async {
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
            b.priceChangePercent24Hr!.compareTo(a.priceChangePercent24Hr!));
      selectPair = allTicker[0];
      coinOne = allTicker[0].pair!.split("-")[0].toString();
      coinTwo = allTicker[0].pair!.split("-")[1].toString();
      searchPair.addAll(allTicker);
    });
    getOpenOrders();
    getTradeHistory();
  }

  getOpenOrders() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    QueryMutation queryMutation = QueryMutation();

    GraphQLClient _client =
        qlapiUtils.clientToQuery(preferences.getString("token").toString());
    QueryResult result = await _client.query(
      QueryOptions(
          document:
              gql(queryMutation.getOrderBook(selectPair!.pair.toString()))),
    );

    List<dynamic> listData = result.data!["getOrderBookV2"]["items"][0]["asks"];
    List<dynamic> listData1 =
        result.data!["getOrderBookV2"]["items"][0]["bids"];

    setState(() {
      loading = false;
      buyData.clear();
      sellData.clear();
      buyData = (listData).map((item) => OrderBookData.fromJson(item)).toList();
      sellData =
          (listData1).map((item) => OrderBookData.fromJson(item)).toList();
    });
  }

  getTradeHistory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    QueryMutation queryMutation = QueryMutation();
    GraphQLClient _client =
        qlapiUtils.clientToQuery(preferences.getString("token").toString());
    QueryResult result = await _client.query(
      QueryOptions(
          document:
              gql(queryMutation.getTradeHistory(selectPair!.pair.toString()))),
    );

    List<dynamic> listData = result.data!["getTradeItemsV2"]["items"];
    setState(() {
      loading = false;

      orderHistory.clear();
      orderHistory =
          (listData).map((item) => OpenOrdersHistory.fromJson(item)).toList();
    });
  }

  getToken() {
    apiUtils.generateToken().then((dynamic loginData) {
      setState(() {
        token = loginData["header"];

        String coin = selectPair!.pair.toString();

        channelOpenOrder = IOWebSocketChannel.connect(
            Uri.parse(
                "wss://yxeqaxptabeftfyndq527s76se.appsync-realtime-api.us-east-1.amazonaws.com/graphql?header=$token&payload=e30="),
            headers: {"Sec-WebSocket-Protocol": "graphql-ws"},
            pingInterval: Duration(seconds: 30));

        channelOpenOrder!.sink.add(json.encode({
          "id": num1,
          "payload": {
            "data":
                "{\"query\":\"subscription MySubscription {\\n  updatedOrderBookV2(pair: \\\"$coin\\\",system: \\\"global\\\") {\\n    asks {\\n      amount\\n      price\\n    }\\n    bids {\\n      amount\\n      price\\n    }\\n    pair\\n  }\\n}\",\"variables\":null}",
            "extensions": {
              "authorization": {
                "Authorization": "Bearer $bearer",
                "host":
                    "yxeqaxptabeftfyndq527s76se.appsync-api.us-east-1.amazonaws.com"
              }
            }
          },
          "type": "start"
        }));

        channelTradeHistory = IOWebSocketChannel.connect(
            Uri.parse(
                "wss://yxeqaxptabeftfyndq527s76se.appsync-realtime-api.us-east-1.amazonaws.com/graphql?header=$token&payload=e30="),
            headers: {"Sec-WebSocket-Protocol": "graphql-ws"},
            pingInterval: Duration(seconds: 30));

        channelTradeHistory!.sink.add(json.encode({
          "id": num2 + "asd",
          "payload": {
            "data":
                "{\"query\":\"subscription MySubscription {\\n  updatedTradeItemV2(pair: \\\"BTC-USDT\\\",system: \\\"global\\\") {\\n    pair\\n    price\\n    qty\\n    time\\n  side\\n trans_id\\n}\\n}\",\"variables\":null}",
            "extensions": {
              "authorization": {
                "Authorization": "Bearer $bearer",
                "host":
                    "yxeqaxptabeftfyndq527s76se.appsync-api.us-east-1.amazonaws.com"
              }
            }
          },
          "type": "start"
        }));
      });
      socketData();
      socketHistoryData();
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }

  socketData() {
    setState(() {});

    channelOpenOrder!.stream.listen(
      (data) {
        if (data != null || data != "null") {
          var decode = jsonDecode(data);
          List<dynamic> listData =
              decode["payload"]["data"]["updatedOrderBookV2"]["asks"];
          List<dynamic> listData1 =
              decode["payload"]["data"]["updatedOrderBookV2"]["bids"];

          if (mounted) {
            setState(() {
              loading = false;
              buyData.clear();
              sellData.clear();
              buyData = (listData)
                  .map((item) => OrderBookData.fromJson(item))
                  .toList();
              sellData = (listData1)
                  .map((item) => OrderBookData.fromJson(item))
                  .toList();
            });
          }
        }
      },
      onDone: () async {
        await Future.delayed(Duration(seconds: 10));
        getRand();
        String coin = selectPair!.pair.toString();
        channelOpenOrder = IOWebSocketChannel.connect(
            Uri.parse(
                "wss://yxeqaxptabeftfyndq527s76se.appsync-realtime-api.us-east-1.amazonaws.com/graphql?header=$token&payload=e30="),
            headers: {"Sec-WebSocket-Protocol": "graphql-ws"},
            pingInterval: Duration(seconds: 30));
        channelOpenOrder!.sink.add(json.encode({
          "id": num1,
          "payload": {
            "data":
                "{\"query\":\"subscription MySubscription {\\n  updatedOrderBookV2(pair: \\\"$coin\\\",system: \\\"global\\\") {\\n    asks {\\n      amount\\n      price\\n    }\\n    bids {\\n      amount\\n      price\\n    }\\n    pair\\n  }\\n}\",\"variables\":null}",
            "extensions": {
              "authorization": {
                "Authorization": "Bearer $bearer",
                "host":
                    "yxeqaxptabeftfyndq527s76se.appsync-api.us-east-1.amazonaws.com"
              }
            }
          },
          "type": "start"
        }));
        socketData();
      },
      onError: (error) => {},
    );
  }

  socketHistoryData() {
    setState(() {});

    channelTradeHistory!.stream.listen(
      (data) {
        if (data != null || data != "null") {
          var decode = jsonDecode(data);

          if (mounted) {
            setState(() {
              orderHistory.add(OpenOrdersHistory.fromJson(
                  decode["payload"]["data"]["updatedTradeItemV2"]));
            });
          }
        }
      },
      onDone: () async {
        await Future.delayed(Duration(seconds: 10));
        getRand1();
        String coin = selectPair!.pair.toString();
        channelTradeHistory = IOWebSocketChannel.connect(
            Uri.parse(
                "wss://yxeqaxptabeftfyndq527s76se.appsync-realtime-api.us-east-1.amazonaws.com/graphql?header=$token&payload=e30="),
            headers: {"Sec-WebSocket-Protocol": "graphql-ws"},
            pingInterval: Duration(seconds: 30));

        channelTradeHistory!.sink.add(json.encode({
          "id": num2 + "asss",
          "payload": {
            "data":
                "{\"query\":\"subscription MySubscription {\\n  updatedTradeItemV2(pair: \\\"BTC-USDT\\\",system: \\\"global\\\") {\\n    pair\\n    price\\n    qty\\n    time\\n  side\\n trans_id\\n}\\n}\",\"variables\":null}",
            "extensions": {
              "authorization": {
                "Authorization": "Bearer $bearer",
                "host":
                    "yxeqaxptabeftfyndq527s76se.appsync-api.us-east-1.amazonaws.com"
              }
            }
          },
          "type": "start"
        }));
        socketHistoryData();
      },
      onError: (error) => {},
    );
  }
}
