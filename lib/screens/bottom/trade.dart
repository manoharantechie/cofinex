import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/data_model/graph_ql_utils.dart';
import 'package:cofinex/data_model/model/ticker_data_model.dart';
import 'package:cofinex/data_model/query_utils.dart';
import 'package:cofinex/screens/basic/future_trade.dart';
import 'package:cofinex/screens/trade/copy_trading.dart';
import 'package:cofinex/screens/trade/spot_trade.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({Key? key}) : super(key: key);

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen>
    with TickerProviderStateMixin {
  List list_name = ["BTC", "ADA", "ETH", "BUSD", "BNB", "DOGE"];

  int currentIndex = 0;
  int indexVal = 0;
  List<String> chartTime = [
    "1m",
    "15m",
    "30",
    "1d",
  ];
  ScrollController _scrollController = ScrollController();
  List<String> options = ["collapes"];
  List<String> borrows = ["Manual Borrow", "Auto Borrow"];
  List<String> orderType = ["Limit", "Market"];
  List<String> volType = ["Vol(USDT)"];
  String selectedOption = "";
  String selectedBorrow = "";
  String selectedType = "";
  String selectedVol = "";
  TextEditingController amtController = TextEditingController();
  TextEditingController coinController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  bool fiatOption = false;
  bool loading = false;
  List<AllTicker> allTicker = [];

  GraphAPIUtils qlapiUtils = GraphAPIUtils();
  late TabController _tabController,
      _tabTradeController,
      _tabCrossController,
      _tabFiatController;
  bool collapse = false;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedOption = options.first;
    selectedBorrow = borrows.first;
    selectedType = orderType.first;
    selectedVol = volType.first;
    _tabCrossController = TabController(vsync: this, length: 2);
    _tabFiatController = TabController(vsync: this, length: 1);
    _tabTradeController = TabController(vsync: this, length: 3);
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: CustomTheme.of(context).backgroundColor,
        child: Column(
          children: [
            Container(
              height: 35.0,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              padding: EdgeInsets.only(left: 0.2, right: 0.2),
              decoration: BoxDecoration(
                  color: CustomTheme.of(context).focusColor,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: CustomTheme.of(context).accentColor, width: 1.0)),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelStyle: CustomWidget(context: context).CustomSizedTextStyle(
                    13.0,
                    Theme.of(context).accentColor,
                    FontWeight.w600,
                    'FontRegular'),

                labelColor: CustomTheme.of(context).primaryColor,
                //<-- selected text color
                unselectedLabelColor:
                    CustomTheme.of(context).primaryColor.withOpacity(0.5),
                // isScrollable: true,
                indicatorColor: CustomTheme.of(context).cardColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), // Creates border
                  color: CustomTheme.of(context).buttonColor,
                ),
                tabs: <Widget>[
                  Tab(
                    text: "Spot",
                  ),
                  Tab(
                    text: "Cross",
                  ),
                  Tab(
                    text: "Copy Trading",
                  ),
                  Tab(
                    text: "Future",
                  ),
                  Tab(
                    text: "Fiat",
                  ),
                  Tab(
                    text: "Grid",
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                color: CustomTheme.of(context).backgroundColor,
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    SpotTrade(),
                    CrosstradeUI(),
                    CopyTrading(),
                    FuturetradeUI(),
                    FiattradeUI(),
                    Future_Trade_Screen(),

                    // spotList()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }





  Widget CrosstradeUI() {
    return Container(
        color: CustomTheme.of(context).focusColor,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "BTCUSDT",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        18.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "+ 1.76%",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).indicatorColor,
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
                                          .buttonColor
                                          .withOpacity(0.1),
                                      border: Border.all(
                                          color: Theme.of(context).buttonColor),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  padding: EdgeInsets.only(
                                      left: 7.0,
                                      right: 7.0,
                                      top: 5.0,
                                      bottom: 5.0),
                                  child: Center(
                                    child: Text(
                                      "10x",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                              12.0,
                                              Theme.of(context).buttonColor,
                                              FontWeight.w500,
                                              'FontRegular'),
                                      textAlign: TextAlign.center,
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
                                left: 10.0, right: 10.0, top: 3.0, bottom: 3.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: CustomTheme.of(context).errorColor,
                                border: Border.all(
                                  color: CustomTheme.of(context)
                                      .canvasColor
                                      .withOpacity(0.5),
                                )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  collapse ? "Collapes" : "Expand",
                                  style: CustomWidget(context: context)
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
                                  color: CustomTheme.of(context).hintColor,
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
                          height: MediaQuery.of(context).size.height * 0.4,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 25.0,
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 0.0,
                                        bottom: 0.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color:
                                            CustomTheme.of(context).errorColor,
                                        border: Border.all(
                                          color: CustomTheme.of(context)
                                              .canvasColor
                                              .withOpacity(0.5),
                                        )),
                                    child: Center(
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                          canvasColor: CustomTheme.of(context)
                                              .focusColor,
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            items: borrows
                                                .map((value) =>
                                                    DropdownMenuItem(
                                                      child: Text(
                                                        value,
                                                        style: CustomWidget(
                                                                context:
                                                                    context)
                                                            .CustomSizedTextStyle(
                                                                8.0,
                                                                Theme.of(
                                                                        context)
                                                                    .hintColor,
                                                                FontWeight.w500,
                                                                'FontRegular'),
                                                      ),
                                                      value: value,
                                                    ))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {});
                                            },
                                            isExpanded: false,
                                            value: selectedBorrow,
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: CustomTheme.of(context)
                                                  .hintColor,
                                              size: 12.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Container(
                                    height: 25.0,
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 0.0,
                                        bottom: 0.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: CustomTheme.of(context)
                                            .accentColor
                                            .withOpacity(0.5),
                                        border: Border.all(
                                          color: CustomTheme.of(context)
                                              .accentColor
                                              .withOpacity(0.5),
                                        )),
                                    child: Center(
                                      child: Text(
                                        "Borrow",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                8.0,
                                                CustomTheme.of(context)
                                                    .primaryColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                      child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    padding:
                                        EdgeInsets.only(top: 7.0, bottom: 7.0),
                                    child: Center(
                                      child: Text(
                                        "Sell",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                10.0,
                                                CustomTheme.of(context)
                                                    .focusColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                      ),
                                    ),
                                  )),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                      child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).buttonColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    padding:
                                        EdgeInsets.only(top: 7.0, bottom: 7.0),
                                    child: Center(
                                      child: Text(
                                        "Buy",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                10.0,
                                                CustomTheme.of(context)
                                                    .primaryColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                      ),
                                    ),
                                  ))
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
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: CustomTheme.of(context).errorColor,
                                    border: Border.all(
                                      color: CustomTheme.of(context)
                                          .canvasColor
                                          .withOpacity(0.5),
                                    )),
                                child: Center(
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      canvasColor:
                                          CustomTheme.of(context).focusColor,
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: orderType
                                            .map((value) => DropdownMenuItem(
                                                  child: Text(
                                                    value,
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            10.0,
                                                            Theme.of(context)
                                                                .hintColor,
                                                            FontWeight.w500,
                                                            'FontRegular'),
                                                  ),
                                                  value: value,
                                                ))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                        isExpanded: true,
                                        value: selectedType,
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color:
                                              CustomTheme.of(context).hintColor,
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
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CustomTheme.of(context)
                                            .splashColor
                                            .withOpacity(0.5),
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: CustomTheme.of(context).errorColor),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                          height: 30.0,
                                          width: 35.0,
                                          padding: const EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "-",
                                              style:
                                                  CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                          20.0,
                                                          Theme.of(context)
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
                                        controller: priceController,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                13.0,
                                                Theme.of(context).hintColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9.]')),
                                        ],
                                        onChanged: (value) {},
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 17.0),
                                            hintText: "Price",
                                            hintStyle: CustomWidget(
                                                    context: context)
                                                .CustomSizedTextStyle(
                                                    12.0,
                                                    Theme.of(context).hintColor,
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
                                      onTap: () {},
                                      child: Container(
                                          height: 30.0,
                                          width: 35.0,
                                          padding: const EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "+",
                                              style:
                                                  CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                          20.0,
                                                          Theme.of(context)
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
                                height: 5.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "=28,109.93 USD",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                          10.0,
                                          CustomTheme.of(context).canvasColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CustomTheme.of(context)
                                            .splashColor
                                            .withOpacity(0.5),
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: CustomTheme.of(context).errorColor),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                          height: 30.0,
                                          width: 35.0,
                                          padding: const EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "-",
                                              style:
                                                  CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                          20.0,
                                                          Theme.of(context)
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
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                13.0,
                                                Theme.of(context).hintColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9.]')),
                                        ],
                                        onChanged: (value) {},
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 20.0),
                                            hintText: "Amount(BTC)",
                                            hintStyle: CustomWidget(
                                                    context: context)
                                                .CustomSizedTextStyle(
                                                    10.0,
                                                    Theme.of(context).hintColor,
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
                                      onTap: () {},
                                      child: Container(
                                          height: 30.0,
                                          width: 35.0,
                                          padding: const EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "+",
                                              style:
                                                  CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                          20.0,
                                                          Theme.of(context)
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
                                  Container(
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
                                      padding: EdgeInsets.only(
                                          left: 7.0,
                                          right: 7.0,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: Center(
                                        child: Text(
                                          "25%",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  8.0,
                                                  Theme.of(context).canvasColor,
                                                  FontWeight.w500,
                                                  'FontRegular'),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  Container(
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
                                      padding: EdgeInsets.only(
                                          left: 7.0,
                                          right: 7.0,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: Center(
                                        child: Text(
                                          "50%",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  8.0,
                                                  Theme.of(context).canvasColor,
                                                  FontWeight.w500,
                                                  'FontRegular'),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  Container(
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
                                      padding: EdgeInsets.only(
                                          left: 7.0,
                                          right: 7.0,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: Center(
                                        child: Text(
                                          "75%",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  8.0,
                                                  Theme.of(context).canvasColor,
                                                  FontWeight.w500,
                                                  'FontRegular'),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  Container(
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
                                      padding: EdgeInsets.only(
                                          left: 7.0,
                                          right: 7.0,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: Center(
                                        child: Text(
                                          "100%",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  8.0,
                                                  Theme.of(context).canvasColor,
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
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: CustomTheme.of(context).errorColor,
                                    border: Border.all(
                                      color: CustomTheme.of(context)
                                          .canvasColor
                                          .withOpacity(0.5),
                                    )),
                                child: Center(
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      canvasColor:
                                          CustomTheme.of(context).focusColor,
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: volType
                                            .map((value) => DropdownMenuItem(
                                                  child: Text(
                                                    value,
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            10.0,
                                                            Theme.of(context)
                                                                .hintColor,
                                                            FontWeight.w500,
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
                                              CustomTheme.of(context).hintColor,
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
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "=0.00 USD",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                          10.0,
                                          CustomTheme.of(context).canvasColor,
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
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context).canvasColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    "=0.00 USD",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context).buttonColor,
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
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).buttonColor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                                child: Center(
                                  child: Text(
                                    "Buy BTC",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            14.0,
                                            CustomTheme.of(context).errorColor,
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
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                14.0,
                                                CustomTheme.of(context)
                                                    .canvasColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                      ),
                                      Text(
                                        "(USDT)",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                10.0,
                                                CustomTheme.of(context)
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
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                14.0,
                                                CustomTheme.of(context)
                                                    .canvasColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                      ),
                                      Text(
                                        "(BTC)",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                10.0,
                                                CustomTheme.of(context)
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "21,439.40",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                          10.0,
                                          CustomTheme.of(context)
                                              .indicatorColor,
                                          FontWeight.w500,
                                          'FontRegular'),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "=28,333.1 USD",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                          10.0,
                                          CustomTheme.of(context).canvasColor,
                                          FontWeight.w500,
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
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                  tradeCrossUI(),
                ],
              ),
            )));
  }

  Widget tradeCrossUI() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: NestedScrollView(
        controller: controller,
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
                isScrollable: false,
                labelColor: CustomTheme.of(context).buttonColor,

                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3.0,
                //<-- selected text color
                unselectedLabelColor: CustomTheme.of(context).primaryColor,
                // isScrollable: true,
                indicatorPadding:
                    EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                indicatorColor: CustomTheme.of(context).buttonColor,
                tabs: <Tab>[
                  Tab(
                    text: "Position",
                  ),
                  Tab(text: "My Orders")
                ],
                controller: _tabCrossController,
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
                        CustomTheme.of(context).buttonColor,
                        FontWeight.w500,
                        'FontRegular'),
                  ),
                ),
              ),
              Container(
                height: 150.0,
                child: Center(
                  child: Text(
                    "No Records Found....!",
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                        14.0,
                        CustomTheme.of(context).buttonColor,
                        FontWeight.w500,
                        'FontRegular'),
                  ),
                ),
              ),
            ],
            controller: _tabCrossController,
          ),
        ),
      ),
    );
  }

  Widget FuturetradeUI() {
    return Container(
        color: CustomTheme.of(context).focusColor,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "BTCUSDT",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        18.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "+ 1.76%",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).indicatorColor,
                                        FontWeight.w700,
                                        'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      )
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
                                left: 10.0, right: 10.0, top: 3.0, bottom: 3.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: CustomTheme.of(context).errorColor,
                                border: Border.all(
                                  color: CustomTheme.of(context)
                                      .canvasColor
                                      .withOpacity(0.5),
                                )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  collapse ? "Collapes" : "Expand",
                                  style: CustomWidget(context: context)
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
                                  color: CustomTheme.of(context).hintColor,
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
                          height: MediaQuery.of(context).size.height * 0.4,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 25.0,
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 0.0,
                                        bottom: 0.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color:
                                            CustomTheme.of(context).errorColor,
                                        border: Border.all(
                                          color: CustomTheme.of(context)
                                              .canvasColor
                                              .withOpacity(0.5),
                                        )),
                                    child: Center(
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                          canvasColor: CustomTheme.of(context)
                                              .focusColor,
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            items: borrows
                                                .map((value) =>
                                                    DropdownMenuItem(
                                                      child: Text(
                                                        value,
                                                        style: CustomWidget(
                                                                context:
                                                                    context)
                                                            .CustomSizedTextStyle(
                                                                8.0,
                                                                Theme.of(
                                                                        context)
                                                                    .hintColor,
                                                                FontWeight.w500,
                                                                'FontRegular'),
                                                      ),
                                                      value: value,
                                                    ))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {});
                                            },
                                            isExpanded: false,
                                            value: selectedBorrow,
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: CustomTheme.of(context)
                                                  .hintColor,
                                              size: 12.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Container(
                                    height: 25.0,
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 0.0,
                                        bottom: 0.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: CustomTheme.of(context)
                                            .accentColor
                                            .withOpacity(0.5),
                                        border: Border.all(
                                          color: CustomTheme.of(context)
                                              .accentColor
                                              .withOpacity(0.5),
                                        )),
                                    child: Center(
                                      child: Text(
                                        "Borrow",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                8.0,
                                                CustomTheme.of(context)
                                                    .primaryColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                      child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    padding:
                                        EdgeInsets.only(top: 7.0, bottom: 7.0),
                                    child: Center(
                                      child: Text(
                                        "Sell",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                10.0,
                                                CustomTheme.of(context)
                                                    .focusColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                      ),
                                    ),
                                  )),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                      child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).buttonColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    padding:
                                        EdgeInsets.only(top: 7.0, bottom: 7.0),
                                    child: Center(
                                      child: Text(
                                        "Buy",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                10.0,
                                                CustomTheme.of(context)
                                                    .primaryColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                      ),
                                    ),
                                  ))
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
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: CustomTheme.of(context).errorColor,
                                    border: Border.all(
                                      color: CustomTheme.of(context)
                                          .canvasColor
                                          .withOpacity(0.5),
                                    )),
                                child: Center(
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      canvasColor:
                                          CustomTheme.of(context).focusColor,
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: orderType
                                            .map((value) => DropdownMenuItem(
                                                  child: Text(
                                                    value,
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            10.0,
                                                            Theme.of(context)
                                                                .hintColor,
                                                            FontWeight.w500,
                                                            'FontRegular'),
                                                  ),
                                                  value: value,
                                                ))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                        isExpanded: true,
                                        value: selectedType,
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color:
                                              CustomTheme.of(context).hintColor,
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
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CustomTheme.of(context)
                                            .splashColor
                                            .withOpacity(0.5),
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: CustomTheme.of(context).errorColor),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                          height: 30.0,
                                          width: 35.0,
                                          padding: const EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "-",
                                              style:
                                                  CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                          20.0,
                                                          Theme.of(context)
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
                                        controller: priceController,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                13.0,
                                                Theme.of(context).hintColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9.]')),
                                        ],
                                        onChanged: (value) {},
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 17.0),
                                            hintText: "Price",
                                            hintStyle: CustomWidget(
                                                    context: context)
                                                .CustomSizedTextStyle(
                                                    12.0,
                                                    Theme.of(context).hintColor,
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
                                      onTap: () {},
                                      child: Container(
                                          height: 30.0,
                                          width: 35.0,
                                          padding: const EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "+",
                                              style:
                                                  CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                          20.0,
                                                          Theme.of(context)
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
                                height: 5.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "=28,109.93 USD",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                          10.0,
                                          CustomTheme.of(context).canvasColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CustomTheme.of(context)
                                            .splashColor
                                            .withOpacity(0.5),
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: CustomTheme.of(context).errorColor),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                          height: 30.0,
                                          width: 35.0,
                                          padding: const EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "-",
                                              style:
                                                  CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                          20.0,
                                                          Theme.of(context)
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
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                13.0,
                                                Theme.of(context).hintColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9.]')),
                                        ],
                                        onChanged: (value) {},
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 20.0),
                                            hintText: "Amount(BTC)",
                                            hintStyle: CustomWidget(
                                                    context: context)
                                                .CustomSizedTextStyle(
                                                    10.0,
                                                    Theme.of(context).hintColor,
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
                                      onTap: () {},
                                      child: Container(
                                          height: 30.0,
                                          width: 35.0,
                                          padding: const EdgeInsets.only(
                                            left: 10.0,
                                            right: 10.0,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "+",
                                              style:
                                                  CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                          20.0,
                                                          Theme.of(context)
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
                                  Container(
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
                                      padding: EdgeInsets.only(
                                          left: 7.0,
                                          right: 7.0,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: Center(
                                        child: Text(
                                          "25%",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  8.0,
                                                  Theme.of(context).canvasColor,
                                                  FontWeight.w500,
                                                  'FontRegular'),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  Container(
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
                                      padding: EdgeInsets.only(
                                          left: 7.0,
                                          right: 7.0,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: Center(
                                        child: Text(
                                          "50%",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  8.0,
                                                  Theme.of(context).canvasColor,
                                                  FontWeight.w500,
                                                  'FontRegular'),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  Container(
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
                                      padding: EdgeInsets.only(
                                          left: 7.0,
                                          right: 7.0,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: Center(
                                        child: Text(
                                          "75%",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  8.0,
                                                  Theme.of(context).canvasColor,
                                                  FontWeight.w500,
                                                  'FontRegular'),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  Container(
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
                                      padding: EdgeInsets.only(
                                          left: 7.0,
                                          right: 7.0,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: Center(
                                        child: Text(
                                          "100%",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  8.0,
                                                  Theme.of(context).canvasColor,
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
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: CustomTheme.of(context).errorColor,
                                    border: Border.all(
                                      color: CustomTheme.of(context)
                                          .canvasColor
                                          .withOpacity(0.5),
                                    )),
                                child: Center(
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      canvasColor:
                                          CustomTheme.of(context).focusColor,
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: volType
                                            .map((value) => DropdownMenuItem(
                                                  child: Text(
                                                    value,
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            10.0,
                                                            Theme.of(context)
                                                                .hintColor,
                                                            FontWeight.w500,
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
                                              CustomTheme.of(context).hintColor,
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
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "=0.00 USD",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                          10.0,
                                          CustomTheme.of(context).canvasColor,
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
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context).canvasColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    "=0.00 USD",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context).buttonColor,
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
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).buttonColor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                                child: Center(
                                  child: Text(
                                    "Enable Contract Trading",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            12.0,
                                            CustomTheme.of(context).errorColor,
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
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                14.0,
                                                CustomTheme.of(context)
                                                    .canvasColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                      ),
                                      Text(
                                        "(USDT)",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                10.0,
                                                CustomTheme.of(context)
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
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                14.0,
                                                CustomTheme.of(context)
                                                    .canvasColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                      ),
                                      Text(
                                        "(BTC)",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                10.0,
                                                CustomTheme.of(context)
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "21,439.40",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                          10.0,
                                          CustomTheme.of(context)
                                              .indicatorColor,
                                          FontWeight.w500,
                                          'FontRegular'),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "=28,333.1 USD",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                          10.0,
                                          CustomTheme.of(context).canvasColor,
                                          FontWeight.w500,
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
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "0.777",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            CustomTheme.of(context)
                                                .indicatorColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                  ),
                                  Text(
                                    "73.755",
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
                  tradeCrossUI(),
                ],
              ),
            )));
  }

  Widget FiattradeUI() {
    return Container(
        color: CustomTheme.of(context).focusColor,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "BTCUSDT",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        18.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "+ 1.76%",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).indicatorColor,
                                        FontWeight.w700,
                                        'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Row(
                            children: [
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
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: collapse ? 15.0 : 1.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Flexible(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          fiatOption = false;
                                        });
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: !fiatOption
                                                ? Theme.of(context).buttonColor
                                                : Theme.of(context)
                                                    .primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        padding: EdgeInsets.only(
                                            top: 7.0, bottom: 7.0),
                                        child: Center(
                                          child: Text(
                                            "Auto",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        10.0,
                                                        !fiatOption
                                                            ? CustomTheme.of(
                                                                    context)
                                                                .primaryColor
                                                            : CustomTheme.of(
                                                                    context)
                                                                .focusColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                      child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        fiatOption = true;
                                      });
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: fiatOption
                                              ? Theme.of(context).buttonColor
                                              : Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      padding: EdgeInsets.only(
                                          top: 7.0, bottom: 7.0),
                                      child: Center(
                                        child: Text(
                                          "Customize",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  10.0,
                                                  fiatOption
                                                      ? CustomTheme.of(context)
                                                          .primaryColor
                                                      : CustomTheme.of(context)
                                                          .focusColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                        ),
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                              flex: 2,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Flexible(
                              child: Text(
                                "30222.44",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        20.0,
                                        Theme.of(context).buttonColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                              ),
                              flex: 1,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price Range(BTC)",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      12.0,
                                      Theme.of(context).canvasColor,
                                      FontWeight.w500,
                                      'FontRegular'),
                            ),
                            Text(
                              "2122-25200",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      14.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w400,
                                      'FontRegular'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "No.of Placed Orders",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      12.0,
                                      Theme.of(context).canvasColor,
                                      FontWeight.w500,
                                      'FontRegular'),
                            ),
                            Text(
                              "100",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      14.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w400,
                                      'FontRegular'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Profit/Grid (Fees Deducted)",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      12.0,
                                      Theme.of(context).canvasColor,
                                      FontWeight.w400,
                                      'FontRegular'),
                            ),
                            Text(
                              "0.30% - 0.77%",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      14.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w500,
                                      'FontRegular'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Investment",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      12.0,
                                      Theme.of(context).canvasColor,
                                      FontWeight.w400,
                                      'FontRegular'),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                      top: 2.0,
                                      bottom: 2.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Theme.of(context).canvasColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "USDT",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                              14.0,
                                              Theme.of(context).primaryColor,
                                              FontWeight.w500,
                                              'FontRegular'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                      top: 2.0,
                                      bottom: 2.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "BTC-USDT",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                              14.0,
                                              Theme.of(context).hintColor,
                                              FontWeight.w500,
                                              'FontRegular'),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: CustomTheme.of(context)
                                      .splashColor
                                      .withOpacity(0.5),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                              color: CustomTheme.of(context).errorColor),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                    height: 30.0,
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Min-60",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                12.0,
                                                Theme.of(context).canvasColor,
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
                                  controller: priceController,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                          13.0,
                                          Theme.of(context).hintColor,
                                          FontWeight.w500,
                                          'FontRegular'),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9.]')),
                                  ],
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(bottom: 12.0),
                                      hintText: "0.000",
                                      hintStyle: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                              14.0,
                                              Theme.of(context).hintColor,
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
                                onTap: () {},
                                child: Container(
                                    height: 30.0,
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "USDT",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                12.0,
                                                Theme.of(context).canvasColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: CustomTheme.of(context).errorColor,
                                      border: Border.all(
                                        color: CustomTheme.of(context)
                                            .canvasColor
                                            .withOpacity(0.5),
                                      )),
                                  padding: EdgeInsets.only(
                                      left: 7.0,
                                      right: 7.0,
                                      top: 7.0,
                                      bottom: 7.0),
                                  child: Center(
                                    child: Text(
                                      "MIN",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                              8.0,
                                              Theme.of(context).canvasColor,
                                              FontWeight.w500,
                                              'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                              flex: 1,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Flexible(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: CustomTheme.of(context).errorColor,
                                      border: Border.all(
                                        color: CustomTheme.of(context)
                                            .canvasColor
                                            .withOpacity(0.5),
                                      )),
                                  padding: EdgeInsets.only(
                                      left: 7.0,
                                      right: 7.0,
                                      top: 7.0,
                                      bottom: 7.0),
                                  child: Center(
                                    child: Text(
                                      "25%",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                              8.0,
                                              Theme.of(context).canvasColor,
                                              FontWeight.w500,
                                              'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                              flex: 1,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Flexible(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: CustomTheme.of(context).errorColor,
                                      border: Border.all(
                                        color: CustomTheme.of(context)
                                            .canvasColor
                                            .withOpacity(0.5),
                                      )),
                                  padding: EdgeInsets.only(
                                      left: 7.0,
                                      right: 7.0,
                                      top: 7.0,
                                      bottom: 7.0),
                                  child: Center(
                                    child: Text(
                                      "50%",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                              8.0,
                                              Theme.of(context).canvasColor,
                                              FontWeight.w500,
                                              'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                              flex: 1,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Flexible(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: CustomTheme.of(context).errorColor,
                                      border: Border.all(
                                        color: CustomTheme.of(context)
                                            .canvasColor
                                            .withOpacity(0.5),
                                      )),
                                  padding: EdgeInsets.only(
                                      left: 7.0,
                                      right: 7.0,
                                      top: 7.0,
                                      bottom: 7.0),
                                  child: Center(
                                    child: Text(
                                      "MAX",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                              8.0,
                                              Theme.of(context).canvasColor,
                                              FontWeight.w500,
                                              'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                              flex: 1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trading Account Available",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      12.0,
                                      CustomTheme.of(context).canvasColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              "0.00 USD",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      14.0,
                                      CustomTheme.of(context).primaryColor,
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
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Theme.of(context).buttonColor,
                              borderRadius: BorderRadius.circular(10.0)),
                          padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                          child: Center(
                            child: Text(
                              "Create",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      14.0,
                                      CustomTheme.of(context).errorColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  FiatOpenUI()
                ],
              ),
            )));
  }

  Widget FiatOpenUI() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: NestedScrollView(
        controller: controller,
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
                isScrollable: false,
                labelColor: CustomTheme.of(context).buttonColor,

                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3.0,
                //<-- selected text color
                unselectedLabelColor: CustomTheme.of(context).primaryColor,
                // isScrollable: true,
                indicatorPadding:
                    EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                indicatorColor: CustomTheme.of(context).buttonColor,
                tabs: <Tab>[
                  Tab(
                    text: "Current Strategies",
                  ),
                ],
                controller: _tabFiatController,
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
                        CustomTheme.of(context).buttonColor,
                        FontWeight.w500,
                        'FontRegular'),
                  ),
                ),
              ),
              Container(
                height: 150.0,
                child: Center(
                  child: Text(
                    "No Records Found....!",
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                        14.0,
                        CustomTheme.of(context).buttonColor,
                        FontWeight.w500,
                        'FontRegular'),
                  ),
                ),
              ),
              Container(
                height: 150.0,
                child: Center(
                  child: Text(
                    "No Records Found....!",
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                        14.0,
                        CustomTheme.of(context).buttonColor,
                        FontWeight.w500,
                        'FontRegular'),
                  ),
                ),
              ),
            ],
            controller: _tabFiatController,
          ),
        ),
      ),
    );
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
            b.priceChangePercent24Hr!.compareTo(a.priceChangePercent24Hr!));
    });
  }
}
