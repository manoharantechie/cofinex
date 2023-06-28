import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/theme/custom_theme.dart';

class Future_Details_Screen extends StatefulWidget {
  const Future_Details_Screen({Key? key}) : super(key: key);

  @override
  State<Future_Details_Screen> createState() => _Future_Details_ScreenState();
}

class _Future_Details_ScreenState extends State<Future_Details_Screen>
    with TickerProviderStateMixin {

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
                Container(
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
            child: Padding(
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

                 // Container(
                 //   height: 150.0,
                 //   child:
                 // )
                  Overview(),


                ],
              ),
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
                    Container(),
                    Container(),
                    Container(),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0,),

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
                ],
              ),
            )));
  }

}
