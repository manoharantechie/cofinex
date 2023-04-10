import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen>  with SingleTickerProviderStateMixin {
  late TabController _tabController;

  ScrollController _scrollController = ScrollController();
  List list_name=[
    "Bitcoin","Binance USD","Ethereum","Ripple","Dogecoin"
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.of(context).backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: CustomTheme.of(context).backgroundColor,
        child: Padding(
          padding: EdgeInsets.only(left: 20.0,right: 20.0),
          child: Column(
            children: [
              Container(
                height: 35.0,
                decoration: BoxDecoration(
                  color: CustomTheme.of(context).focusColor,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: CustomTheme.of(context).accentColor,width: 1.0)
                ),
                child:
                TabBar(
                  controller: _tabController,
                  labelStyle:CustomWidget(context: context)
                      .CustomSizedTextStyle(
                      13.0,
                      Theme.of(context).accentColor,
                      FontWeight.w600,
                      'FontRegular'),

                  labelColor: CustomTheme.of(context).primaryColor,
                  //<-- selected text color
                  unselectedLabelColor: CustomTheme.of(context)
                      .primaryColor
                      .withOpacity(0.5),
                  // isScrollable: true,
                  indicatorColor: CustomTheme.of(context).cardColor,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(12), // Creates border
                      color: CustomTheme.of(context).buttonColor,),
                  tabs: <Widget>[
                    Tab(
                      text: "Favourites",
                    ),
                    Tab(
                      text: "Coins",
                    ),
                    Tab(
                      text: "Zones",
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
                      favWidget(),
                      coinWidget(),
                      zonesWidget()
                      // spotList()
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
  Widget favWidget(){
    return  Container(

        child: ListView.builder(
          physics: ScrollPhysics(),
          itemCount: list_name.length,
          shrinkWrap: true,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                          Flexible(child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icon/fav.svg"),
                                const SizedBox(width: 20.0,),
                                Container(
                                  padding: EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Theme.of(context).highlightColor,
                                  ),
                                  child: SvgPicture.asset("assets/images/bit.svg", height: 25.0,),
                                ),
                                SizedBox(width: 5.0,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      list_name[index].toString(),
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 8.0,),
                                    Text(
                                      "BTC",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          12.0,
                                          Theme.of(context).canvasColor,
                                          FontWeight.w500,
                                          'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),flex: 2,),
                         Flexible(child:  Text(
                           " \$ 123.12",
                           style: CustomWidget(context: context)
                               .CustomSizedTextStyle(
                               14.0,
                               Theme.of(context).primaryColor,
                               FontWeight.w600,
                               'FontRegular'),
                           textAlign: TextAlign.center,
                         ),),
                          Container(
                            decoration: BoxDecoration(
                              color:      index%2==0?Theme.of(context).indicatorColor:Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(5.0)

                            ),
                            padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 5.0,bottom: 5.0),
                            child:Center(
                              child:  Text(
                                "0.1832",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).focusColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),

                            )
                          )

                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0,)

              ],
            );
          },
        )
    );
  }
  Widget coinWidget(){
    return  Container(

        child: ListView.builder(
          physics: ScrollPhysics(),
          itemCount: list_name.length,
          shrinkWrap: true,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                          Flexible(child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(index%2==0?"assets/icon/fav.svg":"assets/icon/favs.svg",),
                                const SizedBox(width: 20.0,),
                                Container(
                                  padding: EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Theme.of(context).highlightColor,
                                  ),
                                  child: SvgPicture.asset("assets/images/bit.svg", height: 25.0,),
                                ),
                                SizedBox(width: 5.0,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      list_name[index].toString(),
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 8.0,),
                                    Text(
                                      "BTC",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          12.0,
                                          Theme.of(context).canvasColor,
                                          FontWeight.w500,
                                          'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),flex: 2,),
                          Flexible(child:  Text(
                            " \$ 123.12",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                            textAlign: TextAlign.center,
                          ),),
                          Container(
                              decoration: BoxDecoration(
                                  color:      index%2==0?Theme.of(context).indicatorColor:Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(5.0)

                              ),
                              padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 5.0,bottom: 5.0),
                              child:Center(
                                child:  Text(
                                  "0.1832",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      12.0,
                                      Theme.of(context).focusColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                  textAlign: TextAlign.center,
                                ),

                              )
                          )

                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0,)

              ],
            );
          },
        )
    );
  }
  Widget zonesWidget(){
    return  Container(

        child: ListView.builder(
          physics: ScrollPhysics(),
          itemCount: list_name.length,
          shrinkWrap: true,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          list_name[index].toString(),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              14.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                        Column(
                          children: [

                            Text(
                            "BTC",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "12.0%",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  12.0,
                                  index%2==0?Theme.of(context).indicatorColor:Theme.of(context).scaffoldBackgroundColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )


                      ],
                    ),
                  )
                ),
                const SizedBox(height: 10.0,)

              ],
            );
          },
        )
    );
  }
}
