import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/data_model/graph_ql_utils.dart';
import 'package:cofinex/data_model/model/ticker_data_model.dart';
import 'package:cofinex/data_model/query_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpotTrade extends StatefulWidget {
  const SpotTrade({Key? key}) : super(key: key);

  @override
  State<SpotTrade> createState() => _SpotTradeState();
}

class _SpotTradeState extends State<SpotTrade>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  ScrollController controller = ScrollController();

  List<String> orderType = ["Limit", "Market"];
  List<String> volType = ["Vol(USDT)"];
  List<AllTicker> allTicker = [];
  List<AllTicker> searchPair = [];
  AllTicker? selectPair;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedType = orderType.first;
    selectedVol = volType.first;
    _tabTradeController = TabController(vsync: this, length: 3);
    loading = true;
    fillList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        selectPair !=null?    Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                   InkWell(

                                     child:   Text(
                                       coinOne+coinTwo,
                                       style: CustomWidget(context: context)
                                           .CustomSizedTextStyle(
                                           18.0,
                                           Theme.of(context).primaryColor,
                                           FontWeight.w600,
                                           'FontRegular'),
                                       textAlign: TextAlign.center,
                                     ),
                                     onTap: (){
                                       showSheeet();
                                     },
                                   ),

                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      double.parse(selectPair!.priceChangePercent24Hr.toString()).toStringAsFixed(2),
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                              12.0,
                                          double.parse(
                                              selectPair!.priceChangePercent24Hr.toString()) >
                                              0?  Theme.of(context).indicatorColor:Theme.of(context)
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
                                                .buttonColor
                                                .withOpacity(0.1),
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .buttonColor),
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
                                            style:
                                                CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                        12.0,
                                                        Theme.of(context)
                                                            .buttonColor,
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
                            ):Container()
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
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: CustomTheme.of(context).errorColor,
                                      border: Border.all(
                                        color: CustomTheme.of(context)
                                            .canvasColor
                                            .withOpacity(0.5),
                                      )),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                        color:
                                            CustomTheme.of(context).hintColor,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
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
                                              onTap: (){
                                                setState(() {
                                                  tradeOption=false;
                                                });

                                              },
                                              child: Container(
                                                width:
                                                MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    borderRadius:
                                                    BorderRadius.circular(5.0)),
                                                padding: EdgeInsets.only(
                                                    top: 7.0, bottom: 7.0),
                                                child: Center(
                                                  child: Text(
                                                    "Sell",
                                                    style: CustomWidget(
                                                        context: context)
                                                        .CustomSizedTextStyle(
                                                        10.0,
                                                        CustomTheme.of(context)
                                                            .focusColor,
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

                                              onTap: (){

                                                setState(() {
                                                  tradeOption=true;
                                                });
                                              },
                                              child: Container(
                                                width:
                                                MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                    color:
                                                    Theme.of(context).buttonColor,
                                                    borderRadius:
                                                    BorderRadius.circular(5.0)),
                                                padding: EdgeInsets.only(
                                                    top: 7.0, bottom: 7.0),
                                                child: Center(
                                                  child: Text(
                                                    "Buy",
                                                    style: CustomWidget(
                                                        context: context)
                                                        .CustomSizedTextStyle(
                                                        10.0,
                                                        CustomTheme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                                  ),
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
                                            canvasColor: CustomTheme.of(context)
                                                .focusColor,
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              items: orderType
                                                  .map((value) =>
                                                      DropdownMenuItem(
                                                        child: Text(
                                                          value,
                                                          style: CustomWidget(
                                                                  context:
                                                                      context)
                                                              .CustomSizedTextStyle(
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
                                              value: selectedType,
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                color: CustomTheme.of(context)
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
                                                    style: CustomWidget(
                                                            context: context)
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
                                                      .numberWithOptions(
                                                  decimal: true),
                                              style:
                                                  CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                          13.0,
                                                          Theme.of(context)
                                                              .hintColor,
                                                          FontWeight.w500,
                                                          'FontRegular'),
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[0-9.]')),
                                              ],
                                              onChanged: (value) {},
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          bottom: 17.0),
                                                  hintText: "Price",
                                                  hintStyle: CustomWidget(
                                                          context: context)
                                                      .CustomSizedTextStyle(
                                                          12.0,
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
                                                    style: CustomWidget(
                                                            context: context)
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
                                    selectPair !=null?  "= "+  selectPair!.marketPrice.toString()+coinTwo:"",
                                        style: CustomWidget(context: context)
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

                                            },
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
                                                    style: CustomWidget(
                                                            context: context)
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
                                                      .numberWithOptions(
                                                  decimal: true),
                                              style:
                                                  CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                          13.0,
                                                          Theme.of(context)
                                                              .hintColor,
                                                          FontWeight.w500,
                                                          'FontRegular'),
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[0-9.]')),
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
                                                    style: CustomWidget(
                                                            context: context)
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
                                            canvasColor: CustomTheme.of(context)
                                                .focusColor,
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              items: volType
                                                  .map((value) =>
                                                      DropdownMenuItem(
                                                        child: Text(
                                                          value,
                                                          style: CustomWidget(
                                                                  context:
                                                                      context)
                                                              .CustomSizedTextStyle(
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
                                                color: CustomTheme.of(context)
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
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        selectPair !=null?  "= "+  selectPair!.marketPrice.toString()+coinTwo:"",
                                        style: CustomWidget(context: context)
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
                                          style: CustomWidget(context: context)
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
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  10.0,
                                                  CustomTheme.of(context)
                                                      .buttonColor,
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
                                          color:tradeOption? Theme.of(context).buttonColor:Theme.of(context)
                                              .primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      padding: EdgeInsets.only(
                                          top: 7.0, bottom: 7.0),
                                      child: Center(
                                        child: Text(
                                          tradeOption?"Buy "+coinOne:"Sell "+coinTwo,
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  14.0,
                                                  CustomTheme.of(context)
                                                      .errorColor,
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
                                                      CustomTheme.of(context)
                                                          .canvasColor,
                                                      FontWeight.w500,
                                                      'FontRegular'),
                                            ),
                                            Text(
                                              "(USDT)",
                                              style: CustomWidget(
                                                      context: context)
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
                                              style: CustomWidget(
                                                      context: context)
                                                  .CustomSizedTextStyle(
                                                      14.0,
                                                      CustomTheme.of(context)
                                                          .canvasColor,
                                                      FontWeight.w500,
                                                      'FontRegular'),
                                            ),
                                            Text(
                                              "(BTC)",
                                              style: CustomWidget(
                                                      context: context)
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
                                                  CustomTheme.of(context)
                                                      .canvasColor,
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
                                                  CustomTheme.of(context)
                                                      .canvasColor,
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
                                                  CustomTheme.of(context)
                                                      .canvasColor,
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
                                                  CustomTheme.of(context)
                                                      .canvasColor,
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
                                                  CustomTheme.of(context)
                                                      .canvasColor,
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
                                                  CustomTheme.of(context)
                                                      .canvasColor,
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
                                                CustomTheme.of(context)
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
                                                  CustomTheme.of(context)
                                                      .canvasColor,
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
                                                  CustomTheme.of(context)
                                                      .canvasColor,
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
                                                  CustomTheme.of(context)
                                                      .canvasColor,
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
                                                  CustomTheme.of(context)
                                                      .canvasColor,
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
                                                  CustomTheme.of(context)
                                                      .canvasColor,
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
                                                  CustomTheme.of(context)
                                                      .canvasColor,
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
                                                  CustomTheme.of(context)
                                                      .canvasColor,
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
                        tradeOpenUI()
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
    );
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
            controller: _tabTradeController,
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
      selectPair = allTicker[0];
      coinOne=allTicker[0].pair!.split("-")[0].toString();
      coinTwo=allTicker[0].pair!.split("-")[1].toString();
      searchPair.addAll(allTicker);
    });
  }

  showSheeet() {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (contexts) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setStates) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
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
                              Navigator.pop(context);
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
                            controller: controller,
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


                                      setStates(() {
                                        selectPair=searchPair[index];
                                        coinOne=selectPair!.pair!.split("-")[0].toString();
                                        coinTwo=selectPair!.pair!.split("-")[1].toString();
                                      });

                                      Navigator.pop(context);
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
                                                  Theme.of(context).primaryColor,
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
}
