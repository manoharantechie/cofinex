import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/textformfield_custom.dart';

class ChangePassword_Screen extends StatefulWidget {
  const ChangePassword_Screen({Key? key}) : super(key: key);

  @override
  State<ChangePassword_Screen> createState() => _ChangePassword_ScreenState();
}

class _ChangePassword_ScreenState extends State<ChangePassword_Screen> {
  FocusNode oldPassFocus = FocusNode();
  FocusNode newPassFocus = FocusNode();
  FocusNode confirmPassFocus = FocusNode();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
          child: Stack(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12.0, top: 15.0),
                          child: Text(
                            AppLocalizations.instance.text("loc_old_pass"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                    10.0,
                                    Theme.of(context).canvasColor,
                                    FontWeight.w500,
                                    'FontRegular'),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextFormFieldCustom(
                          onEditComplete: () {
                            oldPassFocus.unfocus();
                            FocusScope.of(context).requestFocus(newPassFocus);
                          },
                          radius: 10.0,
                          error: "Enter Old Password",
                          textColor: Theme.of(context).primaryColor,
                          borderColor:
                              Theme.of(context).accentColor.withOpacity(0.5),
                          fillColor: Theme.of(context).focusColor,
                          hintStyle: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).bottomAppBarColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                          textStyle: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                          textInputAction: TextInputAction.next,
                          focusNode: oldPassFocus,
                          maxlines: 1,
                          text: '',
                          hintText: "Old Password ",
                          obscureText: false,
                          textChanged: (value) {},
                          onChanged: () {},
                          suffix: Container(
                            width: 0.0,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter Old Password";
                            }

                            return null;
                          },
                          enabled: true,
                          textInputType: TextInputType.text,
                          controller: oldPassController,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Text(
                            AppLocalizations.instance.text("loc_new_pass"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                    10.0,
                                    Theme.of(context).canvasColor,
                                    FontWeight.w500,
                                    'FontRegular'),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextFormFieldCustom(
                          onEditComplete: () {
                            newPassFocus.unfocus();
                            FocusScope.of(context)
                                .requestFocus(confirmPassFocus);
                          },
                          radius: 10.0,
                          error: "Enter New Password ",
                          textColor: Theme.of(context).backgroundColor,
                          borderColor:
                              Theme.of(context).accentColor.withOpacity(0.5),
                          fillColor: Theme.of(context).focusColor,
                          hintStyle: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).bottomAppBarColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                          textStyle: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                          textInputAction: TextInputAction.next,
                          focusNode: newPassFocus,
                          maxlines: 1,
                          text: '',
                          hintText: "New Password",
                          obscureText: false,
                          textChanged: (value) {},
                          onChanged: () {},
                          suffix: Container(
                            width: 0.0,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter New Password";
                            }

                            return null;
                          },
                          enabled: true,
                          textInputType: TextInputType.text,
                          controller: newPassController,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Text(
                            AppLocalizations.instance.text("loc_confirm_pass"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                    10.0,
                                    Theme.of(context).canvasColor,
                                    FontWeight.w500,
                                    'FontRegular'),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextFormFieldCustom(
                          onEditComplete: () {
                            confirmPassFocus.unfocus();
                            // FocusScope.of(context).requestFocus(snameFocus);
                          },
                          radius: 10.0,
                          error: "Enter Confirm Password",
                          textColor: Theme.of(context).backgroundColor,
                          borderColor:
                              Theme.of(context).accentColor.withOpacity(0.5),
                          fillColor: Theme.of(context).focusColor,
                          hintStyle: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).bottomAppBarColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                          textStyle: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                          textInputAction: TextInputAction.next,
                          focusNode: confirmPassFocus,
                          maxlines: 1,
                          text: '',
                          hintText: "Confirm Password",
                          obscureText: false,
                          textChanged: (value) {},
                          onChanged: () {},
                          suffix: Container(
                            width: 0.0,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter Confirm Password";
                            }

                            return null;
                          },
                          enabled: true,
                          textInputType: TextInputType.text,
                          controller: confirmPassController,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 15.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Theme.of(context).buttonColor,
                              ),
                              padding:
                                  EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 10.0),
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Center(
                                child: Text(
                                  AppLocalizations.instance.text("loc_change"),
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
                  )),
              loading
                  ? CustomWidget(context: context).loadingIndicator(
                      CustomTheme.of(context).buttonColor,
                    )
                  : Container()
            ],
          )),
    );
  }
}
