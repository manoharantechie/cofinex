import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/custom_widget.dart';
import '../../common/theme/custom_theme.dart';

class My_Strategies_Screen extends StatefulWidget {
  const My_Strategies_Screen({Key? key}) : super(key: key);

  @override
  State<My_Strategies_Screen> createState() => _My_Strategies_ScreenState();
}

class _My_Strategies_ScreenState extends State<My_Strategies_Screen>
    with TickerProviderStateMixin {

  late TabController _tabController, _tabSpotsController;
  ScrollController _scrollController = ScrollController();
  bool run = false;
  List<String> orderType = ["Market", "Strategies","Coin"];
  List<String> strategiesType = ["Strategies", "Market","Coin"];
  List<String> coinType = ["Coin", "Strategies","Market"];
  String selectedType = "";
  String selectType = "";
  String selType = "";

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    selectedType = orderType.first;
    selectType = strategiesType.first;
    selType = coinType.first;
    run= true;
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(data:  MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: Scaffold(
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
          "My strategies",
          style: CustomWidget(context: context)
              .CustomSizedTextStyle(
              18.0,
              Theme.of(context).primaryColor,
              FontWeight.w600,
              'FontRegular'),
        ),
        actions: [
          Ink(
            child: Container(
              padding: EdgeInsets.only(right: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.add_box_outlined, size: 15.0, color: Theme.of(context).primaryColor,),
                  const SizedBox(width: 10.0,),
                  Icon(Icons.question_mark_outlined, size: 15.0, color: Theme.of(context).primaryColor,),
                ],
              ),
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
          children: [
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "\$ 0",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                            const SizedBox(height: 10.0,),
                            Text(
                              "Profit",
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
                              "Investment ",
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
                  const SizedBox(height: 20.0,),
                ],
              ),
            ),
            const SizedBox(height: 20.0,),

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
                    text: "All",
                  ),
                  Tab(
                    text: "Purchased",
                  ),
                  Tab(
                    text: "Subscribed",
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
                    AllUI(),
                    Container(),
                    Container(),

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    ));
  }

  Widget AllUI() {
    return Container(
        color: CustomTheme.of(context).focusColor,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            controller: _scrollController,
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
                            "Running",
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
                            "History",
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
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 25.0,
                                  width: MediaQuery.of(context).size.width * 0.22,
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
                                                          10.0,
                                                          Theme.of(
                                                              context)
                                                              .primaryColor,
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
                                                .primaryColor,
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 25.0,
                                  width: MediaQuery.of(context).size.width * 0.28,
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
                                          items: strategiesType
                                              .map(
                                                  (value) =>
                                                  DropdownMenuItem(
                                                    child: Text(
                                                      value,
                                                      style: CustomWidget(context: context).CustomSizedTextStyle(
                                                          10.0,
                                                          Theme.of(
                                                              context)
                                                              .primaryColor,
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
                                          value: selectType,
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color:
                                            CustomTheme.of(context)
                                                .primaryColor,
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 25.0,
                                  width: MediaQuery.of(context).size.width * 0.22,
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
                                          items: coinType
                                              .map(
                                                  (value) =>
                                                  DropdownMenuItem(
                                                    child: Text(
                                                      value,
                                                      style: CustomWidget(context: context).CustomSizedTextStyle(
                                                          10.0,
                                                          Theme.of(
                                                              context)
                                                              .primaryColor,
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
                                          value: selType,
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color:
                                            CustomTheme.of(context)
                                                .primaryColor,
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset("assets/images/filter.svg", height: 12.0, color: Theme.of(context).primaryColor,)
                        ],
                      ),
                      const SizedBox(height: 15.0,),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0,),
                Container(
                  height: MediaQuery.of(context).size.height*0.3,
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
            )));
  }

}
