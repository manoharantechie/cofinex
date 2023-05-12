import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/textformfield_custom.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {

  FocusNode fnameFocus = FocusNode();
  TextEditingController fnameController = TextEditingController();
  FocusNode lnameFocus = FocusNode();
  TextEditingController lnameController = TextEditingController();
  FocusNode idnameFocus = FocusNode();
  TextEditingController idnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        leading: Padding(
            padding: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 10.0),
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
        // title: Text(
        //   AppLocalizations.instance.text("loc_verify"),
        //   style: CustomWidget(context: context).CustomSizedTextStyle(18.0,
        //       Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        // ),
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
                      ),
                    ),
                  ))),
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.instance
                          .text("loc_personal_info"),
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          18.0,
                          Theme.of(context).primaryColor,
                          FontWeight.w600,
                          'FontRegular'),
                    ),
                    SizedBox(height: 40.0,),
                    Padding(padding: EdgeInsets.only(left: 12.0),child: Text(
                      AppLocalizations.instance
                          .text("loc_first_name"),
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
                        fnameFocus.unfocus();
                        FocusScope.of(context).requestFocus(lnameFocus);
                      },
                      radius: 10.0,
                      error: "Enter First Name",
                      textColor: Theme.of(context).backgroundColor,
                      borderColor: Theme.of(context).accentColor.withOpacity(0.5),
                      fillColor: Theme.of(context).focusColor,
                      hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                          12.0, Theme.of(context).bottomAppBarColor, FontWeight.w600, 'FontRegular'),
                      textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                          12.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
                      textInputAction: TextInputAction.next,
                      focusNode: fnameFocus,
                      maxlines: 1,
                      text: '',
                      hintText: "First Name ",
                      obscureText: false,
                      textChanged: (value) {},
                      onChanged: () {},
                      suffix: Container(
                        width: 0.0,
                      ),
                      validator: (value) {

                      },
                      enabled: true,
                      textInputType: TextInputType.name,
                      controller: fnameController,
                    ),
                    SizedBox(height: 20.0,),
                    Padding(padding: EdgeInsets.only(left: 12.0),child: Text(
                      AppLocalizations.instance
                          .text("loc_last_name"),
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
                        lnameFocus.unfocus();
                        FocusScope.of(context).requestFocus(idnameFocus);
                      },
                      radius: 10.0,
                      error: "Enter Last Name",
                      textColor: Theme.of(context).backgroundColor,
                      borderColor: Theme.of(context).accentColor.withOpacity(0.5),
                      fillColor: Theme.of(context).focusColor,
                      hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                          12.0, Theme.of(context).bottomAppBarColor, FontWeight.w600, 'FontRegular'),
                      textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                          12.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
                      textInputAction: TextInputAction.next,
                      focusNode: lnameFocus,
                      maxlines: 1,
                      text: '',
                      hintText: "Last Name ",
                      obscureText: false,
                      textChanged: (value) {},
                      onChanged: () {},
                      suffix: Container(
                        width: 0.0,
                      ),
                      validator: (value) {

                      },
                      enabled: true,
                      textInputType: TextInputType.name,
                      controller: lnameController,
                    ),
                    SizedBox(height: 20.0,),
                    Padding(padding: EdgeInsets.only(left: 12.0),child: Text(
                      AppLocalizations.instance
                          .text("loc_id_num"),
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
                        idnameFocus.unfocus();
                        // FocusScope.of(context).requestFocus(snameFocus);
                      },
                      radius: 10.0,
                      error: "Enter ID Number",
                      textColor: Theme.of(context).backgroundColor,
                      borderColor: Theme.of(context).accentColor.withOpacity(0.5),
                      fillColor: Theme.of(context).focusColor,
                      hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                          12.0, Theme.of(context).bottomAppBarColor, FontWeight.w600, 'FontRegular'),
                      textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                          12.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
                      textInputAction: TextInputAction.next,
                      focusNode: idnameFocus,
                      maxlines: 1,
                      text: '',
                      hintText: "ID Number ",
                      obscureText: false,
                      textChanged: (value) {},
                      onChanged: () {},
                      suffix: Container(
                        width: 0.0,
                      ),
                      validator: (value) {

                      },
                      enabled: true,
                      textInputType: TextInputType.name,
                      controller: idnameController,
                    ),

                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Lorem ipsum Terms & Polices. Maecenas consectetur nulla at habitasse. Integer accumsan nulla adipiscing diam ut pellentesque. Diam arcu ornare turpis non non porttitor a et. Curabitur pellentesque.",
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          10.0,
                          Theme.of(context).canvasColor,
                          FontWeight.w500,
                          'FontRegular'),
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
                                  .text("loc_nxt"),
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
