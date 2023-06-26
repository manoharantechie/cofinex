import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/custom_widget.dart';
import '../../common/textformfield_custom.dart';

class AddCardDetails extends StatefulWidget {
  const AddCardDetails({Key? key}) : super(key: key);

  @override
  State<AddCardDetails> createState() => _AddCardDetailsState();
}

class _AddCardDetailsState extends State<AddCardDetails> {

  FocusNode cardNumFocus = FocusNode();
  FocusNode expDateFocus = FocusNode();
  FocusNode cvvFocus = FocusNode();
  FocusNode FnameFocus = FocusNode();
  FocusNode LnameFocus = FocusNode();
  TextEditingController cardNumController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController FnameController = TextEditingController();
  TextEditingController LnameController = TextEditingController();
  TextEditingController expDateController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25.0,),
              Container(
                color: Theme.of(context).accentColor.withOpacity(0.2),
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30.0,),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColorLight.withOpacity(0.2),
                      ),
                      child: Icon(
                        Icons.credit_card_rounded, size: 50.0, color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    const SizedBox(height: 15.0,),
                    Text(
                      "Add Credit or Debit Card",
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          20.0,
                          Theme.of(context).primaryColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25.0,),

                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).accentColor.withOpacity(0.2),
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Card Details".toUpperCase(),
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).accentColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10.0,),

                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1.0,
                color: Theme.of(context).accentColor.withOpacity(0.4),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Card No :",
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).primaryColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10.0,),
                    TextFormFieldCustom(
                      onEditComplete: () {
                        cardNumFocus.unfocus();
                        // FocusScope.of(context).requestFocus(snameFocus);
                      },
                      radius: 5.0,
                      error: "Enter Card Number",
                      textColor: Theme.of(context).bottomAppBarColor,
                      borderColor:
                      Theme.of(context).accentColor.withOpacity(0.5),
                      fillColor: Theme.of(context).focusColor,
                      hintStyle: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          12.0,
                          Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.5),
                          FontWeight.w600,
                          'FontRegular'),
                      textStyle: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          16.0,
                          Theme.of(context).bottomAppBarColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textInputAction: TextInputAction.next,
                      focusNode: cardNumFocus,
                      maxlines: 1,
                      text: '',
                      hintText: "Card Number",
                      obscureText: false,
                      textChanged: (value) {},
                      onChanged: () {},
                      suffix: Container(
                        width: 0.0,
                      ),
                      validator: (value) {

                        return null;
                      },
                      enabled: true,
                      textInputType: TextInputType.number,
                      controller: cardNumController,
                    ),
                    const SizedBox(height: 10.0,),
                    Text(
                      "Exp. Date :",
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).primaryColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10.0,),
                    TextFormFieldCustom(
                      onEditComplete: () {
                        expDateFocus.unfocus();
                        // FocusScope.of(context).requestFocus(snameFocus);
                      },
                      radius: 5.0,
                      error: "Enter Exp Date",
                      textColor: Theme.of(context).bottomAppBarColor,
                      borderColor:
                      Theme.of(context).accentColor.withOpacity(0.5),
                      fillColor: Theme.of(context).focusColor,
                      hintStyle: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          12.0,
                          Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.5),
                          FontWeight.w600,
                          'FontRegular'),
                      textStyle: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          16.0,
                          Theme.of(context).bottomAppBarColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textInputAction: TextInputAction.next,
                      focusNode: cardNumFocus,
                      maxlines: 1,
                      text: '',
                      hintText: "Exp Date",
                      obscureText: false,
                      textChanged: (value) {},
                      onChanged: () {},
                      suffix: Container(
                        width: 0.0,
                      ),
                      validator: (value) {

                        return null;
                      },
                      enabled: true,
                      textInputType: TextInputType.datetime,
                      controller: expDateController,
                    ),
                    const SizedBox(height: 10.0,),
                    Text(
                      "CVV :",
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).primaryColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10.0,),
                    TextFormFieldCustom(
                      onEditComplete: () {
                        cvvFocus.unfocus();
                        // FocusScope.of(context).requestFocus(snameFocus);
                      },
                      radius: 5.0,
                      error: "Enter CVV",
                      textColor: Theme.of(context).bottomAppBarColor,
                      borderColor:
                      Theme.of(context).accentColor.withOpacity(0.5),
                      fillColor: Theme.of(context).focusColor,
                      hintStyle: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          12.0,
                          Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.5),
                          FontWeight.w600,
                          'FontRegular'),
                      textStyle: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          16.0,
                          Theme.of(context).bottomAppBarColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textInputAction: TextInputAction.next,
                      focusNode: cvvFocus,
                      maxlines: 1,
                      text: '',
                      hintText: "CVV",
                      obscureText: false,
                      textChanged: (value) {},
                      onChanged: () {},
                      suffix: Container(
                        width: 0.0,
                      ),
                      validator: (value) {

                        return null;
                      },
                      enabled: true,
                      textInputType: TextInputType.datetime,
                      controller: cvvController,
                    ),
                    const SizedBox(height: 10.0,),
                    Text(
                      "First Name :",
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).primaryColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10.0,),
                    TextFormFieldCustom(
                      onEditComplete: () {
                        FnameFocus.unfocus();
                        // FocusScope.of(context).requestFocus(snameFocus);
                      },
                      radius: 5.0,
                      error: "Enter Exp Date",
                      textColor: Theme.of(context).bottomAppBarColor,
                      borderColor:
                      Theme.of(context).accentColor.withOpacity(0.5),
                      fillColor: Theme.of(context).focusColor,
                      hintStyle: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          12.0,
                          Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.5),
                          FontWeight.w600,
                          'FontRegular'),
                      textStyle: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          16.0,
                          Theme.of(context).bottomAppBarColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textInputAction: TextInputAction.next,
                      focusNode: FnameFocus,
                      maxlines: 1,
                      text: '',
                      hintText: "Exp Date",
                      obscureText: false,
                      textChanged: (value) {},
                      onChanged: () {},
                      suffix: Container(
                        width: 0.0,
                      ),
                      validator: (value) {

                        return null;
                      },
                      enabled: true,
                      textInputType: TextInputType.datetime,
                      controller: FnameController,
                    ),
                    const SizedBox(height: 10.0,),
                    Text(
                      "Last Name :",
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).primaryColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10.0,),
                    TextFormFieldCustom(
                      onEditComplete: () {
                        LnameFocus.unfocus();
                        // FocusScope.of(context).requestFocus(snameFocus);
                      },
                      radius: 5.0,
                      error: "Enter Last Name",
                      textColor: Theme.of(context).bottomAppBarColor,
                      borderColor:
                      Theme.of(context).accentColor.withOpacity(0.5),
                      fillColor: Theme.of(context).focusColor,
                      hintStyle: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          12.0,
                          Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.5),
                          FontWeight.w600,
                          'FontRegular'),
                      textStyle: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          16.0,
                          Theme.of(context).bottomAppBarColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textInputAction: TextInputAction.next,
                      focusNode: LnameFocus,
                      maxlines: 1,
                      text: '',
                      hintText: "Last Name",
                      obscureText: false,
                      textChanged: (value) {},
                      onChanged: () {},
                      suffix: Container(
                        width: 0.0,
                      ),
                      validator: (value) {

                        return null;
                      },
                      enabled: true,
                      textInputType: TextInputType.datetime,
                      controller: LnameController,
                    ),
                    const SizedBox(height: 10.0,),
                  ],
                ),
              ),


            ],
          ),
        ),

      ),
    );
  }
}
