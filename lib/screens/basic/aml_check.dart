import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/textformfield_custom.dart';

class Aml_Check_Screen extends StatefulWidget {
  const Aml_Check_Screen({Key? key}) : super(key: key);

  @override
  State<Aml_Check_Screen> createState() => _Aml_Check_ScreenState();
}

class _Aml_Check_ScreenState extends State<Aml_Check_Screen> {

  FocusNode addressFocus = FocusNode();
  TextEditingController addressController = TextEditingController();
  List<String> cardlist = [];
  bool loading = false;
  String selectedValue = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child){
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
                  ),)),

            title: Text(
              AppLocalizations.instance
                  .text("loc_aml"),
              style: CustomWidget(context: context).CustomSizedTextStyle(
                  18.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color:  Theme.of(context).backgroundColor,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0.0,20.0,0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            AppLocalizations.instance.text("loc_currency_check").toUpperCase(),
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
                                hint: Text(
                                  "USD",
                                  style: CustomWidget(context: context).CustomSizedTextStyle(
                                      14.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                ),
                                isExpanded: true,
                                value: selectedValue,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Theme.of(context).buttonColor,
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
                            AppLocalizations.instance.text("loc_ckeck"),
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
      },

    );
  }
}
