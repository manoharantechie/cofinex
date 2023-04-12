import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/textformfield_custom.dart';

class Trade_Change_Screen extends StatefulWidget {
  const Trade_Change_Screen({Key? key}) : super(key: key);

  @override
  State<Trade_Change_Screen> createState() => _Trade_Change_ScreenState();
}

class _Trade_Change_ScreenState extends State<Trade_Change_Screen> {

  FocusNode verifyCodeFocus = FocusNode();
  TextEditingController verifyCodeController = TextEditingController();

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
                    Icons.arrow_back_ios_new_rounded,
                    color: Theme.of(context).bottomAppBarColor,
                  ),
                ))),
        title: Text(
          AppLocalizations.instance.text("loc_change_pass"),
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(left: 12.0,top: 15.0),child: Text(
                AppLocalizations.instance
                    .text("loc_verify_code"),
                style: CustomWidget(context: context)
                    .CustomSizedTextStyle(
                    10.0,
                    Theme.of(context).canvasColor,
                    FontWeight.w500,
                    'FontRegular'),
              ),),
              SizedBox(height: 5.0,),
              TextFormFieldCustom(
                onEditComplete: () {
                  verifyCodeFocus.unfocus();
                  // FocusScope.of(context).requestFocus(snameFocus);
                },
                radius: 10.0,
                error: "Enter verification code",
                textColor: Theme.of(context).backgroundColor,
                borderColor: Theme.of(context).accentColor.withOpacity(0.5),
                fillColor: Theme.of(context).focusColor,
                hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                    12.0, Theme.of(context).bottomAppBarColor, FontWeight.w600, 'FontRegular'),
                textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                    12.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
                textInputAction: TextInputAction.next,
                focusNode: verifyCodeFocus,
                maxlines: 1,
                text: '',
                hintText: "Enter verification code",
                obscureText: false,
                textChanged: (value) {},
                onChanged: () {},
                suffix: Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 5.0),
                    child: Text(
                      AppLocalizations.instance
                          .text("loc_send"),
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          12.0,
                          Theme.of(context).buttonColor,
                          FontWeight.w600,
                          'FontRegular'),
                    ),
                  )
                ),
                validator: (value) {

                },
                enabled: true,
                textInputType: TextInputType.number,
                controller: verifyCodeController,
              ),
              SizedBox(height: 20.0,),

              Center(
                child: InkWell(
                  onTap: (){
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => PersonalInformationScreen()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).buttonColor,
                    ),
                    padding: EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 10.0),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Center(
                      child: Text(
                        AppLocalizations.instance
                            .text("loc_confirm"),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            13.0,
                            Theme.of(context).focusColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 12.0),child: Text(
                AppLocalizations.instance
                    .text("loc_not_rcv_sms"),
                style: CustomWidget(context: context)
                    .CustomSizedTextStyle(
                    10.0,
                    Theme.of(context).canvasColor,
                    FontWeight.w500,
                    'FontRegular'),
              ),),
            ],

          ),
        ),
      ),
    );
  }
}
