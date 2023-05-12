import 'dart:convert';

import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/data_model/api_utils.dart';
import 'package:cofinex/screens/basic/home.dart';
import 'package:cofinex/screens/basic/login.dart';
import 'package:cofinex/screens/basic/register.dart';
import 'package:cofinex/screens/basic/verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/textformfield_custom.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool loading = false;
  bool passVisible = false;
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
  String isoCountryCode = "";
  final _formKey = GlobalKey<FormState>();
  APIUtils apiUtils = APIUtils();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isoCountryCode = systemLocales.first.countryCode.toString();
  }

  @override
  Widget build(BuildContext context) {
      return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .backgroundColor,
        elevation: 0.0,

        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Theme
              .of(context)
              .backgroundColor,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        leading: Padding(
            padding: EdgeInsets.only(left: 0.0, top: 5.0, bottom: 5.0),
            child: InkWell(
              onTap: () {
                // Navigator.push(context,MaterialPageRoute(builder:(context)=> Home_Screen()));
                Navigator.pop(context);
              },
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Theme
                      .of(context)
                      .bottomAppBarColor,
                ),
              ),
            )),
        actions: [
          Padding(padding: EdgeInsets.only(top: 15.0,bottom: 15.0),child: Container(
              margin: EdgeInsets.only(right: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Theme
                      .of(context)
                      .canvasColor.withOpacity(0.3)
              ),
              padding: EdgeInsets.only(right: 5.0,left: 10.0),
              child: Row(
                children: [
                  Row(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle,size: 5.0,color: Theme
                          .of(context)
                          .primaryColor,),
                      const SizedBox(width: 5.0,),
                      Icon(Icons.circle,size: 5.0,color: Theme
                          .of(context)
                          .primaryColor,),
                      const SizedBox(width: 5.0,),
                      Icon(Icons.circle,size: 5.0,color: Theme
                          .of(context)
                          .primaryColor,),

                    ],
                  ),
                  const SizedBox(width: 10.0,),
                  Container(width: 1.0,height: 15.0,color:  Theme
                      .of(context)
                      .primaryColor.withOpacity(0.5),),
                  const SizedBox(width: 10.0,),
                  Icon(Icons.close,size: 15.0,color: Theme
                      .of(context)
                      .primaryColor,),
                ],
              )
          ),)
        ],
        // title: Text(
        //   AppLocalizations.instance
        //       .text("loc_pooja_list"),
        //   style: CustomWidget(context: context).CustomSizedTextStyle(
        //       20.0, Theme.of(context).backgroundColor, FontWeight.w700, 'FontRegular'),
        // ),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: Theme
              .of(context)
              .backgroundColor,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0),
                decoration: BoxDecoration(
                    color:    Theme
                        .of(context)
                        .buttonColor
                        .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5.0)
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outlined,size: 20.0,color:    Theme
                        .of(context)
                        .buttonColor,),
                    const SizedBox(width: 5.0,),
                    Expanded(child: Text(
                      "In order to protect your account,withdrawals, P2P, selling, payments, service  and cofinex card applications will be disabled for 24 hours after you change password  ",
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          10.0,
                          Theme
                              .of(context)
                              .buttonColor,
                          FontWeight.w400,
                          'FontRegular'),softWrap: true,

                      textAlign: TextAlign.start,
                    ),)

                  ],
                ),
              ),
              Container(
                  child: Center(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0.0, 5.0, 15.0,
                                    5.0),
                                child: Text(
                                  "Reset Your   Password",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      27.0,
                                      Theme
                                          .of(context)
                                          .primaryColor,
                                      FontWeight.w700,
                                      'FontRegular'),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0,
                                    0.0),
                                child: Text(
                                  AppLocalizations.instance.text(
                                      "loc_email_phone"),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      12.0,
                                      Theme.of(context)
                                          .bottomAppBarColor,
                                      FontWeight.w500,
                                      'FontRegular'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              TextFormFieldCustom(
                                onEditComplete: () {
                                  emailFocus.unfocus();
                                  // FocusScope.of(context).requestFocus(snameFocus);
                                },
                                radius: 5.0,
                                error: "Enter Email or Phone Number",
                                textColor: Theme
                                    .of(context)
                                    .bottomAppBarColor,
                                borderColor:
                                Theme
                                    .of(context)
                                    .accentColor
                                    .withOpacity(0.5),
                                fillColor: Theme
                                    .of(context)
                                    .shadowColor,
                                hintStyle: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    12.0,
                                    Theme
                                        .of(context)
                                        .bottomAppBarColor
                                        .withOpacity(0.5),
                                    FontWeight.w600,
                                    'FontRegular'),
                                textStyle: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    16.0,
                                    Theme
                                        .of(context)
                                        .bottomAppBarColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                                textInputAction: TextInputAction.next,
                                focusNode: emailFocus,
                                maxlines: 1,
                                text: '',
                                hintText: "Email address",
                                obscureText: false,
                                textChanged: (value) {},
                                onChanged: () {},
                                suffix: Container(
                                  width: 0.0,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter Email";
                                  } else if (!RegExp(
                                      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                    return "Please enter valid Email";
                                  }

                                  return null;
                                },
                                enabled: true,
                                textInputType: TextInputType.name,
                                controller: emailController,
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    FocusScope.of(context).unfocus();

                                    if (_formKey.currentState!.validate()) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Login(
                                                    email: emailController.text
                                                        .toString(),)));
                                    }
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      0.0, 16.0, 0.0, 16.0),
                                  decoration: BoxDecoration(
                                    color: Theme
                                        .of(context)
                                        .buttonColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Theme
                                          .of(context)
                                          .backgroundColor,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Next",
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          14.0,
                                          Theme
                                              .of(context)
                                              .primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ))),

              loading
                  ? CustomWidget(context: context).loadingIndicator(
                CustomTheme
                    .of(context)
                    .buttonColor,
              )
                  : Container()
            ],
          )),
    ));
  }
}