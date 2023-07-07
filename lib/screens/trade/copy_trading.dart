import 'package:carousel_slider/carousel_slider.dart';
import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/data_model/api_utils.dart';
import 'package:cofinex/data_model/model/copy_trade_model.dart';
import 'package:cofinex/screens/copy%20trade/my_strategies.dart';
import 'package:cofinex/screens/trade/copy_trade_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/localization/localizations.dart';
import '../copy trade/copy_trade_overview_details.dart';
import '../copy trade/future_details.dart';
import '../copy trade/my_strategies_details.dart';

class CopyTrading extends StatefulWidget {
  const CopyTrading({Key? key}) : super(key: key);

  @override
  State<CopyTrading> createState() => _CopyTradingState();
}

class _CopyTradingState extends State<CopyTrading>
    with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  ScrollController _futurescrollController = ScrollController();
  ScrollController controller = ScrollController();
  TextEditingController amtController = TextEditingController();
  TextEditingController coinController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List<String> borrows = ["Default", "ROI", "Total PNL", "AUM"];

  List<CopyTrade> copyTradelist = [];
  List<CopyTrade> searchcopyTradelist = [];
  List<CopyTrade> copyLoadTradelist = [];
  String selectedBorrow = "";
  String type = "composite";
  String page = "1";
  bool loadAllMore = false;

  bool collapse = false;
  APIUtils apiUtils = APIUtils();
  bool loading = false;
  bool botLoader = false;
  List<String> bannerList = [];
  int slideIndex = 0;
  List<String> orderType = ["Forward", "Reverse","Long","Short"];
  List<String> img = ["assets/images/bot.svg", "assets/images/tag_1.svg","assets/images/ticket.svg","assets/images/add_file.svg"];
  List<String> imgText = ["My strategies", "Bought","Subscribe","Create"];
  String selectedType = "";

  late TabController _tabController;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedBorrow = borrows.first;
    selectedType = orderType.first;
    loading = true;

    _futurescrollController.addListener(() {
      if (_futurescrollController.position.pixels ==
          _futurescrollController.position.maxScrollExtent) {
        _loadAllMore();
      }
    });
    getToken();

    // _tabController = TabController(vsync: this, length: 1);
    _tabController = TabController(vsync: this, length: 4);
  }


  Future<bool> _loadAllMore() async {
    print("Man0");
    await Future.delayed(Duration(seconds: 0, milliseconds: 10));
    setState(() {

      /*limit = (int.parse(limit) + 10).toString();*/
      if(copyLoadTradelist.length>0){
        botLoader = true;
        page=(int.parse(page)+1).toString();
        getToken();
      }else {

        setState(() {
          botLoader=false;
        });

      }

    });


    return loadAllMore;
  }
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(

          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: CustomTheme.of(context).focusColor,
            child: Column(
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
                      width: 2.0,

                    ))
                      ),
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
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

                      Tab(
                        text: "Overview",
                      ),
                      Tab(
                        text: "Futures",
                      ),
                      Tab(
                        text: "Spot",
                      ),
                      Tab(
                        text: "Bots",
                      ),

                    ],
                  ),
                ),
                loading   ? Container(
                  height: MediaQuery.of(context).size.height*0.5,
                  child: Center(
                    child: CustomWidget(context: context).loadingIndicator(
                      CustomTheme.of(context).primaryColorLight,
                    ) ,
                  ),
                ):   Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    color: CustomTheme.of(context).backgroundColor,
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[

                        OverviewUI(),
                        FutureUI(),
                        SpotUI(),
                        BotsUI(),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }


  Widget OverviewUI() {
    return Container(
        color: CustomTheme.of(context).focusColor,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 15.0, 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).primaryColorLight,
                      // image: DecorationImage(
                      //   image: AssetImage("assets/icon/back.png"),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Win Trading!",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w400,
                                        'FontRegular'),
                                  ),
                                  const SizedBox(height: 10.0,),
                                  Text(
                                    "Win Spot copy trading welcome gift!",
                                    style:
                                    CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        18.0,
                                        Theme.of(context)
                                            .primaryColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                                  ),
                                  const SizedBox(height: 10.0,),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 7.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6.0),
                                        border: Border.all(width: 1.0, color: Theme.of(context).primaryColor,),
                                        color: Theme.of(context).focusColor
                                    ),
                                    child: Text(
                                      "Login Today",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          9.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w400,
                                          'FontRegular'),
                                    ),
                                  )
                                ],
                              ),
                              flex: 3,
                            ),
                            Flexible(
                              child: Container(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SvgPicture.asset("assets/images/cofi.svg", fit: BoxFit.contain, ),
                                ),
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10.0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/images/speak.svg", height: 20.0,),
                            const SizedBox(width: 5.0,),
                            Container(
                              // width: MediaQuery.of(context).size.width * 0.5,
                              child:  Text(
                                "Lorem ipsum dolor sit amet consectetur. Sed.",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    11.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w500,
                                    'FontRegular'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.menu,
                        color: Theme.of(context).unselectedWidgetColor,
                        size: 20.0,
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.instance.text("loc_my_cpy_trade"),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            18.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Theme.of(context).unselectedWidgetColor,
                        size: 20.0,
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Flexible(child: Container(
                          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset("assets/images/future_tech.svg", height: 18.0,),
                                        const SizedBox(width: 5.0,),
                                        Container(
                                          // width: MediaQuery.of(context).size.width * 0.5,
                                          child:  Text(
                                            "Future",
                                            style: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                11.0,
                                                Theme.of(context).focusColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Theme.of(context).primaryColorLight,
                                    size: 15.0,
                                  )
                                ],
                              ),
                              const SizedBox(height: 10.0,),
                              Text(
                                "\$1,734.65",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(context).focusColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                              ),
                              const SizedBox(height: 5.0,),
                              Text(
                                "Net profit",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    8.0,
                                    Theme.of(context).disabledColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                              ),

                            ],
                          ),
                        ),flex: 1,),
                        const SizedBox(width: 13.0,),
                        Flexible(child: Container(
                          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset("assets/images/future_tech.svg", height: 18.0,),
                                        const SizedBox(width: 5.0,),
                                        Container(
                                          // width: MediaQuery.of(context).size.width * 0.5,
                                          child:  Text(
                                            "Spot",
                                            style: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                11.0,
                                                Theme.of(context).focusColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Theme.of(context).primaryColorLight,
                                    size: 15.0,
                                  )
                                ],
                              ),
                              const SizedBox(height: 10.0,),
                              Text(
                                "\$1,734.65",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(context).focusColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                              ),
                              const SizedBox(height: 5.0,),
                              Text(
                                "Net profit",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    8.0,
                                    Theme.of(context).disabledColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                              ),

                            ],
                          ),
                        ),flex: 1,),
                        const SizedBox(width: 13.0,),
                        Flexible(child: Container(
                          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset("assets/images/future_tech.svg", height: 18.0,),
                                        const SizedBox(width: 5.0,),
                                        Container(
                                          // width: MediaQuery.of(context).size.width * 0.5,
                                          child:  Text(
                                            "Bots",
                                            style: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                11.0,
                                                Theme.of(context).focusColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Theme.of(context).primaryColorLight,
                                    size: 15.0,
                                  )
                                ],
                              ),
                              const SizedBox(height: 10.0,),
                              Text(
                                "\$1,734.65",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(context).focusColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                              ),
                              const SizedBox(height: 5.0,),
                              Text(
                                "Net profit",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    8.0,
                                    Theme.of(context).disabledColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                              ),

                            ],
                          ),
                        ),flex: 1,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.instance.text("loc_future_elite"),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            18.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Theme.of(context).unselectedWidgetColor,
                        size: 20.0,
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0,),
                  Container(
                    height: 155.0,
                    child:  ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  color:Theme.of(context).focusColor,
                                                  shape: BoxShape.circle
                                              ),
                                              child: Image.asset("assets/images/bg.png", height: 30.0,),
                                            ),
                                            const SizedBox(width: 10.0,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.15,
                                                  child: Text(
                                                    "BTC7Monitor",
                                                    style: CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        10.0,
                                                        Theme.of(context).focusColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(padding: EdgeInsets.zero, child:  Icon(Icons.person, size: 10.0, color: Theme.of(context).focusColor,),),
                                                    const SizedBox(width: 5.0,),
                                                    Text(
                                                      "999/1000",
                                                      style: CustomWidget(context: context)
                                                          .CustomSizedTextStyle(
                                                          4.0,
                                                          Theme.of(context).focusColor,
                                                          FontWeight.w600,
                                                          'FontRegular'),
                                                    ),

                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 15.0,),
                                        Text(
                                          "+372.18%",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              14.0,
                                              Theme.of(context).focusColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                        ),
                                        const SizedBox(height: 5.0,),
                                        Text(
                                          "ROI",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              8.0,
                                              Theme.of(context).unselectedWidgetColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                        ),
                                        const SizedBox(height: 15.0,),

                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total pnl \$138.58",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  6.0,
                                                  Theme.of(context).focusColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                            ),

                                            Container(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: 20.0,
                                                    width: 20.0,
                                                    padding: EdgeInsets.all(1.0),
                                                    decoration: BoxDecoration(
                                                        color:Theme.of(context).focusColor,
                                                        shape: BoxShape.circle
                                                    ),
                                                    child: Image.asset("assets/images/bg_1.png", height: 30.0, fit: BoxFit.cover,),
                                                  ),
                                                  Padding(padding: EdgeInsets.only(left: 10.0),
                                                      child: Container(
                                                        height: 20.0,
                                                        width: 20.0,
                                                        padding: EdgeInsets.all(1.0),
                                                        decoration: BoxDecoration(
                                                            color: Theme.of(context)
                                                                .focusColor,
                                                            shape: BoxShape.circle),
                                                        child: Image.asset("assets/images/bg.png", height: 30.0, fit: BoxFit.cover,),
                                                      )),
                                                  Padding(padding: EdgeInsets.only(left: 20.0),
                                                      child: Container(
                                                        height: 20.0,
                                                        width: 20.0,
                                                        padding: EdgeInsets.all(1.0),
                                                        decoration: BoxDecoration(
                                                            color: Theme.of(context)
                                                                .focusColor,
                                                            shape: BoxShape.circle),
                                                        child: Image.asset("assets/images/bg_1.png", height: 30.0, fit: BoxFit.cover,),
                                                      )),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 10.0,),

                                      ],
                                    ),
                                  ),flex: 1,),
                                  const SizedBox(width: 10.0,),
                                  Flexible(child: Container(
                                    child: Column(
                                      children: [
                                        Padding(padding: EdgeInsets.only(right: 15.0),child: InkWell(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(15.0, 6.0, 15.0, 7.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15.0),
                                              color:  Theme.of(context).primaryColorLight,
                                            ),
                                            child: Text(
                                              "Copy ",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  8.0,
                                                  Theme.of(context).primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                            ),
                                          ),
                                        ),),
                                        const SizedBox(height: 15.0,),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          child: SvgPicture.asset("assets/images/copy_trade.svg",fit: BoxFit.fitWidth, height: 100.0,),
                                        )
                                      ],
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    ),
                                  ),flex: 1,)
                                ],
                              ),
                            ),
                            SizedBox(width: 15.0,)
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15.0,),
                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        const SizedBox(width: 8.0,),
                        Text(
                          "Lorem ipsum dolor sit amet consectetur. Sed.",
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              10.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w500,
                              'FontRegular'),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.instance.text("loc_elite_trade"),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            18.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Theme.of(context).unselectedWidgetColor,
                        size: 20.0,
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0,),
                  Container(
                    height: 155.0,
                    child:  ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  color:Theme.of(context).focusColor,
                                                  shape: BoxShape.circle
                                              ),
                                              child: Image.asset("assets/images/bg.png", height: 30.0,),
                                            ),
                                            const SizedBox(width: 10.0,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.15,
                                                  child: Text(
                                                    "BTC7Monitor",
                                                    style: CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        10.0,
                                                        Theme.of(context).focusColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(padding: EdgeInsets.zero, child:  Icon(Icons.person, size: 10.0, color: Theme.of(context).focusColor,),),
                                                    const SizedBox(width: 5.0,),
                                                    Text(
                                                      "999/1000",
                                                      style: CustomWidget(context: context)
                                                          .CustomSizedTextStyle(
                                                          4.0,
                                                          Theme.of(context).focusColor,
                                                          FontWeight.w600,
                                                          'FontRegular'),
                                                    ),

                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 15.0,),
                                        Text(
                                          "+372.18%",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              14.0,
                                              Theme.of(context).focusColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                        ),
                                        const SizedBox(height: 5.0,),
                                        Text(
                                          "ROI",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              8.0,
                                              Theme.of(context).unselectedWidgetColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                        ),
                                        const SizedBox(height: 15.0,),

                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total pnl \$138.58",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  6.0,
                                                  Theme.of(context).focusColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                            ),

                                            Container(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: 20.0,
                                                    width: 20.0,
                                                    padding: EdgeInsets.all(1.0),
                                                    decoration: BoxDecoration(
                                                        color:Theme.of(context).focusColor,
                                                        shape: BoxShape.circle
                                                    ),
                                                    child: Image.asset("assets/images/bg_1.png", height: 30.0, fit: BoxFit.cover,),
                                                  ),
                                                  Padding(padding: EdgeInsets.only(left: 10.0),
                                                      child: Container(
                                                        height: 20.0,
                                                        width: 20.0,
                                                        padding: EdgeInsets.all(1.0),
                                                        decoration: BoxDecoration(
                                                            color: Theme.of(context)
                                                                .focusColor,
                                                            shape: BoxShape.circle),
                                                        child: Image.asset("assets/images/bg.png", height: 30.0, fit: BoxFit.cover,),
                                                      )),
                                                  Padding(padding: EdgeInsets.only(left: 20.0),
                                                      child: Container(
                                                        height: 20.0,
                                                        width: 20.0,
                                                        padding: EdgeInsets.all(1.0),
                                                        decoration: BoxDecoration(
                                                            color: Theme.of(context)
                                                                .focusColor,
                                                            shape: BoxShape.circle),
                                                        child: Image.asset("assets/images/bg_1.png", height: 30.0, fit: BoxFit.cover,),
                                                      )),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 10.0,),

                                      ],
                                    ),
                                  ),flex: 1,),
                                  const SizedBox(width: 10.0,),
                                  Flexible(child: Container(
                                    child: Column(
                                      children: [
                                        Padding(padding: EdgeInsets.only(right: 15.0),child: InkWell(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(15.0, 6.0, 15.0, 7.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15.0),
                                              color:  Theme.of(context).primaryColorLight,
                                            ),
                                            child: Text(
                                              "Copy ",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  8.0,
                                                  Theme.of(context).primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                            ),
                                          ),
                                        ),),
                                        const SizedBox(height: 15.0,),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          child: SvgPicture.asset("assets/images/copy_trade.svg",fit: BoxFit.fitWidth, height: 100.0,),
                                        )
                                      ],
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    ),
                                  ),flex: 1,)
                                ],
                              ),
                            ),
                            SizedBox(width: 15.0,)
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15.0,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.instance.text("loc_strategists"),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            18.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Theme.of(context).unselectedWidgetColor,
                        size: 20.0,
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0,),
                  Container(
                    height: 155.0,
                    child:  ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  color:Theme.of(context).focusColor,
                                                  shape: BoxShape.circle
                                              ),
                                              child: Image.asset("assets/images/bg.png", height: 30.0,),
                                            ),
                                            const SizedBox(width: 10.0,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.15,
                                                  child: Text(
                                                    "BTC7Monitor",
                                                    style: CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        10.0,
                                                        Theme.of(context).focusColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(padding: EdgeInsets.zero, child:  Icon(Icons.person, size: 10.0, color: Theme.of(context).focusColor,),),
                                                    const SizedBox(width: 5.0,),
                                                    Text(
                                                      "999/1000",
                                                      style: CustomWidget(context: context)
                                                          .CustomSizedTextStyle(
                                                          4.0,
                                                          Theme.of(context).focusColor,
                                                          FontWeight.w600,
                                                          'FontRegular'),
                                                    ),

                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 15.0,),
                                        Text(
                                          "+372.18%",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              14.0,
                                              Theme.of(context).focusColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                        ),
                                        const SizedBox(height: 5.0,),
                                        Text(
                                          "Pnl",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              8.0,
                                              Theme.of(context).unselectedWidgetColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                        ),
                                        const SizedBox(height: 15.0,),

                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total pnl \$138.58",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  6.0,
                                                  Theme.of(context).focusColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                            ),

                                            Container(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: 20.0,
                                                    width: 20.0,
                                                    padding: EdgeInsets.all(1.0),
                                                    decoration: BoxDecoration(
                                                        color:Theme.of(context).focusColor,
                                                        shape: BoxShape.circle
                                                    ),
                                                    child: Image.asset("assets/images/bg_1.png", height: 30.0, fit: BoxFit.cover,),
                                                  ),
                                                  Padding(padding: EdgeInsets.only(left: 10.0),
                                                      child: Container(
                                                        height: 20.0,
                                                        width: 20.0,
                                                        padding: EdgeInsets.all(1.0),
                                                        decoration: BoxDecoration(
                                                            color: Theme.of(context)
                                                                .focusColor,
                                                            shape: BoxShape.circle),
                                                        child: Image.asset("assets/images/bg.png", height: 30.0, fit: BoxFit.cover,),
                                                      )),
                                                  Padding(padding: EdgeInsets.only(left: 20.0),
                                                      child: Container(
                                                        height: 20.0,
                                                        width: 20.0,
                                                        padding: EdgeInsets.all(1.0),
                                                        decoration: BoxDecoration(
                                                            color: Theme.of(context)
                                                                .focusColor,
                                                            shape: BoxShape.circle),
                                                        child: Image.asset("assets/images/bg_1.png", height: 30.0, fit: BoxFit.cover,),
                                                      )),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 10.0,),

                                      ],
                                    ),
                                  ),flex: 1,),
                                  const SizedBox(width: 10.0,),
                                  Flexible(child: Container(
                                    child: Column(
                                      children: [
                                        Padding(padding: EdgeInsets.only(right: 15.0),child: InkWell(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(15.0, 6.0, 15.0, 7.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15.0),
                                              color:  Theme.of(context).primaryColorLight,
                                            ),
                                            child: Text(
                                              "Copy ",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  8.0,
                                                  Theme.of(context).primaryColor,
                                                  FontWeight.w600,
                                                  'FontRegular'),
                                            ),
                                          ),
                                        ),),
                                        const SizedBox(height: 15.0,),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          child: SvgPicture.asset("assets/images/copy_trade.svg",fit: BoxFit.fitWidth, height: 100.0,),
                                        )
                                      ],
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    ),
                                  ),flex: 1,)
                                ],
                              ),
                            ),
                            SizedBox(width: 15.0,)
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15.0,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 15.0, 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).primaryColorLight,
                      // image: DecorationImage(
                      //   image: AssetImage("assets/icon/back.png"),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Become an elite trader",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        18.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                                  ),
                                  const SizedBox(height: 10.0,),
                                  Text(
                                    "Get 10% in profit share ",
                                    style:
                                    CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        12.0,
                                        Theme.of(context)
                                            .primaryColor,
                                        FontWeight.w500,
                                        'FontRegular'),
                                  ),
                                  const SizedBox(height: 20.0,),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 8.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6.0),
                                        color: Theme.of(context).primaryColor
                                    ),
                                    child: Text(
                                      AppLocalizations.instance.text("loc_aply_now"),
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          9.0,
                                          Theme.of(context).focusColor,
                                          FontWeight.w400,
                                          'FontRegular'),
                                    ),
                                  )
                                ],
                              ),
                              flex: 3,
                            ),
                            const SizedBox(width: 15.0,),
                            Flexible(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Image.asset("assets/images/thums_up.png", fit: BoxFit.fitWidth, ),
                                ),
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0,),

                  Text(
                    "Recommended Strategies ",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        18.0,
                        Theme.of(context).primaryColor,
                        FontWeight.w600,
                        'FontRegular'),
                  ),
                  const SizedBox(height: 15.0,),
                  // Row(
                  //   children: [
                  //     Flexible(child: Container(
                  //       width: MediaQuery.of(context).size.width * 0.5,
                  //       padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(15.0),
                  //         color: Theme.of(context).primaryColor,
                  //       ),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //
                  //           Align(
                  //             alignment: Alignment.topRight,
                  //             child: Container(
                  //               height: 25.0,
                  //               width: MediaQuery.of(context).size.width * 0.2,
                  //               padding: const EdgeInsets.only(
                  //                   left: 10.0,
                  //                   right: 10.0,
                  //                   top: 0.0,
                  //                   bottom: 0.0),
                  //               decoration: BoxDecoration(
                  //                 borderRadius:
                  //                 BorderRadius.circular(15.0),
                  //                 color: CustomTheme.of(context).hoverColor.withOpacity(0.1),
                  //               ),
                  //               child: Center(
                  //                 child: Theme(
                  //                   data: Theme.of(context).copyWith(
                  //                     canvasColor:
                  //                     CustomTheme.of(context)
                  //                         .focusColor,
                  //                   ),
                  //                   child:
                  //                   DropdownButtonHideUnderline(
                  //                     child: DropdownButton(
                  //                       items: orderType
                  //                           .map(
                  //                               (value) =>
                  //                               DropdownMenuItem(
                  //                                 child: Text(
                  //                                   value,
                  //                                   style: CustomWidget(context: context).CustomSizedTextStyle(
                  //                                       6.0,
                  //                                       Theme.of(
                  //                                           context)
                  //                                           .indicatorColor,
                  //                                       FontWeight
                  //                                           .w500,
                  //                                       'FontRegular'),
                  //                                 ),
                  //                                 value: value,
                  //                               ))
                  //                           .toList(),
                  //                       onChanged: (value) {
                  //                         setState(() {
                  //
                  //                         });
                  //                       },
                  //                       isExpanded: true,
                  //                       value: selectedType,
                  //                       icon: Icon(
                  //                         Icons.keyboard_arrow_down,
                  //                         color:
                  //                         CustomTheme.of(context)
                  //                             .indicatorColor,
                  //                         size: 13.0,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Container(
                  //             child: Stack(
                  //               children: [
                  //                 Container(
                  //                   height: 30.0,
                  //                   width: 30.0,
                  //                   padding: EdgeInsets.all(1.0),
                  //                   decoration: BoxDecoration(
                  //                       color:Theme.of(context).primaryColor,
                  //                       shape: BoxShape.circle
                  //                   ),
                  //                   child: SvgPicture.asset("assets/images/b.svg", height: 30.0, fit: BoxFit.cover,),
                  //                 ),
                  //                 Padding(padding: EdgeInsets.only(left: 20.0),
                  //                     child: Container(
                  //                       height: 30.0,
                  //                       width: 30.0,
                  //                       padding: EdgeInsets.all(1.0),
                  //                       decoration: BoxDecoration(
                  //                           color: Theme.of(context)
                  //                               .primaryColor,
                  //                           shape: BoxShape.circle),
                  //                       child: SvgPicture.asset("assets/images/t.svg", height: 30.0, fit: BoxFit.cover,),
                  //                     )),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Text(
                  //             "IGU/USDT",
                  //             style: CustomWidget(context: context)
                  //                 .CustomSizedTextStyle(
                  //                 18.0,
                  //                 Theme.of(context).focusColor,
                  //                 FontWeight.w600,
                  //                 'FontRegular'),
                  //           ),
                  //           const SizedBox(height: 3.0,),
                  //           Container(
                  //             padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 7.0),
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(15.0),
                  //               color: Theme.of(context).primaryColorLight.withOpacity(0.2),
                  //             ),
                  //             child: Text(
                  //               "Spot grid",
                  //               style: CustomWidget(context: context)
                  //                   .CustomSizedTextStyle(
                  //                   9.0,
                  //                   Theme.of(context).focusColor,
                  //                   FontWeight.w500,
                  //                   'FontRegular'),
                  //             ),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Text(
                  //             "+120.4%",
                  //             style: CustomWidget(context: context)
                  //                 .CustomSizedTextStyle(
                  //                 17.0,
                  //                 Theme.of(context).indicatorColor,
                  //                 FontWeight.w600,
                  //                 'FontRegular'),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Text(
                  //             "Sales: 13",
                  //             style: CustomWidget(context: context)
                  //                 .CustomSizedTextStyle(
                  //                 9.0,
                  //                 Theme.of(context).toggleableActiveColor,
                  //                 FontWeight.w500,
                  //                 'FontRegular'),
                  //           ),
                  //
                  //         ],
                  //       ),
                  //     ),flex: 1,),
                  //     const SizedBox(width: 15.0,),
                  //     Flexible(child: Container(
                  //       width: MediaQuery.of(context).size.width * 0.5,
                  //       padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(15.0),
                  //         color: Theme.of(context).primaryColor,
                  //       ),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //
                  //           Align(
                  //             alignment: Alignment.topRight,
                  //             child: Container(
                  //               height: 25.0,
                  //               width: MediaQuery.of(context).size.width * 0.2,
                  //               padding: const EdgeInsets.only(
                  //                   left: 10.0,
                  //                   right: 10.0,
                  //                   top: 0.0,
                  //                   bottom: 0.0),
                  //               decoration: BoxDecoration(
                  //                 borderRadius:
                  //                 BorderRadius.circular(15.0),
                  //                 color: CustomTheme.of(context).hoverColor.withOpacity(0.1),
                  //               ),
                  //               child: Center(
                  //                 child: Theme(
                  //                   data: Theme.of(context).copyWith(
                  //                     canvasColor:
                  //                     CustomTheme.of(context)
                  //                         .focusColor,
                  //                   ),
                  //                   child:
                  //                   DropdownButtonHideUnderline(
                  //                     child: DropdownButton(
                  //                       items: orderType
                  //                           .map(
                  //                               (value) =>
                  //                               DropdownMenuItem(
                  //                                 child: Text(
                  //                                   value,
                  //                                   style: CustomWidget(context: context).CustomSizedTextStyle(
                  //                                       6.0,
                  //                                       Theme.of(
                  //                                           context)
                  //                                           .indicatorColor,
                  //                                       FontWeight
                  //                                           .w500,
                  //                                       'FontRegular'),
                  //                                 ),
                  //                                 value: value,
                  //                               ))
                  //                           .toList(),
                  //                       onChanged: (value) {
                  //                         setState(() {
                  //
                  //                         });
                  //                       },
                  //                       isExpanded: true,
                  //                       value: selectedType,
                  //                       icon: Icon(
                  //                         Icons.keyboard_arrow_down,
                  //                         color:
                  //                         CustomTheme.of(context)
                  //                             .indicatorColor,
                  //                         size: 13.0,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Container(
                  //             child: Stack(
                  //               children: [
                  //                 Container(
                  //                   height: 30.0,
                  //                   width: 30.0,
                  //                   padding: EdgeInsets.all(1.0),
                  //                   decoration: BoxDecoration(
                  //                       color:Theme.of(context).primaryColor,
                  //                       shape: BoxShape.circle
                  //                   ),
                  //                   child: SvgPicture.asset("assets/images/b.svg", height: 30.0, fit: BoxFit.cover,),
                  //                 ),
                  //                 Padding(padding: EdgeInsets.only(left: 20.0),
                  //                     child: Container(
                  //                       height: 30.0,
                  //                       width: 30.0,
                  //                       padding: EdgeInsets.all(1.0),
                  //                       decoration: BoxDecoration(
                  //                           color: Theme.of(context)
                  //                               .primaryColor,
                  //                           shape: BoxShape.circle),
                  //                       child: SvgPicture.asset("assets/images/t.svg", height: 30.0, fit: BoxFit.cover,),
                  //                     )),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Text(
                  //             "IGU/USDT",
                  //             style: CustomWidget(context: context)
                  //                 .CustomSizedTextStyle(
                  //                 18.0,
                  //                 Theme.of(context).focusColor,
                  //                 FontWeight.w600,
                  //                 'FontRegular'),
                  //           ),
                  //           const SizedBox(height: 3.0,),
                  //           Container(
                  //             padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 7.0),
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(15.0),
                  //               color: Theme.of(context).primaryColorLight.withOpacity(0.2),
                  //             ),
                  //             child: Text(
                  //               "Spot grid",
                  //               style: CustomWidget(context: context)
                  //                   .CustomSizedTextStyle(
                  //                   9.0,
                  //                   Theme.of(context).focusColor,
                  //                   FontWeight.w500,
                  //                   'FontRegular'),
                  //             ),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Text(
                  //             "+120.4%",
                  //             style: CustomWidget(context: context)
                  //                 .CustomSizedTextStyle(
                  //                 17.0,
                  //                 Theme.of(context).indicatorColor,
                  //                 FontWeight.w600,
                  //                 'FontRegular'),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Text(
                  //             "Sales: 13",
                  //             style: CustomWidget(context: context)
                  //                 .CustomSizedTextStyle(
                  //                 9.0,
                  //                 Theme.of(context).toggleableActiveColor,
                  //                 FontWeight.w500,
                  //                 'FontRegular'),
                  //           ),
                  //
                  //         ],
                  //       ),
                  //     ),flex: 1,)
                  //   ],
                  // ),
                  // const SizedBox(height: 15.0,),
                  // Row(
                  //   children: [
                  //     Flexible(child: Container(
                  //       width: MediaQuery.of(context).size.width * 0.5,
                  //       padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(15.0),
                  //         color: Theme.of(context).primaryColor,
                  //       ),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //
                  //           Align(
                  //             alignment: Alignment.topRight,
                  //             child: Container(
                  //               height: 25.0,
                  //               width: MediaQuery.of(context).size.width * 0.2,
                  //               padding: const EdgeInsets.only(
                  //                   left: 10.0,
                  //                   right: 10.0,
                  //                   top: 0.0,
                  //                   bottom: 0.0),
                  //               decoration: BoxDecoration(
                  //                 borderRadius:
                  //                 BorderRadius.circular(15.0),
                  //                 color: CustomTheme.of(context).hoverColor.withOpacity(0.1),
                  //               ),
                  //               child: Center(
                  //                 child: Theme(
                  //                   data: Theme.of(context).copyWith(
                  //                     canvasColor:
                  //                     CustomTheme.of(context)
                  //                         .focusColor,
                  //                   ),
                  //                   child:
                  //                   DropdownButtonHideUnderline(
                  //                     child: DropdownButton(
                  //                       items: orderType
                  //                           .map(
                  //                               (value) =>
                  //                               DropdownMenuItem(
                  //                                 child: Text(
                  //                                   value,
                  //                                   style: CustomWidget(context: context).CustomSizedTextStyle(
                  //                                       6.0,
                  //                                       Theme.of(
                  //                                           context)
                  //                                           .indicatorColor,
                  //                                       FontWeight
                  //                                           .w500,
                  //                                       'FontRegular'),
                  //                                 ),
                  //                                 value: value,
                  //                               ))
                  //                           .toList(),
                  //                       onChanged: (value) {
                  //                         setState(() {
                  //
                  //                         });
                  //                       },
                  //                       isExpanded: true,
                  //                       value: selectedType,
                  //                       icon: Icon(
                  //                         Icons.keyboard_arrow_down,
                  //                         color:
                  //                         CustomTheme.of(context)
                  //                             .indicatorColor,
                  //                         size: 13.0,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Container(
                  //             child: Stack(
                  //               children: [
                  //                 Container(
                  //                   height: 30.0,
                  //                   width: 30.0,
                  //                   padding: EdgeInsets.all(1.0),
                  //                   decoration: BoxDecoration(
                  //                       color:Theme.of(context).primaryColor,
                  //                       shape: BoxShape.circle
                  //                   ),
                  //                   child: SvgPicture.asset("assets/images/b.svg", height: 30.0, fit: BoxFit.cover,),
                  //                 ),
                  //                 Padding(padding: EdgeInsets.only(left: 20.0),
                  //                     child: Container(
                  //                       height: 30.0,
                  //                       width: 30.0,
                  //                       padding: EdgeInsets.all(1.0),
                  //                       decoration: BoxDecoration(
                  //                           color: Theme.of(context)
                  //                               .primaryColor,
                  //                           shape: BoxShape.circle),
                  //                       child: SvgPicture.asset("assets/images/t.svg", height: 30.0, fit: BoxFit.cover,),
                  //                     )),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Text(
                  //             "IGU/USDT",
                  //             style: CustomWidget(context: context)
                  //                 .CustomSizedTextStyle(
                  //                 18.0,
                  //                 Theme.of(context).focusColor,
                  //                 FontWeight.w600,
                  //                 'FontRegular'),
                  //           ),
                  //           const SizedBox(height: 3.0,),
                  //           Container(
                  //             padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 7.0),
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(15.0),
                  //               color: Theme.of(context).primaryColorLight.withOpacity(0.2),
                  //             ),
                  //             child: Text(
                  //               "Spot grid",
                  //               style: CustomWidget(context: context)
                  //                   .CustomSizedTextStyle(
                  //                   9.0,
                  //                   Theme.of(context).focusColor,
                  //                   FontWeight.w500,
                  //                   'FontRegular'),
                  //             ),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Text(
                  //             "+120.4%",
                  //             style: CustomWidget(context: context)
                  //                 .CustomSizedTextStyle(
                  //                 17.0,
                  //                 Theme.of(context).indicatorColor,
                  //                 FontWeight.w600,
                  //                 'FontRegular'),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Text(
                  //             "Sales: 13",
                  //             style: CustomWidget(context: context)
                  //                 .CustomSizedTextStyle(
                  //                 9.0,
                  //                 Theme.of(context).toggleableActiveColor,
                  //                 FontWeight.w500,
                  //                 'FontRegular'),
                  //           ),
                  //
                  //         ],
                  //       ),
                  //     ),flex: 1,),
                  //     const SizedBox(width: 15.0,),
                  //     Flexible(child: Container(
                  //       width: MediaQuery.of(context).size.width * 0.5,
                  //       padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(15.0),
                  //         color: Theme.of(context).primaryColor,
                  //       ),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //
                  //           Align(
                  //             alignment: Alignment.topRight,
                  //             child: Container(
                  //               height: 25.0,
                  //               width: MediaQuery.of(context).size.width * 0.2,
                  //               padding: const EdgeInsets.only(
                  //                   left: 10.0,
                  //                   right: 10.0,
                  //                   top: 0.0,
                  //                   bottom: 0.0),
                  //               decoration: BoxDecoration(
                  //                 borderRadius:
                  //                 BorderRadius.circular(15.0),
                  //                 color: CustomTheme.of(context).hoverColor.withOpacity(0.1),
                  //               ),
                  //               child: Center(
                  //                 child: Theme(
                  //                   data: Theme.of(context).copyWith(
                  //                     canvasColor:
                  //                     CustomTheme.of(context)
                  //                         .focusColor,
                  //                   ),
                  //                   child:
                  //                   DropdownButtonHideUnderline(
                  //                     child: DropdownButton(
                  //                       items: orderType
                  //                           .map(
                  //                               (value) =>
                  //                               DropdownMenuItem(
                  //                                 child: Text(
                  //                                   value,
                  //                                   style: CustomWidget(context: context).CustomSizedTextStyle(
                  //                                       6.0,
                  //                                       Theme.of(
                  //                                           context)
                  //                                           .indicatorColor,
                  //                                       FontWeight
                  //                                           .w500,
                  //                                       'FontRegular'),
                  //                                 ),
                  //                                 value: value,
                  //                               ))
                  //                           .toList(),
                  //                       onChanged: (value) {
                  //                         setState(() {
                  //
                  //                         });
                  //                       },
                  //                       isExpanded: true,
                  //                       value: selectedType,
                  //                       icon: Icon(
                  //                         Icons.keyboard_arrow_down,
                  //                         color:
                  //                         CustomTheme.of(context)
                  //                             .indicatorColor,
                  //                         size: 13.0,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Container(
                  //             child: Stack(
                  //               children: [
                  //                 Container(
                  //                   height: 30.0,
                  //                   width: 30.0,
                  //                   padding: EdgeInsets.all(1.0),
                  //                   decoration: BoxDecoration(
                  //                       color:Theme.of(context).primaryColor,
                  //                       shape: BoxShape.circle
                  //                   ),
                  //                   child: SvgPicture.asset("assets/images/b.svg", height: 30.0, fit: BoxFit.cover,),
                  //                 ),
                  //                 Padding(padding: EdgeInsets.only(left: 20.0),
                  //                     child: Container(
                  //                       height: 30.0,
                  //                       width: 30.0,
                  //                       padding: EdgeInsets.all(1.0),
                  //                       decoration: BoxDecoration(
                  //                           color: Theme.of(context)
                  //                               .primaryColor,
                  //                           shape: BoxShape.circle),
                  //                       child: SvgPicture.asset("assets/images/t.svg", height: 30.0, fit: BoxFit.cover,),
                  //                     )),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Text(
                  //             "IGU/USDT",
                  //             style: CustomWidget(context: context)
                  //                 .CustomSizedTextStyle(
                  //                 18.0,
                  //                 Theme.of(context).focusColor,
                  //                 FontWeight.w600,
                  //                 'FontRegular'),
                  //           ),
                  //           const SizedBox(height: 3.0,),
                  //           Container(
                  //             padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 7.0),
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(15.0),
                  //               color: Theme.of(context).primaryColorLight.withOpacity(0.2),
                  //             ),
                  //             child: Text(
                  //               "Spot grid",
                  //               style: CustomWidget(context: context)
                  //                   .CustomSizedTextStyle(
                  //                   9.0,
                  //                   Theme.of(context).focusColor,
                  //                   FontWeight.w500,
                  //                   'FontRegular'),
                  //             ),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Text(
                  //             "+120.4%",
                  //             style: CustomWidget(context: context)
                  //                 .CustomSizedTextStyle(
                  //                 17.0,
                  //                 Theme.of(context).indicatorColor,
                  //                 FontWeight.w600,
                  //                 'FontRegular'),
                  //           ),
                  //           const SizedBox(height: 5.0,),
                  //           Text(
                  //             "Sales: 13",
                  //             style: CustomWidget(context: context)
                  //                 .CustomSizedTextStyle(
                  //                 9.0,
                  //                 Theme.of(context).toggleableActiveColor,
                  //                 FontWeight.w500,
                  //                 'FontRegular'),
                  //           ),
                  //
                  //         ],
                  //       ),
                  //     ),flex: 1,)
                  //   ],
                  // ),

                  GridView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      controller: _scrollController,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 25.0,
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                      top: 0.0,
                                      bottom: 0.0),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(15.0),
                                    color: CustomTheme.of(context).hoverColor.withOpacity(0.1),
                                  ),
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
                                                          6.0,
                                                          Theme.of(
                                                              context)
                                                              .indicatorColor,
                                                          FontWeight
                                                              .w500,
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
                                                .indicatorColor,
                                            size: 13.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5.0,),
                              Container(
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      padding: EdgeInsets.all(1.0),
                                      decoration: BoxDecoration(
                                          color:Theme.of(context).primaryColor,
                                          shape: BoxShape.circle
                                      ),
                                      child: SvgPicture.asset("assets/images/b.svg", height: 30.0, fit: BoxFit.cover,),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 20.0),
                                        child: Container(
                                          height: 30.0,
                                          width: 30.0,
                                          padding: EdgeInsets.all(1.0),
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              shape: BoxShape.circle),
                                          child: SvgPicture.asset("assets/images/t.svg", height: 30.0, fit: BoxFit.cover,),
                                        )),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5.0,),
                              Text(
                                "IGU/USDT",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    15.0,
                                    Theme.of(context).focusColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                              ),
                              const SizedBox(height: 3.0,),
                              Container(
                                padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 7.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Theme.of(context).primaryColorLight.withOpacity(0.2),
                                ),
                                child: Text(
                                  "Spot grid",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      9.0,
                                      Theme.of(context).focusColor,
                                      FontWeight.w500,
                                      'FontRegular'),
                                ),
                              ),
                              const SizedBox(height: 5.0,),
                              Text(
                                "+120.4%",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(context).indicatorColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                              ),
                              const SizedBox(height: 5.0,),
                              Text(
                                "Sales: 13",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    9.0,
                                    Theme.of(context).toggleableActiveColor,
                                    FontWeight.w500,
                                    'FontRegular'),
                              ),

                            ],
                          ),
                        );
                      }),
                  const SizedBox(height: 20.0,),


                ],
              ),
            )));
  }


  Widget FutureUI() {
    return Container(
        color: CustomTheme.of(context).focusColor,

        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  // Row(
                  //   children: [
                  //     Flexible(child: Container(
                  //       width: MediaQuery.of(context).size.width,
                  //       padding: EdgeInsets.fromLTRB(20.0, 20.0, 15.0, 5.0),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10.0),
                  //         color: Theme.of(context).unselectedWidgetColor,
                  //         // image: DecorationImage(
                  //         //   image: AssetImage("assets/icon/back.png"),
                  //         //   fit: BoxFit.cover,
                  //         // ),
                  //       ),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           Row(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Flexible(
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     const SizedBox(height: 10.0,),
                  //                     Text(
                  //                       "My copy traders",
                  //                       style: CustomWidget(context: context)
                  //                           .CustomSizedTextStyle(
                  //                           10.0,
                  //                           Theme.of(context).focusColor,
                  //                           FontWeight.w500,
                  //                           'FontRegular'),
                  //                     ),
                  //                     const SizedBox(height: 30.0,),
                  //
                  //                     Container(
                  //                       padding: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 7.0),
                  //                       decoration: BoxDecoration(
                  //                           borderRadius: BorderRadius.circular(6.0),
                  //                           border: Border.all(width: 1.0, color: Theme.of(context).primaryColor,),
                  //                           color: Theme.of(context).focusColor
                  //                       ),
                  //                       child: Text(
                  //                         "View traders",
                  //                         style: CustomWidget(context: context)
                  //                             .CustomSizedTextStyle(
                  //                             5.0,
                  //                             Theme.of(context).primaryColor,
                  //                             FontWeight.w400,
                  //                             'FontRegular'),
                  //                       ),
                  //                     )
                  //                   ],
                  //                 ),
                  //                 flex: 2,
                  //               ),
                  //               Flexible(
                  //                 child: Container(
                  //                   child: Align(
                  //                     alignment: Alignment.bottomCenter,
                  //                     child: SvgPicture.asset("assets/images/cofi.svg", fit: BoxFit.contain, ),
                  //                   ),
                  //                 ),
                  //                 flex: 1,
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),flex: 1,),
                  //     const SizedBox(width: 10.0,),
                  //     Flexible(child: Container(
                  //       width: MediaQuery.of(context).size.width,
                  //       padding: EdgeInsets.fromLTRB(20.0, 20.0, 15.0, 5.0),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10.0),
                  //         color: Theme.of(context).primaryColorLight,
                  //         // image: DecorationImage(
                  //         //   image: AssetImage("assets/icon/back.png"),
                  //         //   fit: BoxFit.cover,
                  //         // ),
                  //       ),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           Row(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Flexible(
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     const SizedBox(height: 10.0,),
                  //                     Text(
                  //                       "Earn as a trader",
                  //                       style: CustomWidget(context: context)
                  //                           .CustomSizedTextStyle(
                  //                           10.0,
                  //                           Theme.of(context).focusColor,
                  //                           FontWeight.w500,
                  //                           'FontRegular'),
                  //                     ),
                  //                     const SizedBox(height: 30.0,),
                  //
                  //                     Container(
                  //                       padding: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 7.0),
                  //                       decoration: BoxDecoration(
                  //                           borderRadius: BorderRadius.circular(6.0),
                  //                           border: Border.all(width: 1.0, color: Theme.of(context).primaryColor,),
                  //                           color: Theme.of(context).focusColor
                  //                       ),
                  //                       child: Text(
                  //                         "Apply now",
                  //                         style: CustomWidget(context: context)
                  //                             .CustomSizedTextStyle(
                  //                             5.0,
                  //                             Theme.of(context).primaryColor,
                  //                             FontWeight.w400,
                  //                             'FontRegular'),
                  //                       ),
                  //                     )
                  //                   ],
                  //                 ),
                  //                 flex: 2,
                  //               ),
                  //               Flexible(
                  //                 child: Container(
                  //                   child: Align(
                  //                     alignment: Alignment.bottomCenter,
                  //                     child: SvgPicture.asset("assets/images/cofi.svg", fit: BoxFit.contain, ),
                  //                   ),
                  //                 ),
                  //                 flex: 1,
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),flex: 1,)
                  //   ],
                  // ),
                  // const SizedBox(height: 10.0,),

                  Text(
                    "Elite traders",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        18.0,
                        Theme.of(context).primaryColor,
                        FontWeight.w600,
                        'FontRegular'),
                  ),
                  const SizedBox(height: 4.0,),
                  Text(
                    "Over all ranking*",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        10.0,
                        Theme.of(context).primaryColor,
                        FontWeight.w600,
                        'FontRegular'),
                  ),
                  const SizedBox(height: 10.0,),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 12.0),
                    width: MediaQuery.of(context).size.width,
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/search.svg", height: 20.0, color: Theme.of(context).focusColor,),
                        const SizedBox(width: 10.0,),
                        Flexible(child: TextField(
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
                                  .focusColor,
                              FontWeight.w500,
                              'FontRegular'),


                          onChanged: (value) {
                        setState(() {
                          copyTradelist=[];
                          if(value.isNotEmpty)

                          {
                            for(int m=0;m<searchcopyTradelist.length;m++)
                            {
                              if(searchcopyTradelist[m].traderNickName.toString().toLowerCase().contains(value.toString().toLowerCase())){
                                copyTradelist.add(searchcopyTradelist[m]);
                              }

                            }
                          }
                          else{
                            copyTradelist.clear();copyTradelist=[];
                            copyTradelist.addAll(searchcopyTradelist);
                          }
                        });
                          },
                          decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.only(
                                  top:
                                  5.0,bottom: 13.0),
                              hintText: "Search Traders",
                              hintStyle: CustomWidget(
                                  context:
                                  context)
                                  .CustomSizedTextStyle(
                                  10.0,
                                  Theme.of(
                                      context)
                                      .unselectedWidgetColor,
                                  FontWeight
                                      .w500,
                                  'FontRegular'),
                              border: InputBorder
                                  .none),
                          textAlign:
                          TextAlign.start,
                        ),)
                       
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0,),



                  const SizedBox(height: 10.0,),




                ],
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15),
                child:  ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: copyTradelist.length,
                  shrinkWrap: true,

                  controller: _futurescrollController,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CopyTradeOverviewDetails(
                                          data: copyTradelist[index],

                                        )));

                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        15.0, 12.0, 0.0, 13.0),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: NetworkImage(  copyTradelist[index].traderHeadPic.toString(),),
                                              )
                                             ,
                                              const SizedBox(
                                                width: 20.0,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.4,
                                                    child: Text(
                                                      copyTradelist[index].traderNickName.toString(),
                                                      style: CustomWidget(context: context)
                                                          .CustomSizedTextStyle(
                                                          10.0,
                                                          Theme.of(context).focusColor,
                                                          FontWeight.w600,
                                                          'FontRegular'),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                        EdgeInsets.zero,
                                                        child: Icon(
                                                          Icons.person,
                                                          size: 10.0,
                                                          color:
                                                          Theme.of(context)
                                                              .focusColor,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 5.0,
                                                      ),
                                                      Text(
                                                        copyTradelist[index].followCount.toString()+ " / "+copyTradelist[index].totalFollowers.toString(),
                                                        style: CustomWidget(
                                                            context:
                                                            context)
                                                            .CustomSizedTextStyle(
                                                            4.0,
                                                            Theme.of(
                                                                context)
                                                                .focusColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: InkWell(
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  15.0, 5.0, 15.0, 6.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(15.0),
                                                color: Theme.of(context)
                                                    .primaryColorLight,
                                              ),
                                              child: Text(
                                                "Copy ",
                                                style: CustomWidget(
                                                    context: context)
                                                    .CustomSizedTextStyle(
                                                    8.0,
                                                    Theme.of(context)
                                                        .primaryColor,
                                                    FontWeight.w600,
                                                    'FontRegular'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 0.5,
                                  color: Theme.of(context).focusColor,
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        15.0, 12.0, 0.0, 0.0),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "ROI",
                                                style: CustomWidget(
                                                    context: context)
                                                    .CustomSizedTextStyle(
                                                    8.0,
                                                    Theme.of(context)
                                                        .focusColor,
                                                    FontWeight.w600,
                                                    'FontRegular'),
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                copyTradelist[index].columnList![0].value.toString()+ "%",
                                                style: CustomWidget(
                                                    context: context)
                                                    .CustomSizedTextStyle(
                                                    14.0,
                                                    Theme.of(context)
                                                        .focusColor,
                                                    FontWeight.w600,
                                                    'FontRegular'),
                                              ),
                                              const SizedBox(
                                                height: 15.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: SvgPicture.asset(
                                            "assets/images/copy_trade.svg",
                                            fit: BoxFit.cover,
                                            // height: 60.0,
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 0.5,
                                  color: Theme.of(context).focusColor,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                      15.0, 10.0, 15.0, 10.0),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15.0),
                                          bottomRight: Radius.circular(15.0))),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'Total Copy traders profit ',
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              6.0,
                                              Theme.of(context)
                                                  .unselectedWidgetColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                          children:  <TextSpan>[
                                            TextSpan(
                                                text: copyTradelist[index].columnList![3].value.toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 7.0,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'AUM ',
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              6.0,
                                              Theme.of(context)
                                                  .unselectedWidgetColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                          children:  <TextSpan>[
                                            TextSpan(
                                                text: copyTradelist[index].columnList![5].value.toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 7.0,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0,),

                      ],
                    );
                  },
                ),
              ),
              botLoader?Container(
                child: Center(
                  child: CustomWidget(context: context).loadingIndicator_white(
                    CustomTheme.of(context).primaryColorLight,
                  ) ,
                ),
              ):Container()
            ],
          ),
        ));
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 15.0, 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Theme.of(context).unselectedWidgetColor,
                          // image: DecorationImage(
                          //   image: AssetImage("assets/icon/back.png"),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10.0,),
                                      Text(
                                        "My copy traders",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context).focusColor,
                                            FontWeight.w500,
                                            'FontRegular'),
                                      ),
                                      const SizedBox(height: 30.0,),

                                      Container(
                                        padding: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 7.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6.0),
                                            border: Border.all(width: 1.0, color: Theme.of(context).primaryColor,),
                                            color: Theme.of(context).focusColor
                                        ),
                                        child: Text(
                                          "View traders",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              5.0,
                                              Theme.of(context).primaryColor,
                                              FontWeight.w400,
                                              'FontRegular'),
                                        ),
                                      )
                                    ],
                                  ),
                                  flex: 2,
                                ),
                                Flexible(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: SvgPicture.asset("assets/images/cofi.svg", fit: BoxFit.contain, ),
                                    ),
                                  ),
                                  flex: 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),flex: 1,),
                      const SizedBox(width: 10.0,),
                      Flexible(child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 15.0, 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Theme.of(context).primaryColorLight,
                          // image: DecorationImage(
                          //   image: AssetImage("assets/icon/back.png"),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10.0,),
                                      Text(
                                        "Earn as a trader",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context).focusColor,
                                            FontWeight.w500,
                                            'FontRegular'),
                                      ),
                                      const SizedBox(height: 30.0,),

                                      Container(
                                        padding: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 7.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6.0),
                                            border: Border.all(width: 1.0, color: Theme.of(context).primaryColor,),
                                            color: Theme.of(context).focusColor
                                        ),
                                        child: Text(
                                          "Apply now",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              5.0,
                                              Theme.of(context).primaryColor,
                                              FontWeight.w400,
                                              'FontRegular'),
                                        ),
                                      )
                                    ],
                                  ),
                                  flex: 2,
                                ),
                                Flexible(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: SvgPicture.asset("assets/images/cofi.svg", fit: BoxFit.contain, ),
                                    ),
                                  ),
                                  flex: 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),flex: 1,)
                    ],
                  ),
                  const SizedBox(height: 10.0,),

                  Text(
                    "Elite traders",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        18.0,
                        Theme.of(context).primaryColor,
                        FontWeight.w600,
                        'FontRegular'),
                  ),
                  const SizedBox(height: 4.0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Over all ranking*",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            10.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.filter_1, color: Theme.of(context).primaryColor,size: 10.0,),
                            const SizedBox(width: 10.0,),
                            SvgPicture.asset("assets/images/filter.svg", color: Theme.of(context).primaryColor,height: 10.0,)
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0,),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 12.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/search.svg", height: 20.0, color: Theme.of(context).unselectedWidgetColor,),
                        const SizedBox(width: 10.0,),
                        Text(
                          "Search trader",
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              12.0,
                              Theme.of(context).unselectedWidgetColor,
                              FontWeight.w600,
                              'FontRegular'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0,),

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
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).canvasColor,
                                        borderRadius: BorderRadius.circular(15.0)),
                                    child: Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15.0, 12.0, 0.0, 13.0),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.all(5.0),
                                                        decoration: BoxDecoration(
                                                            color: Theme.of(context)
                                                                .focusColor,
                                                            shape: BoxShape.circle),
                                                        child: Image.asset(
                                                          "assets/images/bg.png",
                                                          height: 30.0,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 20.0,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(context).size.width * 0.4,
                                                            child: Text(
                                                              "BTC7Monitor",
                                                              style: CustomWidget(context: context)
                                                                  .CustomSizedTextStyle(
                                                                  10.0,
                                                                  Theme.of(context).focusColor,
                                                                  FontWeight.w600,
                                                                  'FontRegular'),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                EdgeInsets.zero,
                                                                child: Icon(
                                                                  Icons.person,
                                                                  size: 10.0,
                                                                  color:
                                                                  Theme.of(context)
                                                                      .focusColor,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 5.0,
                                                              ),
                                                              Text(
                                                                "999/1000",
                                                                style: CustomWidget(
                                                                    context:
                                                                    context)
                                                                    .CustomSizedTextStyle(
                                                                    4.0,
                                                                    Theme.of(
                                                                        context)
                                                                        .focusColor,
                                                                    FontWeight.w600,
                                                                    'FontRegular'),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(right: 10.0),
                                                  child: InkWell(
                                                    child: Container(
                                                      padding: EdgeInsets.fromLTRB(
                                                          15.0, 5.0, 15.0, 6.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(15.0),
                                                        color: Theme.of(context)
                                                            .primaryColorLight,
                                                      ),
                                                      child: Text(
                                                        "Copy ",
                                                        style: CustomWidget(
                                                            context: context)
                                                            .CustomSizedTextStyle(
                                                            8.0,
                                                            Theme.of(context)
                                                                .primaryColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 0.5,
                                          color: Theme.of(context).focusColor,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15.0, 12.0, 0.0, 0.0),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
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
                                                      const SizedBox(
                                                        height: 5.0,
                                                      ),
                                                      Text(
                                                        "+372.18%",
                                                        style: CustomWidget(
                                                            context: context)
                                                            .CustomSizedTextStyle(
                                                            14.0,
                                                            Theme.of(context)
                                                                .focusColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                      ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: SvgPicture.asset(
                                                    "assets/images/copy_trade.svg",
                                                    fit: BoxFit.cover,
                                                    // height: 60.0,
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 0.5,
                                          color: Theme.of(context).focusColor,
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              15.0, 10.0, 15.0, 10.0),
                                          decoration: BoxDecoration(
                                              color: Theme.of(context).primaryColor,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(15.0),
                                                  bottomRight: Radius.circular(15.0))),
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: 'Total Copy traders profit ',
                                                  style: CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                      6.0,
                                                      Theme.of(context)
                                                          .unselectedWidgetColor,
                                                      FontWeight.w600,
                                                      'FontRegular'),
                                                  children: const <TextSpan>[
                                                    TextSpan(
                                                        text: '\$1,37456.10',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 6.0,
                                                          fontWeight: FontWeight.w600,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  text: 'AUM ',
                                                  style: CustomWidget(context: context)
                                                      .CustomSizedTextStyle(
                                                      6.0,
                                                      Theme.of(context)
                                                          .unselectedWidgetColor,
                                                      FontWeight.w600,
                                                      'FontRegular'),
                                                  children: const <TextSpan>[
                                                    TextSpan(
                                                        text: '\$1,974573.10',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 6.0,
                                                          fontWeight: FontWeight.w600,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20.0,),

                                ],
                              );
                            },
                          ))),

                  const SizedBox(height: 10.0,),




                ],
              ),
            )));
  }

  Widget BotsUI() {
    return Container(
        color: CustomTheme.of(context).focusColor,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  InkWell(
                    onTap: (){
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             CopyTradeOverviewDetails()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 15.0, 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).primaryColorLight,
                        // image: DecorationImage(
                        //   image: AssetImage("assets/icon/back.png"),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color:Theme.of(context).focusColor,
                                    shape: BoxShape.circle
                                ),
                                child: Image.asset("assets/images/bg.png", height: 30.0,),
                              ),
                              const SizedBox(width: 10.0,),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Text(
                                  "BTC7Monitor",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      10.0,
                                      Theme.of(context).focusColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10.0,),
                                    Text(
                                      "Holding value",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          10.0,
                                          Theme.of(context).focusColor,
                                          FontWeight.w500,
                                          'FontRegular'),
                                    ),
                                    const SizedBox(height: 10.0,),
                                    RichText(
                                      text: TextSpan(
                                        text: '\$2,509.75 ',
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            18.0,
                                            Theme.of(context).focusColor,
                                            FontWeight.w700,
                                            'FontRegular'),
                                        children: const <TextSpan>[
                                          TextSpan(text: '+9.77%', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.0, color: Colors.white70,)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20.0,),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Invested value",
                                                style: CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                    10.0,
                                                    Theme.of(context).focusColor,
                                                    FontWeight.w500,
                                                    'FontRegular'),
                                              ),
                                              const SizedBox(height: 5.0,),
                                              Text(
                                                "\$1,618.75",
                                                style: CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                    16.0,
                                                    Theme.of(context).focusColor,
                                                    FontWeight.w500,
                                                    'FontRegular'),
                                              ),
                                            ],), flex: 2,),
                                          Flexible(child: Container(
                                            height: 50.0,
                                            width: 1.0,
                                            color: Theme.of(context).focusColor.withOpacity(0.6),
                                          )),
                                          Expanded(child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Profit",
                                                style: CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                    10.0,
                                                    Theme.of(context).focusColor,
                                                    FontWeight.w500,
                                                    'FontRegular'),
                                                textAlign: TextAlign.start,
                                              ),
                                              const SizedBox(height: 5.0,),
                                              Text(
                                                "\$1589",
                                                style: CustomWidget(context: context)
                                                    .CustomSizedTextStyle(
                                                    16.0,
                                                    Theme.of(context).focusColor,
                                                    FontWeight.w500,
                                                    'FontRegular'),
                                                textAlign: TextAlign.start,
                                              ),
                                            ],), flex: 2,),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                flex: 2,
                              ),
                              Flexible(
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: SvgPicture.asset("assets/images/cofi.svg", fit: BoxFit.contain, height: 140.0, ),
                                  ),
                                ),
                                flex: 1,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15.0,),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0,),

                  GridView.builder(
                      itemCount: img.length,
                      shrinkWrap: true,
                      controller: _scrollController,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            if(index==0){
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          My_Strategies_Details()));
                            }
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(img[index].toString(), height: 20.0,),
                                const SizedBox(height: 10.0,),
                                Text(
                                  // "My strategies",
                                  imgText[index].toString(),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      8.0,
                                      Theme.of(context).toggleableActiveColor,
                                      FontWeight.w500,
                                      'FontRegular'),
                                  textAlign: TextAlign.center,
                                ),

                              ],
                            ),
                          ),
                        );
                      }),
                  const SizedBox(height: 15.0,),

                  Text(
                    "Strategies",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        18.0,
                        Theme.of(context).primaryColor,
                        FontWeight.w600,
                        'FontRegular'),
                  ),
                  const SizedBox(height: 4.0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ranking*",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            10.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: SvgPicture.asset("assets/images/filter.svg", color: Theme.of(context).primaryColor,height: 10.0,),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0,),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 12.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/search.svg", height: 20.0, color: Theme.of(context).unselectedWidgetColor,),
                        const SizedBox(width: 10.0,),
                        Text(
                          "Search trader",
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              12.0,
                              Theme.of(context).unselectedWidgetColor,
                              FontWeight.w600,
                              'FontRegular'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0,),

                  Container(
                      color: Theme.of(context).focusColor,
                      child: SingleChildScrollView(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 5,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            controller: controller,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(15.0)),
                                    child: Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15.0, 13.0, 15.0, 13.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Container(
                                                            child: Stack(
                                                              children: [
                                                                Container(
                                                                  height: 35.0,
                                                                  width: 35.0,
                                                                  // padding: EdgeInsets.all(1.0),
                                                                  decoration: BoxDecoration(
                                                                    // color:Theme.of(context).focusColor,
                                                                      shape: BoxShape.circle
                                                                  ),
                                                                  child: Center(
                                                                    child: SvgPicture.asset("assets/images/b.svg", height: 25.0, fit: BoxFit.cover,),
                                                                  ),
                                                                ),
                                                                Padding(padding: EdgeInsets.only(left: 15.0),
                                                                    child: Container(
                                                                      height: 35.0,
                                                                      width: 35.0,
                                                                      // padding: EdgeInsets.all(1.0),
                                                                      decoration: BoxDecoration(
                                                                        // color: Theme.of(context)
                                                                        //     .focusColor,
                                                                          shape: BoxShape.circle),
                                                                      child: Center(
                                                                        child: SvgPicture.asset("assets/images/t.svg", height: 25.0, fit: BoxFit.cover,),
                                                                      ),
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                children: [
                                                                  Text(
                                                                    "BTCUSDT",
                                                                    style: CustomWidget(
                                                                        context: context)
                                                                        .CustomSizedTextStyle(
                                                                        10.0,
                                                                        Theme.of(context)
                                                                            .focusColor,
                                                                        FontWeight.w600,
                                                                        'FontRegular'),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 10.0,
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 3.0),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(3.0),
                                                                        border: Border.all(width: 0.5, color: Theme.of(context).focusColor,)
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        "Futures",
                                                                        style: CustomWidget(
                                                                            context:
                                                                            context)
                                                                            .CustomSizedTextStyle(
                                                                            4.0,
                                                                            Theme.of(context)
                                                                                .focusColor,
                                                                            FontWeight
                                                                                .w600,
                                                                            'FontRegular'),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      child: Container(
                                                        padding: EdgeInsets.fromLTRB(
                                                            15.0, 5.0, 15.0, 6.0),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(15.0),
                                                          color: Theme.of(context)
                                                              .primaryColorLight,
                                                        ),
                                                        child: Text(
                                                          "Copy ",
                                                          style: CustomWidget(
                                                              context: context)
                                                              .CustomSizedTextStyle(
                                                              8.0,
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                              FontWeight.w600,
                                                              'FontRegular'),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 2.0,),
                                                InkWell(
                                                  child: Container(
                                                    padding: EdgeInsets.fromLTRB(
                                                        10.0, 5.0, 10.0, 5.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(10.0),
                                                      color: Theme.of(context)
                                                          .primaryColorLight. withOpacity(0.3),
                                                    ),
                                                    child: Text(
                                                      "Futures ",
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
                                            )),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 0.5,
                                          color: Theme.of(context).focusColor,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15.0, 12.0, 15.0, 0.0),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "+372.18%",
                                                        style: CustomWidget(
                                                            context: context)
                                                            .CustomSizedTextStyle(
                                                            14.0,
                                                            Theme.of(context)
                                                                .primaryColorLight,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                      ),
                                                      const SizedBox(
                                                        height: 5.0,
                                                      ),
                                                      Text(
                                                        "ROI",
                                                        style: CustomWidget(
                                                            context: context)
                                                            .CustomSizedTextStyle(
                                                            8.0,
                                                            Theme.of(context)
                                                                .canvasColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                      ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "\$2406.56",
                                                        style: CustomWidget(
                                                            context: context)
                                                            .CustomSizedTextStyle(
                                                            14.0,
                                                            Theme.of(context)
                                                                .focusColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                      ),
                                                      const SizedBox(
                                                        height: 5.0,
                                                      ),
                                                      Text(
                                                        "Pnl",
                                                        style: CustomWidget(
                                                            context: context)
                                                            .CustomSizedTextStyle(
                                                            8.0,
                                                            Theme.of(context)
                                                                .canvasColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                      ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "\$24",
                                                        style: CustomWidget(
                                                            context: context)
                                                            .CustomSizedTextStyle(
                                                            14.0,
                                                            Theme.of(context)
                                                                .focusColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                      ),
                                                      const SizedBox(
                                                        height: 5.0,
                                                      ),
                                                      Text(
                                                        "Price",
                                                        style: CustomWidget(
                                                            context: context)
                                                            .CustomSizedTextStyle(
                                                            8.0,
                                                            Theme.of(context)
                                                                .canvasColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                      ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 0.5,
                                          color: Theme.of(context).focusColor,
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              15.0, 10.0, 15.0, 10.0),
                                          decoration: BoxDecoration(
                                              color: Theme.of(context).primaryColor,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(15.0),
                                                  bottomRight: Radius.circular(15.0))),
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(1.0),
                                                      decoration: BoxDecoration(
                                                          color: Theme.of(context)
                                                              .focusColor,
                                                          shape: BoxShape.circle),
                                                      child: Image.asset(
                                                        "assets/images/bg.png",
                                                        height: 15.0,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width * 0.4,
                                                      child: Text(
                                                        "BTC7Monitor",
                                                        style: CustomWidget(context: context)
                                                            .CustomSizedTextStyle(
                                                            10.0,
                                                            Theme.of(context).focusColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.zero,
                                                    child: Icon(
                                                      Icons.access_time_rounded,
                                                      size: 12.0,
                                                      color:
                                                      Theme.of(context)
                                                          .focusColor,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  Text(
                                                    "96d 16h 35m",
                                                    style: CustomWidget(
                                                        context:
                                                        context)
                                                        .CustomSizedTextStyle(
                                                        6.0,
                                                        Theme.of(
                                                            context)
                                                            .unselectedWidgetColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.zero,
                                                    child: Icon(
                                                      Icons.keyboard_arrow_down_outlined,
                                                      size: 10.0,
                                                      color:
                                                      Theme.of(context)
                                                          .focusColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20.0,),

                                ],
                              );
                            },
                          ))),


                ],
              ),
            )));
  }

  getToken() {
    print(type);
    apiUtils.getCopyTradeData(type, page).then((dynamic loginData) {
      setState(() {
        loading=false;
      });

      if (loginData["msg"].toString() == "success") {
        List<dynamic> listData = loginData["data"];

        print(loginData["data"]);
        setState(() {
          copyLoadTradelist=[];
          loading = false;
          botLoader = false;
          List<CopyTrade>       copyTradelistN =
              (listData).map((item) => CopyTrade.fromJson(item)).toList();
          copyTradelist.addAll(copyTradelistN);
          searchcopyTradelist.addAll(copyTradelistN);
          copyLoadTradelist.addAll(copyTradelistN);
        });
      }
      else
        {
          setState(() {
            loading=false;
            botLoader=false;
            copyTradelist=[];
            searchcopyTradelist=[];
          });
        }
    }).catchError((Object error) {
      print(error);
      setState(() {
        loading = false;
        botLoader = false;
      });
    });
  }
}
