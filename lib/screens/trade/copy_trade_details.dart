import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/data_model/model/copy_trade_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CopyTradeDetails extends StatefulWidget {
 final CopyTrade copyTradelist;
  const CopyTradeDetails({Key? key, required this.copyTradelist}) : super(key: key);

  @override
  State<CopyTradeDetails> createState() => _CopyTradeDetailsState();
}

class _CopyTradeDetailsState extends State<CopyTradeDetails> with TickerProviderStateMixin{

  ScrollController _scrollController = ScrollController();

  bool collapse = false;
  CopyTrade? copyTradelist;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    copyTradelist=widget.copyTradelist;


  }
  @override
  Widget build(BuildContext context) {
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        leading: Padding(
            padding: EdgeInsets.only(left: 12.0, top: 10.0, bottom: 10.0),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Theme.of(context).bottomAppBarColor,
                  ),
                ))),
        title: Text(
          "Copy Trading",
          style: CustomWidget(context: context).CustomSizedTextStyle(18.0,
              Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(
                  left: 0.0, top: 10.0, bottom: 8.0, right: 20.0),
              child: InkWell(
                  onTap: () {
                    // Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).backgroundColor,
                        border: Border.all(
                          width: 1.0,
                          color: Theme.of(context).splashColor,
                        )),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/images/mic.svg",
                        height: 20.0,
                        color: Theme.of(context).bottomAppBarColor,
                      ),
                    ),
                  ))),
        ],
      ),
      body:Container(
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
                      const SizedBox(height: 10.0,),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start ,
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
                                        right: 10.0,  bottom: 3.0),

                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          collapse ? "Current Price" : "Last Price",
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
                                          color: CustomTheme.of(context).hintColor,
                                          size: 15.0,
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(height: 8.0,),
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
                              const SizedBox(height:8.0,),
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
                              const SizedBox(height: 8.0,),
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
                            crossAxisAlignment: CrossAxisAlignment.end
                            ,
                            children: [

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                children: [

                                  Text(
                                    "24h high",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        10.0,
                                        Theme.of(context).scaffoldBackgroundColor,
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
                              const SizedBox(height: 5.0,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                children: [

                                  Text(
                                    "24h low",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        10.0,
                                        Theme.of(context).scaffoldBackgroundColor,
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
                              const SizedBox(height: 5.0,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                children: [

                                  Text(
                                    "24h vol(BTC)",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        10.0,
                                        Theme.of(context).scaffoldBackgroundColor,
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
                              const SizedBox(height: 5.0,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                children: [

                                  Text(
                                    "24h vol(USDT)",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        10.0,
                                        Theme.of(context).scaffoldBackgroundColor,
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

                  Image.asset(
                    'assets/icon/graph.png',
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height:  10.0,
                  ),



                  Container(
                    padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Theme.of(context)
                              .canvasColor
                              .withOpacity(0.5),
                        )),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0),child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              maxRadius: 30.0,
                              backgroundImage:NetworkImage(
                                copyTradelist!.traderHeadPic.toString(),


                              ),
                            ),

                            Column(
                              children: [
                                Text(
                                  copyTradelist!.traderNickName.toString(),
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
                                const SizedBox(height: 5.0,),
                                Text(
                                  copyTradelist!.columnList![0].value.toString()+"%",
                                  style:
                                  CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      14.0,

                                      double.parse( copyTradelist!.columnList![0].value.toString())>0?    Theme.of(context)
                                          .primaryColorLight: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      FontWeight.w400,
                                      'FontRegular'),
                                ),
                                Text(
                                  copyTradelist!.columnList![0].describe.toString(),
                                  style:
                                  CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      14.0, Theme.of(context)
                                      .canvasColor,
                                      FontWeight.w400,
                                      'FontRegular'),
                                ),
                              ],
                            )
                          ],
                        ),),

                        const SizedBox(height: 10.0,),
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [

                                    Row(
                                      children: [
                                        Text(
                                          copyTradelist!.columnList![1].describe.toString(),
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
                                          "\$"+  copyTradelist!.columnList![1].value.toString(),
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
                                          copyTradelist!.columnList![2].describe.toString(),
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
                                          "\$"+  copyTradelist!.columnList![2].value.toString(),
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
                                          copyTradelist!.averageWinRate.toString()+ "%",
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
                                SvgPicture.asset( 'assets/icon/graph_success.svg'
                                   ),
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
                                    copyTradelist!.columnList![5].value.toString()+"%",
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
                                    "Total Followers",
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
                                    copyTradelist!.totalFollowers.toString(),
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
                                  child: Text("Copy",
                                    style: CustomWidget(
                                        context: context)
                                        .CustomSizedTextStyle(
                                        18.0, Theme.of(
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
                                    color:  Theme.of(context)
                                        .errorColor),
                              ),
                              onTap: () {

                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),

                ],
              ),
            )));
  }

}
