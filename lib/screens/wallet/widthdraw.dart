import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/textformfield_custom.dart';

class Widthdraw_Screen extends StatefulWidget {
  const Widthdraw_Screen({Key? key}) : super(key: key);

  @override
  State<Widthdraw_Screen> createState() => _Widthdraw_ScreenState();
}

class _Widthdraw_ScreenState extends State<Widthdraw_Screen> {

  FocusNode addressFocus = FocusNode();
  TextEditingController addressController = TextEditingController();
  FocusNode totamountFocus = FocusNode();
  TextEditingController totamountController = TextEditingController();
  String selectedValue = "";
  bool loading = false;
  List<String> coinlist = [];
  List<String> cardlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ),)),

        title: Text(
          AppLocalizations.instance
              .text("loc_widthdraw"),
          style: CustomWidget(context: context).CustomSizedTextStyle(
              18.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color:  Theme.of(context).focusColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0,20.0,0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        AppLocalizations.instance.text("loc_address").toUpperCase(),
                        style: CustomWidget(context: context).CustomSizedTextStyle(
                            10.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w500,
                            'FontRegular'),
                        textAlign: TextAlign.center,
                      ),),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldCustom(
                      onEditComplete: () {
                        addressFocus.unfocus();
                        // FocusScope.of(context).requestFocus(snameFocus);
                      },
                      radius: 10.0,
                      error: "Enter Amount",
                      textColor: Theme.of(context).bottomAppBarColor,
                      borderColor: Theme.of(context).splashColor,
                      fillColor: Theme.of(context).focusColor,
                      hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                          12.0, Theme.of(context).canvasColor, FontWeight.w500, 'FontRegular'),
                      textStyle: CustomWidget(context: context).CustomTextStyle(
                          Theme.of(context).bottomAppBarColor, FontWeight.w500, 'FontRegular'),
                      textInputAction: TextInputAction.next,
                      focusNode: addressFocus,
                      maxlines: 1,
                      text: '',
                      hintText: "Input or press and hold to paste the address",
                      obscureText: false,
                      textChanged: (value) {},
                      onChanged: () {},
                      suffix: Container(
                        child: Icon(
                          Icons.qr_code_2_outlined,
                          color: Theme.of(context).primaryColor,
                          size: 25.0,
                        ),
                      ),
                      validator: (value) {

                      },
                      enabled: true,
                      textInputType: TextInputType.text,
                      controller: addressController,
                    ),

                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        AppLocalizations.instance.text("loc_tot").toUpperCase(),
                        style: CustomWidget(context: context).CustomSizedTextStyle(
                            10.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w500,
                            'FontRegular'),
                        textAlign: TextAlign.center,
                      ),),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: TextFormFieldCustom(
                          onEditComplete: () {
                            totamountFocus.unfocus();
                            // FocusScope.of(context).requestFocus(snameFocus);
                          },
                          radius: 10.0,
                          error: "Enter Amount",
                          textColor: Theme.of(context).bottomAppBarColor,
                          borderColor: Theme.of(context).splashColor,
                          fillColor: Theme.of(context).focusColor,
                          hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                              12.0, Theme.of(context).canvasColor, FontWeight.w500, 'FontRegular'),
                          textStyle: CustomWidget(context: context).CustomTextStyle(
                              Theme.of(context).bottomAppBarColor, FontWeight.w500, 'FontRegular'),
                          textInputAction: TextInputAction.next,
                          focusNode: totamountFocus,
                          maxlines: 1,
                          text: '',
                          hintText: "Min. Ammount: 0.001",
                          obscureText: false,
                          textChanged: (value) {},
                          onChanged: () {},
                          suffix: Container(
                            width: 0.0,
                          ),
                          validator: (value) {

                          },
                          enabled: true,
                          textInputType: TextInputType.number,
                          controller: totamountController,
                        ),flex: 2,),
                        SizedBox(width: 15.0,),
                        Flexible(child:  Container(
                          width: MediaQuery.of(context).size.width,
                          height: 45.0,
                          padding: EdgeInsets.fromLTRB(8, 0.0, 5, 0.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).splashColor,
                                width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Theme.of(context).splashColor.withOpacity(0.5),
                          ),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: Theme.of(context).backgroundColor,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                menuMaxHeight: MediaQuery.of(context).size.height * 0.7,
                                items: coinlist
                                    .map((value) => DropdownMenuItem(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          color: Theme.of(context).backgroundColor,
                                        ),
                                        child: SvgPicture.asset("assets/images/bit.svg", height: 20.0,),
                                      ),
                                      SizedBox(width: 8.0,),
                                      Text(
                                        value.toString(),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            12.0,
                                            Theme.of(context).errorColor,
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
                                    loading=true;

                                  });
                                },
                                hint: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.0),
                                        color: Theme.of(context).focusColor,
                                      ),
                                      child: SvgPicture.asset("assets/images/bit.svg", height: 20.0,),
                                    ),
                                    SizedBox(width: 8.0,),
                                    Text(
                                      "BTC",
                                      style: CustomWidget(context: context).CustomSizedTextStyle(
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
                                  color: Theme.of(context).accentColor,
                                  // color: Them,
                                  // color: AppColors.otherTextColor,
                                ),
                              ),
                            ),
                          ),
                        ),flex: 1,)
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: Text(
                          AppLocalizations.instance.text("loc_fee")+" :",
                          style: CustomWidget(context: context).CustomSizedTextStyle(
                              12.0,
                              Theme.of(context).canvasColor,
                              FontWeight.w500,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),flex: 1,),
                        Flexible(child: Text(
                          "0.1%",
                          style: CustomWidget(context: context).CustomSizedTextStyle(
                              12.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),flex: 1,)
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      height: 1.0,
                      color: Theme.of(context).splashColor,
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: Text(
                          AppLocalizations.instance.text("loc_amt_receive"),
                          style: CustomWidget(context: context).CustomSizedTextStyle(
                              12.0,
                              Theme.of(context).canvasColor,
                              FontWeight.w500,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),flex: 1,),
                        Flexible(child: Text(
                          "0 USD",
                          style: CustomWidget(context: context).CustomSizedTextStyle(
                              12.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),flex: 1,)
                      ],
                    ),

                  ],
                ),
              ),
              Container(
                child: InkWell(
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
                        AppLocalizations.instance.text("loc_widthdraw"),
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
    );
  }
}