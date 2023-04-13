import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({Key? key}) : super(key: key);

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen>
    with SingleTickerProviderStateMixin {
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
  List<String> borrows = ["Manual Borrow"];
  List<String> orderType = ["Limit", "Market"];
  List<String> volType = ["Vol(USDT)"];
  String selectedOption = "";
  String selectedBorrow = "";
  String selectedType = "";
  String selectedVol = "";
  TextEditingController amtController = TextEditingController();
  TextEditingController coinController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  late TabController _tabController;
  bool collapse = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedOption = options.first;
    selectedBorrow = borrows.first;
    selectedType = orderType.first;
    selectedVol = volType.first;
    _tabController = TabController(vsync: this, length: 7);
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
                    tradeUI(),
                    tradeUI(),
                    tradeUI(),
                    tradeUI(),
                    tradeUI(),

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

  Widget tradeUI() {
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
                                          Theme.of(context).primaryColor,
                                          FontWeight.w500,
                                          'FontRegular'),
                                ),
                                Icon(
                                  collapse
                                      ? Icons.arrow_drop_up_sharp
                                      : Icons.arrow_drop_down,
                                  color: CustomTheme.of(context).primaryColor,
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
                  collapse?   Image.asset(
                    'assets/icon/graph.png',
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ):Container(),
                   SizedBox(
                    height: collapse?15.0:1.0,
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
                                  const SizedBox(width: 5.0,),
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
                ],
              ),
            )));
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
                                          Theme.of(context).primaryColor,
                                          FontWeight.w500,
                                          'FontRegular'),
                                ),
                                Icon(
                                  collapse
                                      ? Icons.arrow_drop_up_sharp
                                      : Icons.arrow_drop_down,
                                  color: CustomTheme.of(context).primaryColor,
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
                  collapse?   Image.asset(
                    'assets/icon/graph.png',
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ):Container(),
                   SizedBox(
                    height: collapse?15.0:1.0,
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
                                  const SizedBox(width: 5.0,),
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
                ],
              ),
            )));
  }
}
