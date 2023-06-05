import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/localization/localizations.dart';
import 'package:cofinex/common/textformfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Staking extends StatefulWidget {
  const Staking({Key? key}) : super(key: key);

  @override
  State<Staking> createState() => _StakingState();
}

class _StakingState extends State<Staking> {
  FocusNode totamountFocus = FocusNode();
  TextEditingController totamountController = TextEditingController();
  String selectedValue = "";
  bool loading = false;
  List<String> coinlist = [];
  List<String> cardlist = [];

  int selIndex=0;

  ScrollController _scrollController=ScrollController();
  List grid_name=[
    "10","20","30","90","180","360"
  ];

  List grid_rate=[
    "0.4","1","1.7","6","13","30"

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
                  Icons.arrow_back_ios_new,
                  color: Theme.of(context).bottomAppBarColor,
                ),
              ),
            )),
        title: Text(
          "Staking",
          style: CustomWidget(context: context).CustomSizedTextStyle(18.0,
              Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        AppLocalizations.instance.text("loc_amt").toUpperCase(),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            10.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w500,
                            'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextFormFieldCustom(
                            onEditComplete: () {
                              totamountFocus.unfocus();
                              // FocusScope.of(context).requestFocus(snameFocus);
                            },
                            radius: 10.0,
                            error: "Enter Amount",
                            textColor: Theme.of(context).bottomAppBarColor,
                            borderColor: Theme.of(context).splashColor,
                            fillColor: Theme.of(context).focusColor,
                            hintStyle: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                12.0,
                                Theme.of(context).canvasColor,
                                FontWeight.w500,
                                'FontRegular'),
                            textStyle: CustomWidget(context: context)
                                .CustomTextStyle(
                                Theme.of(context).bottomAppBarColor,
                                FontWeight.w500,
                                'FontRegular'),
                            textInputAction: TextInputAction.next,
                            focusNode: totamountFocus,
                            maxlines: 1,
                            text: '',
                            hintText: "0.00",
                            obscureText: false,
                            textChanged: (value) {},
                            onChanged: () {},
                            suffix: Container(
                              width: 0.0,
                            ),
                            validator: (value) {},
                            enabled: true,
                            textInputType: TextInputType.number,
                            controller: totamountController,
                          ),
                          flex: 2,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Flexible(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 45.0,
                            padding: EdgeInsets.fromLTRB(8, 0.0, 5, 0.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).splashColor,
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                              color: Theme.of(context)
                                  .splashColor
                                  .withOpacity(0.5),
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: Theme.of(context).backgroundColor,
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  menuMaxHeight:
                                  MediaQuery.of(context).size.height * 0.7,
                                  items: coinlist
                                      .map((value) => DropdownMenuItem(
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              8.0, 5.0, 8.0, 5.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                10.0),
                                            color: Theme.of(context)
                                                .backgroundColor,
                                          ),
                                          child: SvgPicture.asset(
                                            "assets/images/bit.svg",
                                            height: 20.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.0,
                                        ),
                                        Text(
                                          value.toString(),
                                          style: CustomWidget(
                                              context: context)
                                              .CustomSizedTextStyle(
                                              12.0,
                                              Theme.of(context)
                                                  .errorColor,
                                              FontWeight.w500,
                                              'FontRegular'),
                                        ),
                                      ],
                                    ),
                                    value: value,
                                  ))
                                      .toList(),
                                  onChanged: (value) async {
                                    setState(() {
                                      selectedValue = value.toString();
                                      loading = true;
                                    });
                                  },
                                  hint: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            8.0, 5.0, 8.0, 5.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          color: Theme.of(context).focusColor,
                                        ),
                                        child: SvgPicture.asset(
                                          "assets/images/bit.svg",
                                          height: 20.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        "USDT",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            12.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                      ),
                                    ],
                                  ),
                                  isExpanded: true,
                                  value: selectedValue,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Theme.of(context).unselectedWidgetColor,
                                    // color: Them,
                                    // color: AppColors.otherTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "Min. Ammount: 50 USDT",
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          10.0,
                          Theme.of(context).canvasColor,
                          FontWeight.w500,
                          'FontRegular'),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Max. Ammount: 600000 USDT",
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          10.0,
                          Theme.of(context).canvasColor,
                          FontWeight.w500,
                          'FontRegular'),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    choosePlan()
                  ],
                ),
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (context) => Verification_Screen()));
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.instance.text("loc_continue"),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget choosePlan(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.instance.text("loc_ch_plan"),
          style: CustomWidget(context: context)
              .CustomSizedTextStyle(
              14.0,
              Theme.of(context).primaryColor,
              FontWeight.w600,
              'FontRegular'),
        ),

        const SizedBox(height: 10.0,),
        Container(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            controller: _scrollController,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 1/0.3

            ),
            // physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: grid_name.length,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: (){
                 setState(() {
                   selIndex=index;
                 });

                },

                child: Container(
                    padding: EdgeInsets.only(
                        top: 5.0, bottom: 5.0, right: 12.0, left: 12.0),
                    decoration: BoxDecoration(
                      color: selIndex==index?Theme.of(context).primaryColor: Theme.of(context).focusColor,
                      border: Border.all(width: 1.0,color: Theme.of(context).splashColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: Alignment.center,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              // AppLocalizations.instance.text("loc_widthdraw"),
                              grid_name[index].toString(),
                              style: CustomWidget(context: context).CustomSizedTextStyle(
                                  18.0,
                                  selIndex==index?Theme.of(context).primaryColorLight: Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(width: 5.0,),
                            Text(
                              "days",
                              style: CustomWidget(context: context).CustomSizedTextStyle(
                                  10.0,
                                  Theme.of(context).canvasColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                              textAlign: TextAlign.center,
                            ),

                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              // AppLocalizations.instance.text("loc_widthdraw"),
                              grid_rate[index].toString()+"%",
                              style: CustomWidget(context: context).CustomSizedTextStyle(
                                  18.0,
                                  Theme.of(context).indicatorColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(width: 5.0,),
                            Text(
                              "Rate",
                              style: CustomWidget(context: context).CustomSizedTextStyle(
                                  10.0,
                                  Theme.of(context).canvasColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                              textAlign: TextAlign.center,
                            ),

                          ],
                        )
                      ],
                    )
                ),
              );
            },
          ),
        )
      ],


    );
  }
}
