import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/textformfield_custom.dart';

class Future_Trade_Screen extends StatefulWidget {
  const Future_Trade_Screen({Key? key}) : super(key: key);

  @override
  State<Future_Trade_Screen> createState() => _Future_Trade_ScreenState();
}

class _Future_Trade_ScreenState extends State<Future_Trade_Screen> {

  List<String> cardlist = [];
  bool loading = false;
  String selectedValue = "";
  FocusNode valueFocus = FocusNode();
  bool selOption=true;
  TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 0.0,20.0,0.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color:  Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.0,),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      selOption=true;
                    });
                  },
                  child: Text(
                    AppLocalizations.instance.text("loc_buy"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        selOption?16.0:10.0,
                        Theme.of(context).primaryColor,
                        FontWeight.w600,
                        'FontRegular'),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 20.0,),

                InkWell(
                  onTap: (){
                    setState(() {
                      selOption=false;
                    });
                  },
                  child: Text(
                    AppLocalizations.instance.text("loc_sell"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        selOption?10.0: 16.0,
                        Theme.of(context).primaryColor,
                        FontWeight.w600,
                        'FontRegular'),
                    textAlign: TextAlign.center,
                  ),
                )

              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45.0,
                    padding: EdgeInsets.fromLTRB(10, 0.0, 10, 0.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).splashColor,
                          width: 1.0),
                      borderRadius: BorderRadius.circular(20.0),
                      color: Theme.of(context).focusColor,
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: Theme.of(context).backgroundColor,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          menuMaxHeight: MediaQuery.of(context).size.height * 0.7,
                          items: cardlist
                              .map((value) => DropdownMenuItem(
                            child: Text(
                              value.toString(),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).errorColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                            value: value,
                          ))
                              .toList(),
                          onChanged: (value) async {
                            setState(() {
                              selectedValue = value.toString();
                              loading=true;

                            });
                          },
                          hint: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                             Container(
                               padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Theme.of(context).accentColor.withOpacity(0.8),
                               ),
                               child:  SvgPicture.asset("assets/images/eth.svg", height: 15.0,),
                             ),
                              SizedBox(width: 10.0,),
                              Text(
                                "USD",
                                style: CustomWidget(context: context).CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                              )
                            ],
                          ),
                          isExpanded: true,
                          value: selectedValue,
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15.0,
                            // color: Theme.of(context).buttonColor,
                            // color: Them,
                            // color: AppColors.otherTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormFieldCustom(
                    onEditComplete: () {
                      valueFocus.unfocus();
                      // FocusScope.of(context).requestFocus(snameFocus);
                    },
                    radius: 10.0,
                    error: "Enter Code",
                    textColor: Theme.of(context).backgroundColor,
                    borderColor: Theme.of(context).backgroundColor,
                    fillColor: Theme.of(context).backgroundColor,
                    hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                        18.0, Theme.of(context).accentColor.withOpacity(0.8), FontWeight.w600, 'FontRegular'),
                    textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                        18.0,
                        Theme.of(context).backgroundColor, FontWeight.w600, 'FontRegular'),
                    textInputAction: TextInputAction.next,
                    focusNode: valueFocus,
                    maxlines: 1,
                    text: '',
                    hintText: "0 USD",
                    obscureText: false,
                    textChanged: (value) {},
                    onChanged: () {},
                    suffix: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/refresher.svg",
                            height: 20.0,
                          ),
                          Text(
                            "USDT",
                            style: CustomWidget(context: context).CustomSizedTextStyle(
                                10.0,
                                Theme.of(context).accentColor,
                                FontWeight.w500,
                                'FontRegular'),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    validator: (value) {

                    },
                    enabled: true,
                    textInputType: TextInputType.number,
                    controller: valueController,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 1.0,
                    color: Theme.of(context).buttonColor,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You are buying =",
                        style: CustomWidget(context: context).CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).accentColor,
                            FontWeight.w500,
                            'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "0 USD",
                        style: CustomWidget(context: context).CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).accentColor,
                            FontWeight.w500,
                            'FontRegular'),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pay with",
                        style: CustomWidget(context: context).CustomSizedTextStyle(
                            12.0,
                            Theme.of(context).accentColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/visa_1.png", height: 15.0,),
                          const SizedBox(width: 5.0,),
                          Image.asset("assets/images/master.png", height: 13.0,)
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) => Verification_Screen()));
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15.0),
                      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Theme.of(context).backgroundColor, ),
                      ),
                      child: Center(
                        child: Text(
                         selOption?"Buy USDT":"Sell USDT",
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
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
