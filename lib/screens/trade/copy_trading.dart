import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/screens/trade/copy_trade_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CopyTrading extends StatefulWidget {
  const CopyTrading({Key? key}) : super(key: key);

  @override
  State<CopyTrading> createState() => _CopyTradingState();
}

class _CopyTradingState extends State<CopyTrading>
    with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  ScrollController controller = ScrollController();
  TextEditingController amtController = TextEditingController();
  TextEditingController coinController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  List<String> options = ["collapes"];
  List<String> borrows = ["Manual Borrow", "Auto Borrow"];
  List<String> orderType = ["Limit", "Market"];
  List<String> volType = ["Vol(USDT)"];
  String selectedOption = "";
  String selectedBorrow = "";
  String selectedType = "";
  String selectedVol = "";
  List<String> textTrade = [
    "Life is Good",
    "Small Goals",
    "All in Crypto",
    "Be Cool",
    "Making Money",
    "Intro World"
  ];
  bool collapse = false;
  late TabController _tabTradeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedOption = options.first;
    selectedBorrow = borrows.first;
    selectedType = orderType.first;
    selectedVol = volType.first;
    _tabTradeController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: CustomTheme.of(context).backgroundColor,
        child: tradeUI(),
      ),
    ));
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                        right: 10.0, bottom: 3.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          collapse
                                              ? "Current Price"
                                              : "Last Price",
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
                                          color:
                                              CustomTheme.of(context).hintColor,
                                          size: 15.0,
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "28853.22",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        18.0,
                                        Theme.of(context).indicatorColor,
                                        FontWeight.w700,
                                        'FontRegular'),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$144444.46",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w500,
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
                              const SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mark price",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w500,
                                            'FontRegular'),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "20,0929.81",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            12.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "24h high",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w500,
                                            'FontRegular'),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "732.32",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            8.0,
                                            Theme.of(context).canvasColor,
                                            FontWeight.w700,
                                            'FontRegular'),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "24h low",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w500,
                                            'FontRegular'),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "43.98",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            8.0,
                                            Theme.of(context).canvasColor,
                                            FontWeight.w700,
                                            'FontRegular'),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "24h vol(BTC)",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w500,
                                            'FontRegular'),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "413.09",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            8.0,
                                            Theme.of(context).canvasColor,
                                            FontWeight.w700,
                                            'FontRegular'),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "24h vol(USDT)",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            FontWeight.w500,
                                            'FontRegular'),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "82.23M",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            8.0,
                                            Theme.of(context).canvasColor,
                                            FontWeight.w700,
                                            'FontRegular'),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
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
                  SizedBox(
                    height: collapse ? 15.0 : 1.0,
                  ),
                  SingleChildScrollView(
                    child: ListView.builder(
                      itemCount: textTrade.length,
                      shrinkWrap: true,
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
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/profile/Icon.svg",
                                              ),
                                              const SizedBox(
                                                width: 15.0,
                                              ),
                                              Text(
                                                textTrade[index],
                                                style: CustomWidget(
                                                        context: context)
                                                    .CustomSizedTextStyle(
                                                        14.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w400,
                                                        'FontRegular'),
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "+178.005%",
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        16.0,
                                                        Theme.of(context)
                                                            .primaryColorLight,
                                                        FontWeight.w400,
                                                        'FontRegular'),
                                          ),
                                        ],
                                      ),
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      "PnL% in 30days",
                                                      style: CustomWidget(
                                                              context: context)
                                                          .CustomTextStyle(
                                                              Theme.of(context)
                                                                  .canvasColor,
                                                              FontWeight.w400,
                                                              'FontRegular'),
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    const SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "30d PnL",
                                                          style: CustomWidget(
                                                                  context:
                                                                      context)
                                                              .CustomTextStyle(
                                                                  Theme.of(
                                                                          context)
                                                                      .canvasColor,
                                                                  FontWeight
                                                                      .w400,
                                                                  'FontRegular'),
                                                          softWrap: true,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        const SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text(
                                                          "\$4522.085",
                                                          style: CustomWidget(
                                                                  context:
                                                                      context)
                                                              .CustomTextStyle(
                                                                  Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  FontWeight
                                                                      .w400,
                                                                  'FontRegular'),
                                                          softWrap: true,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Win rate",
                                                          style: CustomWidget(
                                                                  context:
                                                                      context)
                                                              .CustomTextStyle(
                                                                  Theme.of(
                                                                          context)
                                                                      .canvasColor,
                                                                  FontWeight
                                                                      .w400,
                                                                  'FontRegular'),
                                                          softWrap: true,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        const SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text(
                                                          "98.05%",
                                                          style: CustomWidget(
                                                                  context:
                                                                      context)
                                                              .CustomTextStyle(
                                                                  Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  FontWeight
                                                                      .w400,
                                                                  'FontRegular'),
                                                          softWrap: true,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                ),
                                                SvgPicture.asset(index % 2 == 0
                                                    ? 'assets/icon/graph_success.svg'
                                                    : 'assets/icon/graph_fail.svg'),
                                              ],
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 20.0, right: 20.0),
                                              height: 0.5,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color:
                                                  Theme.of(context).canvasColor,
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "AUM",
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomTextStyle(
                                                            Theme.of(context)
                                                                .canvasColor,
                                                            FontWeight.w400,
                                                            'FontRegular'),
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    "\$15022.8503",
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomTextStyle(
                                                            Theme.of(context)
                                                                .primaryColor,
                                                            FontWeight.w400,
                                                            'FontRegular'),
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Copy Trade PnL",
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomTextStyle(
                                                            Theme.of(context)
                                                                .canvasColor,
                                                            FontWeight.w400,
                                                            'FontRegular'),
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    "\$1020.8503",
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomTextStyle(
                                                            Theme.of(context)
                                                                .primaryColor,
                                                            FontWeight.w400,
                                                            'FontRegular'),
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            InkWell(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 15.0, right: 15.0),
                                                padding: EdgeInsets.only(
                                                    top: 8.0, bottom: 8.0),
                                                child: Center(
                                                  child: Text(
                                                    index % 2 == 0
                                                        ? "Vacancy remainder"
                                                        : "Copy",
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            18.0,
                                                            index % 2 == 0
                                                                ? Theme.of(
                                                                        context)
                                                                    .primaryColor
                                                                : Theme.of(
                                                                        context)
                                                                    .canvasColor,
                                                            FontWeight.w500,
                                                            'FontRegular'),
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0),
                                                    border: Border.all(
                                                      color: Theme.of(context)
                                                          .canvasColor,
                                                    ),
                                                    color: index % 2 == 0
                                                        ? Theme.of(context)
                                                            .canvasColor
                                                            .withOpacity(0.2)
                                                        : Theme.of(context)
                                                            .errorColor),
                                              ),
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CopyTradeDetails(
                                                                textVal:
                                                                    textTrade[
                                                                        index])));
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
                        );
                      },
                    ),
                  )
                ],
              ),
            )));
  }

  Widget tradeOpenUI() {
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
                    text: "Last Trades",
                  ),
                  Tab(
                    text: "Info",
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
}
