import 'package:cofinex/data_model/model/copy_trade_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/theme/custom_theme.dart';

class CopyTradeOverviewDetails extends StatefulWidget {
  final CopyTrade data;
  const CopyTradeOverviewDetails({Key? key, required this.data}) : super(key: key);

  @override
  State<CopyTradeOverviewDetails> createState() => _CopyTradeOverviewDetailsState();
}

class _CopyTradeOverviewDetailsState extends State<CopyTradeOverviewDetails>
    with TickerProviderStateMixin {

  late TabController _tabController;
  late TabController _tabSpotsController;
  ScrollController _scrollController = ScrollController();
  ScrollController controller = ScrollController();
  ScrollController _scroller = ScrollController();
  List<String> orderType = ["All", "Details"];
  String selectedType = "";
  List<String> imgText = ["High profit", "Secure","Most popular","Most popular","Most popular"];
  bool his = false;
  CopyTrade? copyData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 1);
    _tabSpotsController = TabController(vsync: this, length: 1);
    selectedType = orderType.first;
    his=false;
    copyData=widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: CustomTheme.of(context).focusColor,
            elevation: 0.0,
            leading: Container(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 22.0,
                    color: CustomTheme.of(context).primaryColor,
                  ),
                )),
            centerTitle: true,
            title: Text(
              " ",
              style: CustomWidget(context: context).CustomSizedTextStyle(
                  16.0,
                  Theme.of(context).splashColor,
                  FontWeight.w500,
                  'FontRegular'),
            ),
            actions: [
              Ink(
                child: Container(
                  padding: EdgeInsets.only(right: 15.0),
                  child:  Icon(Icons.more_horiz, size: 25.0, color: Theme.of(context).primaryColor,),
                ),
              )
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: CustomTheme.of(context).focusColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              copyData!.traderNickName.toString(),
                              style: CustomWidget(
                                  context: context)
                                  .CustomSizedTextStyle(
                                  18.0,
                                  Theme.of(context)
                                      .primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                            const SizedBox(height: 5.0,),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 7.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Theme.of(context).primaryColorLight.withOpacity(0.3),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "High profit",
                                      style: CustomWidget(
                                          context: context)
                                          .CustomSizedTextStyle(
                                          9.0,
                                          Theme.of(context)
                                              .primaryColorLight,
                                          FontWeight.w500,
                                          'FontRegular'),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5.0,),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 7.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Theme.of(context).primaryColorLight.withOpacity(0.3),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Secure",
                                      style: CustomWidget(
                                          context: context)
                                          .CustomSizedTextStyle(
                                          9.0,
                                          Theme.of(context)
                                              .primaryColorLight,
                                          FontWeight.w500,
                                          'FontRegular'),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5.0,),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 7.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Theme.of(context).primaryColorLight.withOpacity(0.3),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Most popular",
                                      style: CustomWidget(
                                          context: context)
                                          .CustomSizedTextStyle(
                                          9.0,
                                          Theme.of(context)
                                              .primaryColorLight,
                                          FontWeight.w500,
                                          'FontRegular'),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color:Theme.of(context).focusColor,
                            shape: BoxShape.circle
                        ),
                        child: Image.asset("assets/images/bg.png", height: 50.0, fit: BoxFit.cover,),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30.0,),

                Container(
                  alignment: Alignment.center,
                  height: 35.0,
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.only(left: 15.0, right: 15.0),
                  padding: EdgeInsets.only(left: 0.2, right: 0.2),
                  decoration: BoxDecoration(
                      color: CustomTheme.of(context).focusColor,
                      border: Border(bottom: BorderSide(
                        width: 1.0,
                        color: CustomTheme.of(context).unselectedWidgetColor,
                      ))
                  ),
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorSize:TabBarIndicatorSize.label,
                    labelStyle: CustomWidget(context: context).CustomSizedTextStyle(
                        13.0,
                        Theme.of(context).unselectedWidgetColor,
                        FontWeight.w600,
                        'FontRegular'),

                    labelColor: CustomTheme.of(context).primaryColor,
                    //<-- selected text color
                    unselectedLabelColor:
                    CustomTheme.of(context).primaryColor.withOpacity(0.5),
                    // isScrollable: true,
                    indicatorColor: CustomTheme.of(context).cardColor,
                    indicator: BoxDecoration(
                      // borderRadius: BorderRadius.circular(12), // Creates border
                      border: Border(
                        bottom: BorderSide(width: 3.0, color: CustomTheme.of(context).primaryColorLight),
                      ),
                      color: CustomTheme.of(context).focusColor,
                    ),
                    tabs: <Widget>[

                      Tab(
                        text: "Futures",
                      ),
                      // Tab(
                      //   text: "Spot",
                      // ),

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

                        FutureUI(),
                        // SpotUI(),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }


  Widget FutureUI() {
    return Container(
        color: CustomTheme.of(context).focusColor,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star, size: 10.0, color: Theme.of(context).primaryColorLight,
                              ),
                              Icon(
                                Icons.star, size: 10.0, color: Theme.of(context).primaryColorLight,
                              ),
                              Icon(
                                Icons.star, size: 10.0, color: Theme.of(context).primaryColorLight,
                              ),
                              Icon(
                                Icons.star, size: 10.0, color: Theme.of(context).primaryColorLight,
                              ),
                            ],
                          ),
                          Text(
                            "Equity (USDT)",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                8.0,
                                Theme.of(context).unselectedWidgetColor,
                                FontWeight.w600,
                                'FontRegular'),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            copyData!.totalTradeCount.toString(),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                          ),
                          Text(
                            "Total orders",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                8.0,
                                Theme.of(context).unselectedWidgetColor,
                                FontWeight.w600,
                                'FontRegular'),
                          ),

                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            copyData!.followCount.toString()+  " / "+ copyData!.maxFollowCount.toString(),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                          ),
                          Text(
                            "Investment ",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                8.0,
                                Theme.of(context).unselectedWidgetColor,
                                FontWeight.w600,
                                'FontRegular'),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1.0,
                  color: Theme.of(context).unselectedWidgetColor,
                ),
                const SizedBox(height: 15.0,),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: InkWell(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5.0,5.0,5.0,5.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Theme.of(context).primaryColorLight,
                          ),
                          child: Center(
                            child: Text(
                              "Copy",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  13.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                          ),
                        ),
                      ),flex: 9,),
                      const SizedBox(width: 15.0,),
                      Flexible(child: InkWell(
                        child: Container(
                          // width: MediaQuery.of(context).size.width ,
                          padding: EdgeInsets.fromLTRB(2.0,5.0,2.0,5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Theme.of(context).unselectedWidgetColor,
                          ),
                          child: Icon(
                            Icons.share, size: 20.0, color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ), flex: 1,)
                    ],
                  ),
                ),
                const SizedBox(height: 15.0,),
              ],
            ),

            OverviewUI()
          ],
        ));
  }

  Widget OverviewUI() {
    return Container(
      color: CustomTheme.of(context).focusColor,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 35.0,

            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.only(left: 15.0, right: 15.0),
            padding: EdgeInsets.only(left: 0.2, right: 0.2),
            decoration: BoxDecoration(
                color: CustomTheme.of(context).focusColor,
                border: Border(bottom: BorderSide(
                  width: 1.0,

                ))
            ),
            child: TabBar(
              controller: _tabSpotsController,
              isScrollable: true,
              indicatorSize:TabBarIndicatorSize.label ,
              labelStyle: CustomWidget(context: context).CustomSizedTextStyle(
                  13.0,
                  Theme.of(context).unselectedWidgetColor,
                  FontWeight.w600,
                  'FontRegular'),

              labelColor: CustomTheme.of(context).primaryColorLight,
              //<-- selected text color
              unselectedLabelColor:
              CustomTheme.of(context).primaryColor.withOpacity(0.5),
              // isScrollable: true,
              indicatorColor: CustomTheme.of(context).cardColor,
              indicator: BoxDecoration(
                // borderRadius: BorderRadius.circular(12), // Creates border
                border: Border(
                  bottom: BorderSide(width: 3.0, color: CustomTheme.of(context).primaryColorLight),
                ),
                color: CustomTheme.of(context).focusColor,
              ),
              tabs: <Widget>[
                // Tab(
                //   text: "Overview",
                // ),
                Tab(
                  text: "Stats",
                ),
                // Tab(
                //   text: "Orders",
                // ),
                // Tab(
                //   text: "Followers",
                // ),
                // Tab(
                //   text: "Insights",
                // ),

              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              color: CustomTheme.of(context).backgroundColor,
              child: TabBarView(
                controller: _tabSpotsController,
                children: <Widget>[

                  // Current(),
                  Stats(),
                  // Orders(),
                  // Followers(),
                  // Insights(),

                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0,),

        ],
      ),);
  }

  Widget Current() {
    return Container(
        color: CustomTheme.of(context).focusColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15.0),
                       color: Theme.of(context).focusColor,
                       // image: DecorationImage(
                       //   image: AssetImage('assets/images/chart1.svg'),
                       //   fit: BoxFit.cover,
                       // ),
                       boxShadow: [
                         BoxShadow(
                             color: Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                             blurRadius: 10.0, // soften the shadow
                             spreadRadius: 2.0, //extend the shadow
                             offset: Offset(
                               7.0, // Move to right 7.0 horizontally
                               8.0, // Move to bottom 8.0 Vertically
                             )
                         ),
                       ]
                   ),
                    child: SvgPicture.asset("assets/images/chart1.svg", ),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Theme.of(context).focusColor,
                        // image: DecorationImage(
                        //   image: AssetImage('assets/images/chart1.svg'),
                        //   fit: BoxFit.cover,
                        // ),
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 2.0, //extend the shadow
                              offset: Offset(
                                7.0, // Move to right 7.0 horizontally
                                8.0, // Move to bottom 8.0 Vertically
                              )
                          ),
                        ]
                    ),
                    child: SvgPicture.asset("assets/images/chart1.svg", ),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Theme.of(context).focusColor,
                        // image: DecorationImage(
                        //   image: AssetImage('assets/images/chart1.svg'),
                        //   fit: BoxFit.cover,
                        // ),
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 2.0, //extend the shadow
                              offset: Offset(
                                7.0, // Move to right 7.0 horizontally
                                8.0, // Move to bottom 8.0 Vertically
                              )
                          ),
                        ]
                    ),
                    child: SvgPicture.asset("assets/images/chart2.svg", ),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Theme.of(context).focusColor,
                        // image: DecorationImage(
                        //   image: AssetImage('assets/images/chart1.svg'),
                        //   fit: BoxFit.cover,
                        // ),
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 2.0, //extend the shadow
                              offset: Offset(
                                7.0, // Move to right 7.0 horizontally
                                8.0, // Move to bottom 8.0 Vertically
                              )
                          ),
                        ]
                    ),
                    child: SvgPicture.asset("assets/images/chart3.svg", ),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Theme.of(context).focusColor,
                        // image: DecorationImage(
                        //   image: AssetImage('assets/images/chart1.svg'),
                        //   fit: BoxFit.cover,
                        // ),
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 2.0, //extend the shadow
                              offset: Offset(
                                7.0, // Move to right 7.0 horizontally
                                8.0, // Move to bottom 8.0 Vertically
                              )
                          ),
                        ]
                    ),
                    child: SvgPicture.asset("assets/images/chart4.svg", ),
                  ),

                  const SizedBox(height: 50.0,),
                ],
              ),
            )));
  }
  Widget Stats() {
    return Container(
        color: CustomTheme.of(context).focusColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Highlighted ",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w500,
                                  'FontRegular'),
                            ),
                            Container(
                              height: 25.0,
                              width: MediaQuery.of(context).size.width * 0.14,
                              color: CustomTheme.of(context).focusColor,
                              padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 0.0,
                                  bottom: 0.0),
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
                                                      8.0,
                                                      Theme.of(
                                                          context)
                                                          .primaryColor,
                                                      FontWeight
                                                          .w600,
                                                      'FontRegular'),
                                                ),
                                                value: value,
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {

                                        });
                                      },
                                      isExpanded: true,
                                      value: selectedType,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color:
                                        CustomTheme.of(context)
                                            .primaryColor,
                                        size: 13.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0,),
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Theme.of(context).focusColor,
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                                blurRadius: 10.0, // soften the shadow
                                spreadRadius: 2.0, //extend the shadow
                                  offset: Offset(
                                    7.0, // Move to right 7.0 horizontally
                                    8.0, // Move to bottom 8.0 Vertically
                                  )
                              ),
                            ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Text(
                                    "ROI ",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                                  ),flex: 1,),
                                  Flexible(child: Text(
                                    copyData!.columnList![0].value.toString()+   " %",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                                  ),flex: 1,)
                                ],
                              ),
                              const SizedBox(height: 8.0,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Text(
                                    "Max drawdown ",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                                  ),flex: 1,),
                                  Flexible(child: Text(
                                    copyData!.columnList![6].value.toString()+ " % ",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                                  ),flex: 1,)
                                ],
                              ),
                              const SizedBox(height: 8.0,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Text(
                                    "Total copy traders ",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                                  ),flex: 1,),
                                  Flexible(child: Text(
                                      copyData!.columnList![4].value.toString(),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                                  ),flex: 1,)
                                ],
                              ),
                              const SizedBox(height: 8.0,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Text(
                                    "Total profit ",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                                  ),flex: 1,),
                                  Flexible(child: Text(
                                    copyData!.columnList![3].value.toString(),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                                  ),flex: 1,)
                                ],
                              ),
                              const SizedBox(height: 8.0,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Text(
                                    "Win rate ",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                                  ),flex: 1,),
                                  Flexible(child: Text(
                                    copyData!.columnList![2].value.toString()+"% ",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                                  ),flex: 1,)
                                ],
                              ),
                              const SizedBox(height: 8.0,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Text(
                                    "AUM ",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                                  ),flex: 1,),
                                  Flexible(child: Text(
                                      copyData!.columnList![5].value.toString(),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                                  ),flex: 1,)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Copy trading ",
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              14.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w500,
                              'FontRegular'),
                        ),
                        const SizedBox(height: 15.0,),
                        GridView.builder(
                            itemCount: copyData!.tradingPairsAvailable!.length,
                            shrinkWrap: true,
                            controller: _scrollController,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,

                              childAspectRatio: 3 / 1.2,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  height: 50.0,
                                  padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Theme.of(context).primaryColorLight.withOpacity(0.3),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                                            blurRadius: 10.0, // soften the shadow
                                            spreadRadius: 2.0, //extend the shadow
                                            offset: Offset(
                                              7.0, // Move to right 7.0 horizontally
                                              8.0, // Move to bottom 8.0 Vertically
                                            )
                                        ),
                                      ]
                                  ),
                                  child: Center(
                                    child: Text(
                                      copyData!.tradingPairsAvailable![index].toString(),
                                      style: CustomWidget(
                                          context: context)
                                          .CustomSizedTextStyle(
                                          10.0,
                                          Theme.of(context)
                                              .primaryColor,
                                          FontWeight.w500,
                                          'FontRegular'),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              );
                            }),
                        const SizedBox(height: 15.0,),

                        // Container(
                        //     color: Theme.of(context).focusColor,
                        //     child: SingleChildScrollView(
                        //         child: ListView.builder(
                        //           padding: EdgeInsets.zero,
                        //           itemCount: 6,
                        //           shrinkWrap: true,
                        //           physics: ScrollPhysics(),
                        //           controller: controller,
                        //           itemBuilder: (BuildContext context, int index) {
                        //             return Column(
                        //               children: [
                        //                 InkWell(
                        //                   onTap: (){
                        //
                        //                   },
                        //                   child: Row(
                        //                     crossAxisAlignment: CrossAxisAlignment.center,
                        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                     children: [
                        //                       Flexible(child: Container(
                        //                         padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 7.0),
                        //                         decoration: BoxDecoration(
                        //                           borderRadius: BorderRadius.circular(10.0),
                        //                           color: Theme.of(context).primaryColorLight.withOpacity(0.3),
                        //                         ),
                        //                         child: Center(
                        //                           child: Text(
                        //                             "High profit",
                        //                             style: CustomWidget(
                        //                                 context: context)
                        //                                 .CustomSizedTextStyle(
                        //                                 9.0,
                        //                                 Theme.of(context)
                        //                                     .primaryColorLight,
                        //                                 FontWeight.w500,
                        //                                 'FontRegular'),
                        //                             overflow: TextOverflow.ellipsis,
                        //                           ),
                        //                         ),
                        //                       )),
                        //                       const SizedBox(width: 5.0,),
                        //                       Flexible(child: Container(
                        //                         padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 7.0),
                        //                         decoration: BoxDecoration(
                        //                           borderRadius: BorderRadius.circular(10.0),
                        //                           color: Theme.of(context).primaryColorLight.withOpacity(0.3),
                        //                         ),
                        //                         child: Center(
                        //                           child: Text(
                        //                             "Secure",
                        //                             style: CustomWidget(
                        //                                 context: context)
                        //                                 .CustomSizedTextStyle(
                        //                                 9.0,
                        //                                 Theme.of(context)
                        //                                     .primaryColorLight,
                        //                                 FontWeight.w500,
                        //                                 'FontRegular'),
                        //                             overflow: TextOverflow.ellipsis,
                        //                           ),
                        //                         ),
                        //                       )),
                        //                       const SizedBox(width: 5.0,),
                        //                       Flexible(child: Container(
                        //                         padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 7.0),
                        //                         decoration: BoxDecoration(
                        //                           borderRadius: BorderRadius.circular(10.0),
                        //                           color: Theme.of(context).primaryColorLight.withOpacity(0.3),
                        //                         ),
                        //                         child: Center(
                        //                           child: Text(
                        //                             "Most popular",
                        //                             style: CustomWidget(
                        //                                 context: context)
                        //                                 .CustomSizedTextStyle(
                        //                                 9.0,
                        //                                 Theme.of(context)
                        //                                     .primaryColorLight,
                        //                                 FontWeight.w500,
                        //                                 'FontRegular'),
                        //                             overflow: TextOverflow.ellipsis,
                        //                           ),
                        //                         ),
                        //                       )),
                        //                       const SizedBox(width: 5.0,),
                        //                       Flexible(child: Container(
                        //                         padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 7.0),
                        //                         decoration: BoxDecoration(
                        //                           borderRadius: BorderRadius.circular(10.0),
                        //                           color: Theme.of(context).primaryColorLight.withOpacity(0.3),
                        //                         ),
                        //                         child: Center(
                        //                           child: Text(
                        //                             "Most popular",
                        //                             style: CustomWidget(
                        //                                 context: context)
                        //                                 .CustomSizedTextStyle(
                        //                                 9.0,
                        //                                 Theme.of(context)
                        //                                     .primaryColorLight,
                        //                                 FontWeight.w500,
                        //                                 'FontRegular'),
                        //                             overflow: TextOverflow.ellipsis,
                        //                           ),
                        //                         ),
                        //                       )),
                        //                       const SizedBox(width: 5.0,),
                        //                       Flexible(child: Container(
                        //                         padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 7.0),
                        //                         decoration: BoxDecoration(
                        //                           borderRadius: BorderRadius.circular(10.0),
                        //                           color: Theme.of(context).primaryColorLight.withOpacity(0.3),
                        //                         ),
                        //                         child: Center(
                        //                           child: Text(
                        //                             "Most popular",
                        //                             style: CustomWidget(
                        //                                 context: context)
                        //                                 .CustomSizedTextStyle(
                        //                                 9.0,
                        //                                 Theme.of(context)
                        //                                     .primaryColorLight,
                        //                                 FontWeight.w500,
                        //                                 'FontRegular'),
                        //                             overflow: TextOverflow.ellipsis,
                        //                           ),
                        //                         ),
                        //                       ))
                        //                     ],
                        //                   ),
                        //                 ),
                        //                 const SizedBox(height: 20.0,),
                        //               ],
                        //             );
                        //           },
                        //         ))),

                      ],
                    ),
                  )
                ],
              ),
            )));
  }
  Widget Orders() {
    return Container(
        color: CustomTheme.of(context).focusColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0,bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        his = true;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 10.0, 7.0),
                                      decoration: his
                                          ? BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: Theme.of(context)
                                                  .primaryColorLight
                                                  .withOpacity(0.3),
                                            )
                                          : BoxDecoration(
                                              // borderRadius: BorderRadius.circular(10.0),
                                              // color: Theme.of(context).primaryColorLight.withOpacity(0.3),
                                              ),
                                      child: Center(
                                        child: Text(
                                          "History",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  9.0,
                                                  Theme.of(context)
                                                      .primaryColorLight,
                                                  FontWeight.w500,
                                                  'FontRegular'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        his = false;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 10.0, 7.0),
                                      decoration: his
                                          ? BoxDecoration()
                                          : BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: Theme.of(context)
                                                  .primaryColorLight
                                                  .withOpacity(0.3),
                                            ),
                                      child: Center(
                                        child: Text(
                                          "current traders 14",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                                  9.0,
                                                  Theme.of(context)
                                                      .primaryColorLight,
                                                  FontWeight.w500,
                                                  'FontRegular'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 25.0,
                              width: MediaQuery.of(context).size.width * 0.14,
                              color: CustomTheme.of(context).focusColor,
                              padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 0.0,
                                  bottom: 0.0),
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
                                                          8.0,
                                                          Theme.of(context)
                                                              .primaryColor,
                                                          FontWeight.w600,
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
                                        Icons.keyboard_arrow_down,
                                        color: CustomTheme.of(context)
                                            .primaryColor,
                                        size: 13.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                            color: Theme.of(context).focusColor,
                            child: SingleChildScrollView(
                                child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 6,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              controller: controller,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 10.0, 10.0, 10.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: Theme.of(context).focusColor,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Theme.of(context)
                                                      .unselectedWidgetColor
                                                      .withOpacity(0.2),
                                                  blurRadius: 10.0,
                                                  // soften the shadow
                                                  spreadRadius: 2.0,
                                                  //extend the shadow
                                                  offset: Offset(
                                                    7.0,
                                                    // Move to right 7.0 horizontally
                                                    8.0, // Move to bottom 8.0 Vertically
                                                  )),
                                            ]),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10.0, 5.0, 10.0, 5.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.0),
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Short",
                                                      style: CustomWidget(
                                                              context: context)
                                                          .CustomSizedTextStyle(
                                                              5.0,
                                                              Theme.of(context)
                                                                  .focusColor,
                                                              FontWeight.w500,
                                                              'FontRegular'),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text: '5X',
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            9.0,
                                                            Theme.of(context)
                                                                .primaryColorLight,
                                                            FontWeight.w500,
                                                            'FontRegular'),
                                                    children: const <TextSpan>[
                                                      TextSpan(
                                                          text: 'INJUSDT',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 9.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10.0, 5.0, 10.0, 5.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.0),
                                                    color: Theme.of(context)
                                                        .unselectedWidgetColor
                                                        .withOpacity(0.5),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Cross",
                                                      style: CustomWidget(
                                                              context: context)
                                                          .CustomSizedTextStyle(
                                                              5.0,
                                                              Theme.of(context)
                                                                  .focusColor,
                                                              FontWeight.w500,
                                                              'FontRegular'),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5.0,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10.0, 5.0, 10.0, 5.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.0),
                                                    color: Theme.of(context)
                                                        .unselectedWidgetColor
                                                        .withOpacity(0.5),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "USDT",
                                                      style: CustomWidget(
                                                              context: context)
                                                          .CustomSizedTextStyle(
                                                              5.0,
                                                              Theme.of(context)
                                                                  .focusColor,
                                                              FontWeight.w500,
                                                              'FontRegular'),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15.0,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "9.233",
                                                      style: CustomWidget(
                                                              context: context)
                                                          .CustomSizedTextStyle(
                                                              14.0,
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                              FontWeight.w600,
                                                              'FontRegular'),
                                                    ),
                                                    Text(
                                                      "Entry price",
                                                      style: CustomWidget(
                                                              context: context)
                                                          .CustomSizedTextStyle(
                                                              8.0,
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                              FontWeight.w600,
                                                              'FontRegular'),
                                                    ),
                                                  ],
                                                )),
                                                Flexible(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "6.999",
                                                      style: CustomWidget(
                                                              context: context)
                                                          .CustomSizedTextStyle(
                                                              14.0,
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                              FontWeight.w600,
                                                              'FontRegular'),
                                                    ),
                                                    Text(
                                                      "Current price",
                                                      style: CustomWidget(
                                                              context: context)
                                                          .CustomSizedTextStyle(
                                                              8.0,
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                              FontWeight.w600,
                                                              'FontRegular'),
                                                    ),
                                                  ],
                                                )),
                                                Flexible(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "-2.356",
                                                      style: CustomWidget(
                                                              context: context)
                                                          .CustomSizedTextStyle(
                                                              14.0,
                                                              Theme.of(context)
                                                                  .scaffoldBackgroundColor,
                                                              FontWeight.w600,
                                                              'FontRegular'),
                                                    ),
                                                    Text(
                                                      "ROI",
                                                      style: CustomWidget(
                                                              context: context)
                                                          .CustomSizedTextStyle(
                                                              8.0,
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                              FontWeight.w600,
                                                              'FontRegular'),
                                                    ),
                                                  ],
                                                )),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25.0,
                                    ),
                                  ],
                                );
                              },
                            ))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                ],
              ),
            )));
  }
  Widget Followers() {
    return Container(
        color: CustomTheme.of(context).focusColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Only show the first 50 users",
                        style: CustomWidget(
                            context: context)
                            .CustomSizedTextStyle(
                            9.0,
                            Theme.of(context)
                                .primaryColorLight,
                            FontWeight.w500,
                            'FontRegular'),
                      ),
                      Container(
                        height: 25.0,
                        width: MediaQuery.of(context).size.width * 0.14,
                        color: CustomTheme.of(context).focusColor,
                        padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            top: 0.0,
                            bottom: 0.0),
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
                                        8.0,
                                        Theme.of(context)
                                            .primaryColor,
                                        FontWeight.w600,
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
                                  Icons.keyboard_arrow_down,
                                  color: CustomTheme.of(context)
                                      .primaryColor,
                                  size: 13.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  Container(
                      color: Theme.of(context).focusColor,
                      child: SingleChildScrollView(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 8,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            controller: _scroller,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 10.0, 10.0, 10.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15.0),
                                          color: Theme.of(context).focusColor,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Theme.of(context)
                                                    .unselectedWidgetColor
                                                    .withOpacity(0.2),
                                                blurRadius: 10.0,
                                                // soften the shadow
                                                spreadRadius: 2.0,
                                                //extend the shadow
                                                offset: Offset(
                                                  7.0,
                                                  // Move to right 7.0 horizontally
                                                  8.0, // Move to bottom 8.0 Vertically
                                                )),
                                          ]),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context).focusColor,
                                                    shape: BoxShape.circle),
                                                child: Image.asset(
                                                  "assets/images/bg.png",
                                                  height: 30.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                "User3Ae",
                                                style: CustomWidget(
                                                    context: context)
                                                    .CustomSizedTextStyle(
                                                    9.0,
                                                    Theme.of(context)
                                                        .primaryColorLight,
                                                    FontWeight.w500,
                                                    'FontRegular'),
                                              ),

                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceAround,
                                            children: [
                                              Flexible(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "1234567.123 USDT",
                                                        style: CustomWidget(
                                                            context: context)
                                                            .CustomSizedTextStyle(
                                                            14.0,
                                                            Theme.of(context)
                                                                .primaryColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                      ),
                                                      Text(
                                                        "Total vol",
                                                        style: CustomWidget(
                                                            context: context)
                                                            .CustomSizedTextStyle(
                                                            8.0,
                                                            Theme.of(context)
                                                                .primaryColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                      ),
                                                    ],
                                                  )),
                                              Flexible(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "+24635.3564 USDT",
                                                        style: CustomWidget(
                                                            context: context)
                                                            .CustomSizedTextStyle(
                                                            14.0,
                                                            Theme.of(context)
                                                                .primaryColorLight,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                      ),
                                                      Text(
                                                        "Profit",
                                                        style: CustomWidget(
                                                            context: context)
                                                            .CustomSizedTextStyle(
                                                            8.0,
                                                            Theme.of(context)
                                                                .primaryColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                      ),
                                                    ],
                                                  )),

                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25.0,
                                  ),
                                ],
                              );
                            },
                          ))),

                ],
              ),
            )));
  }
  Widget Insights() {
    return Container(
        color: CustomTheme.of(context).focusColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Only show the first 50 users",
                        style: CustomWidget(
                            context: context)
                            .CustomSizedTextStyle(
                            9.0,
                            Theme.of(context)
                                .primaryColorLight,
                            FontWeight.w500,
                            'FontRegular'),
                      ),
                      Container(
                        height: 25.0,
                        width: MediaQuery.of(context).size.width * 0.14,
                        color: CustomTheme.of(context).focusColor,
                        padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            top: 0.0,
                            bottom: 0.0),
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
                                        8.0,
                                        Theme.of(context)
                                            .primaryColor,
                                        FontWeight.w600,
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
                                  Icons.keyboard_arrow_down,
                                  color: CustomTheme.of(context)
                                      .primaryColor,
                                  size: 13.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "There is nothing here",
                          style: CustomWidget(
                              context: context)
                              .CustomSizedTextStyle(
                              9.0,
                              Theme.of(context)
                                  .primaryColor,
                              FontWeight.w500,
                              'FontRegular'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  Widget SpotUI() {
    return Container(
        color: CustomTheme.of(context).focusColor,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                ],
              ),
            )));
  }
}
