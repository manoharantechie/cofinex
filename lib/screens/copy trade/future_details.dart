import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/theme/custom_theme.dart';
import 'my_strategies.dart';

class Future_Details_Screen extends StatefulWidget {
  const Future_Details_Screen({Key? key}) : super(key: key);

  @override
  State<Future_Details_Screen> createState() => _Future_Details_ScreenState();
}

class _Future_Details_ScreenState extends State<Future_Details_Screen>
    with TickerProviderStateMixin {

  bool run = false;
  ScrollController _scrollController = ScrollController();
  ScrollController _scrollControll = ScrollController();
  late TabController _tabController, _tabSpotsController, _tabFutureController, _tabBotsController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabFutureController = TabController(vsync: this, length: 1);
    _tabSpotsController = TabController(vsync: this, length: 3);
    _tabController = TabController(vsync: this, length: 2);
    run = true;

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
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 22.0,
                    color: CustomTheme.of(context).primaryColor,
                  ),
                )
            ),

            centerTitle: true,
            title: Text(
              " ",
              style: CustomWidget(context: context)
                  .CustomSizedTextStyle(
                  16.0,
                  Theme.of(context).splashColor,
                  FontWeight.w500,
                  'FontRegular'),
            ),

          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: CustomTheme.of(context).focusColor,
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                My_Strategies_Screen()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: CustomTheme.of(context).primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Theme.of(context).primaryColorLight
                            ),
                            child: Text(
                              "Settings",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  7.0,
                                  Theme.of(context).focusColor,
                                  FontWeight.w500,
                                  'FontRegular'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0,),
                        Container(
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Container(
                                // padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .focusColor,
                                    shape: BoxShape.circle),
                                child: Image.asset(
                                  "assets/images/bg.png",
                                  height: 50.0,
                                ),
                              ),
                              const SizedBox(width: 20.0,),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dan Tourlan",
                                    style: CustomWidget(
                                        context: context)
                                        .CustomSizedTextStyle(
                                        14.0,
                                        Theme.of(context)
                                            .focusColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Joined 1 day ago",
                                        style: CustomWidget(
                                            context: context)
                                            .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context)
                                                .unselectedWidgetColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                      ),
                                      const SizedBox(width: 20.0,),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Follow',
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              10.0,
                                              Theme.of(context)
                                                  .unselectedWidgetColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                          children: const <TextSpan>[
                                            TextSpan(
                                                text: ' 0',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0,),


                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15.0,),
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
                        text: "Future",
                      ),
                      Tab(
                        text: "Spot",
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
                        FutureUI(),
                        SpotUI(),

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
        child: SingleChildScrollView(
            controller: _scrollControll,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Overview",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            18.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                      const SizedBox(height: 15.0,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(width: 20.0,),
                          Flexible(child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "0",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      14.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                ),
                                const SizedBox(height: 10.0,),
                                Text(
                                  "Capital (USDT)",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      8.0,
                                      Theme.of(context).canvasColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                ),
                              ],
                            ),
                          ),),
                          Flexible(child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "0",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      14.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                ),
                                const SizedBox(height: 10.0,),
                                Text(
                                  "Net profit (USDT)",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      8.0,
                                      Theme.of(context).canvasColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                ),
                              ],
                            ),
                          ),),
                        ],
                      ),
                      const SizedBox(height: 15.0,),
                    ],
                  ),
                ),

                Overview(),


              ],
            )));
  }

  Widget Overview() {
    return Container(
        color: CustomTheme.of(context).focusColor,
        height: MediaQuery.of(context).size.height,
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
                    width: 2.0,

                  ))
              ),
              child: TabBar(
                controller: _tabSpotsController,
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
                    text: "Current",
                  ),
                  Tab(
                    text: "History",
                  ),
                  Tab(
                    text: "My traders",
                  ),

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
                    Current(),
                    History(),
                    Mytrade(),

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0,),
          Padding(padding: EdgeInsets.only(left: 20.0, right: 20.0), child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: Theme.of(context).unselectedWidgetColor,)
            ),
            child: Row(
              children: [
                Flexible(child: InkWell(
                  onTap: (){
                    setState(() {
                      run = true;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(1.0),
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                    decoration: run ? BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Theme.of(context).primaryColorLight,
                    ) :  BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      // color: Theme.of(context).primaryColorLight,
                    ),
                    child: Text(
                      "Details",
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          13.0,
                          run ? Theme.of(context).primaryColor: Theme.of(context).unselectedWidgetColor,
                          FontWeight.w600,
                          'FontRegular'),
                    ),
                  ),
                ),flex: 1,),
                Flexible(child: InkWell(
                  onTap: (){
                    setState(() {
                      run = false;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(1.0),
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                    decoration: run ? BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      // color: Theme.of(context).primaryColorLight,
                    ) : BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    child: Text(
                      "Summery",
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          13.0,
                          run ? Theme.of(context).unselectedWidgetColor: Theme.of(context).primaryColor,
                          FontWeight.w600,
                          'FontRegular'),
                    ),
                  ),
                ),flex: 1,),
              ],
            ),
          ),),
          const SizedBox(height: 20.0,),

          Container(
            height: MediaQuery.of(context).size.height*0.4,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "There is nothing here",
                  style: CustomWidget(
                      context: context)
                      .CustomSizedTextStyle(
                      8.0,
                      Theme.of(context)
                          .unselectedWidgetColor,
                      FontWeight.w600,
                      'FontRegular'),
                ),
                const SizedBox(height: 10.0,),
                Container(
                  padding: EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Theme.of(context).primaryColor
                  ),
                  child: Text(
                    "Follow",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        10.0,
                        Theme.of(context).focusColor,
                        FontWeight.w500,
                        'FontRegular'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),);
  }
  Widget History() {
    return Container(
      color: CustomTheme.of(context).focusColor,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [


          const SizedBox(height: 20.0,),
        ],
      ),);
  }
  Widget Mytrade() {
    return Container(
      color: CustomTheme.of(context).focusColor,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [


          const SizedBox(height: 20.0,),
        ],
      ),);
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

                ],
              ),
            )));
  }

}
