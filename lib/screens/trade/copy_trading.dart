import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/data_model/api_utils.dart';
import 'package:cofinex/data_model/model/copy_trade_model.dart';
import 'package:cofinex/screens/trade/copy_trade_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CopyTrading extends StatefulWidget {
  const CopyTrading({Key? key}) : super(key: key);

  @override
  State<CopyTrading> createState() => _CopyTradingState();
}

class _CopyTradingState extends State<CopyTrading> {
  ScrollController _scrollController = ScrollController();
  ScrollController controller = ScrollController();
  TextEditingController amtController = TextEditingController();
  TextEditingController coinController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List<String> borrows = ["Default", "ROI", "Total PNL", "AUM"];

  List<CopyTrade> copyTradelist = [];
  List<CopyTrade> copyLoadTradelist = [];
  String selectedBorrow = "";
  String type = "composite";
  String page = "1";
  bool loadAllMore = false;

  bool collapse = false;
  APIUtils apiUtils = APIUtils();
  bool loading = false;
  bool botLoader = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedBorrow = borrows.first;
    loading = true;


    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadAllMore();
      }
    });
    getToken();
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
            color: CustomTheme.of(context).backgroundColor,
            child: loading
                ? CustomWidget(context: context).loadingIndicator(
                    CustomTheme.of(context).primaryColorLight,
                  )
                : tradeUI(),
          ),
        ));
  }

  Widget tradeUI() {
    return Container(
        color: CustomTheme.of(context).focusColor,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
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
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 45.0,
                        padding: EdgeInsets.fromLTRB(10, 0.0, 10, 0.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).splashColor,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Theme.of(context).focusColor,
                        ),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: Theme.of(context).backgroundColor,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              menuMaxHeight: MediaQuery.of(context).size.height * 0.7,
                              items: borrows
                                  .map((value) => DropdownMenuItem(
                                child: Text(
                                  value.toString(),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      14.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                ),
                                value: value,
                              ))
                                  .toList(),
                              onChanged: (value) async {
                                setState(() {
                                  selectedBorrow = value.toString();
                                  loading=true;
                                  ["Default", "ROI", "Total PNL", "AUM"];
                                  if(selectedBorrow=="Default")
                                    {
                                      type="composite";
                                    }
                                else  if(selectedBorrow=="ROI")
                                  {
                                    type="roi";
                                  }
                                  else  if(selectedBorrow=="Total PNL")
                                  {
                                    type="totalPL";
                                  }
                                  else  if(selectedBorrow=="AUM")
                                  {
                                    type="aum";
                                  }
                                  copyTradelist=[];
                                  copyLoadTradelist=[];
                                  page="1";
                                  getToken();

                                });
                              },

                              isExpanded: true,
                              value: selectedBorrow,
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15.0,
                                color: Theme.of(context).primaryColor,
                                // color: Them,
                                // color: AppColors.otherTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(
                        height: collapse ? 15.0 : 1.0,
                      ),
                      SingleChildScrollView(
                        child: ListView.builder(
                          itemCount: copyTradelist.length,
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
                                              CircleAvatar(
                                                maxRadius: 20.0,
                                                backgroundImage:NetworkImage(
                                                  copyTradelist[index].traderHeadPic.toString(),


                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15.0,
                                              ),
                                              Flexible(
                                                  child: Container(

                                                    child:  Text(
                                                      copyTradelist[index].traderNickName.toString(),
                                                      style: CustomWidget(
                                                          context: context)
                                                          .CustomSizedTextStyle(
                                                          14.0,
                                                          Theme.of(context)
                                                              .primaryColor,
                                                          FontWeight.w400,
                                                          'FontRegular'),
                                                      textAlign: TextAlign.start,

                                                    ),
                                                    width: MediaQuery.of(context).size.width,
                                                  ),flex: 2,),
                                              Flexible(child: Column(
                                                children: [
                                                  Text(
                                                    copyTradelist[index].columnList![0].value.toString()+"%",
                                                    style:
                                                    CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        14.0,

                                                        double.parse( copyTradelist[index].columnList![0].value.toString())>0?    Theme.of(context)
                                                            .primaryColorLight: Theme.of(context)
                                                            .scaffoldBackgroundColor,
                                                        FontWeight.w400,
                                                        'FontRegular'),
                                                  ),
                                                  Text(
                                                    copyTradelist[index].columnList![0].describe.toString(),
                                                    style:
                                                    CustomWidget(context: context)
                                                        .CustomSizedTextStyle(
                                                        14.0, Theme.of(context)
                                                        .canvasColor,
                                                        FontWeight.w400,
                                                        'FontRegular'),
                                                  ),
                                                ],
                                              ),flex: 1,)
                                            ],
                                          ),
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [

                                                        Row(
                                                          children: [
                                                            Text(
                                                              copyTradelist[index].columnList![1].describe.toString(),
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
                                                              "\$"+  copyTradelist[index].columnList![1].value.toString(),
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
                                                              copyTradelist[index].columnList![2].describe.toString(),
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
                                                              "\$"+  copyTradelist[index].columnList![2].value.toString(),
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
                                                              copyTradelist[index].averageWinRate.toString()+ "%",
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
                                                        copyTradelist[index].columnList![5].value.toString()+"%",
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
                                                        copyTradelist[index].totalFollowers.toString(),
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
                                                                CopyTradeDetails(copyTradelist: copyTradelist[index],)));

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
                      ),


                    ],
                  ),
                )),
            botLoader?  Container(
              height: MediaQuery.of(context).size.height*0.3,
              child: CustomWidget(context: context).loadingIndicator(
                CustomTheme.of(context).primaryColorLight,
              ),
            ):Container()
          ],
        ));
  }

  getToken() {
    print(type);
    apiUtils.getCopyTradeData(type, page).then((dynamic loginData) {
      setState(() {
        loading=false;
      });

      if (loginData["msg"].toString() == "success") {
        List<dynamic> listData = loginData["data"];

        setState(() {
          copyLoadTradelist=[];
          loading = false;
          botLoader = false;
          List<CopyTrade>       copyTradelistN =
              (listData).map((item) => CopyTrade.fromJson(item)).toList();
          copyTradelist.addAll(copyTradelistN);
          copyLoadTradelist.addAll(copyTradelistN);
        });
      }
      else
        {
          setState(() {
            loading=false;
            botLoader=false;
            copyTradelist=[];
          });
        }
    }).catchError((Object error) {
      setState(() {
        loading = false;
        botLoader = false;
      });
    });
  }
}
