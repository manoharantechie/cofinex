import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({Key? key}) : super(key: key);

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
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
  List<String> options=["more"];
  String selectedOption="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedOption=options.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: CustomTheme.of(context).focusColor,
        child: Column(
          children: [
            Container(

              color: CustomTheme.of(context).backgroundColor,
                height: MediaQuery.of(context).size.height*0.15,
              child: Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: ListView.builder(
                  physics: ScrollPhysics(),
                  itemCount: list_name.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 15.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).splashColor,
                                  width: 1.0),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                                bottomLeft: Radius.circular(15.0),
                              ),
                              color: currentIndex == index
                                  ? Theme.of(context).buttonColor
                                  : Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding:
                                  EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context).splashColor,
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: currentIndex == index
                                        ? Theme.of(context).focusColor
                                        : Theme.of(context).highlightColor,
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/images/bit.svg",
                                    height: 25.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
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
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ),
             Container(
              height: 15.0,
               color: CustomTheme.of(context).backgroundColor,
            ),
            Container(
                color: CustomTheme.of(context).focusColor,
                height: MediaQuery.of(context).size.height*0.65,
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
                              Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).indicatorColor,
                                      borderRadius: BorderRadius.circular(5.0)),
                                  padding: EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                      top: 5.0,
                                      bottom: 5.0),
                                  child: Center(
                                    child: Text(
                                      "1.76%",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                              12.0,
                                              Theme.of(context).focusColor,
                                              FontWeight.w500,
                                              'FontRegular'),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "22,228.00",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                    22.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                            textAlign: TextAlign.center,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "24 High",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context).canvasColor,
                                            FontWeight.w500,
                                            'FontRegular'),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Text(
                                    "22,391.00",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w500,
                                            'FontRegular'),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "24 High",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context).canvasColor,
                                            FontWeight.w500,
                                            'FontRegular'),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Text(
                                    "22,391.00",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w500,
                                            'FontRegular'),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/icon/togle.svg',
                            height: 25.0,
                          ),
                          Row(

                            children: [
                              Container(
                                height: 35.0,
                                child: ListView.builder(
                                    itemCount: chartTime.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Row(
                                        children: [
                                          InkWell(
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0, right: 12.0),
                                              decoration: BoxDecoration(

                                                  color: indexVal == index
                                                      ? CustomTheme.of(context)
                                                          .hintColor
                                                      : CustomTheme.of(context)
                                                          .focusColor,

                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              12.0)),
                                                border: Border.all(
                                                  color: indexVal == index
                                                      ? CustomTheme.of(context)
                                                      .hintColor
                                                      : CustomTheme.of(context)
                                                      .canvasColor.withOpacity(0.5),
                                                )
                                              ),
                                              child: Center(
                                                child: Text(
                                                  chartTime[index].toString(),
                                                  style: CustomWidget(
                                                          context: context)
                                                      .CustomSizedTextStyle(
                                                          10.0,
                                                      indexVal == index
                                                          ? CustomTheme.of(context)
                                                          .focusColor
                                                          : CustomTheme.of(context)
                                                          .canvasColor,
                                                          FontWeight.w400,
                                                          'FontRegular'),
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                indexVal = index;
                                              });
                                            },
                                          ),
                                          const SizedBox(
                                            width: 20.0,
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                              Container(
                                height: 35.0,
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 0.0, bottom: 0.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: CustomTheme.of(context).focusColor,
                                  border: Border.all(
                                    color: CustomTheme.of(context).canvasColor.withOpacity(0.5),
                                  )
                                ),
                                child: Center(
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      canvasColor: CustomTheme.of(context).focusColor,
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: options
                                            .map((value) => DropdownMenuItem(
                                          child: Text(
                                            value,
                                            style: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                10.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w500,
                                                'FontRegular'),
                                          ),
                                          value: value,
                                        ))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {

                                          });
                                        },
                                        isExpanded: false,
                                        value: selectedOption,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: CustomTheme.of(context).primaryColor,
                                          size: 15.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      
                      Image.asset('assets/icon/graph.png'),
                      const SizedBox(
                        height: 35.0,
                      ),

                      Row(
                        children: [
                          Flexible(child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color:   Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
                            child: Center(
                              child: Text(
                                "Sell",
                                style: CustomWidget(
                                    context: context)
                                    .CustomSizedTextStyle(
                                    14.0, CustomTheme.of(context)
                                        .focusColor
                                       ,
                                    FontWeight.w600,
                                    'FontRegular'),
                              ),
                            ),
                          )),
                          const SizedBox(width: 10.0,),
                          Flexible(child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color:   Theme.of(context).buttonColor,
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
                            child: Center(
                              child: Text(
                                "Buy",
                                style: CustomWidget(
                                    context: context)
                                    .CustomSizedTextStyle(
                                    14.0, CustomTheme.of(context)
                                    .primaryColor
                                    ,
                                    FontWeight.w600,
                                    'FontRegular'),
                              ),
                            ),
                          ))
                        ],
                      )



                    ],
                  ),
                )))
          ],
        ),
      ),
    );
  }
}
