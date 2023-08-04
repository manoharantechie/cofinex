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

class LoginFirst extends StatefulWidget {
  const LoginFirst({Key? key}) : super(key: key);

  @override
  State<LoginFirst> createState() => _LoginFirstState();
}

class _LoginFirstState extends State<LoginFirst> {
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

  bool first = false;
  bool second = false;
  bool third = false;
  bool fourth = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isoCountryCode = systemLocales.first.countryCode.toString();
    //emailController.text="santosh_padhi@yahoo.com";
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).backgroundColor,
              statusBarIconBrightness: Brightness.dark,
              // For Android (dark icons)
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
                      color: Theme.of(context).bottomAppBarColor,
                    ),
                  ),
                )),
          ),
          body: Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).backgroundColor,
              child: Stack(
                children: [
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
                            padding: EdgeInsets.fromLTRB(0.0, 5.0, 15.0, 5.0),
                            child: Text(
                              "Cofinex Login",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      27.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w700,
                                      'FontRegular'),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                            child: Text(
                              AppLocalizations.instance.text("loc_email_phone"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                      12.0,
                                      Theme.of(context).bottomAppBarColor,
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
                            textColor: Theme.of(context).bottomAppBarColor,
                            borderColor:
                                Theme.of(context).unselectedWidgetColor.withOpacity(0.5),
                            fillColor: Theme.of(context).shadowColor,
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
                                // } else if (!RegExp(
                                //         r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                //     .hasMatch(value)) {
                                //   return "Please enter valid Email";
                                // }
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
                                FocusManager.instance.primaryFocus?.unfocus();
                                //  FocusScope.of(context).requestFocus(FocusNode());

                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Login(
                                            email:
                                                emailController.text.toString(),
                                          )));
                                }
                              });
                            },
                            child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorLight,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Theme.of(context).backgroundColor,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Next",
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
                          Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 50.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 1.0,
                                    color: Theme.of(context).canvasColor,
                                  ),
                                  flex: 1,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "or",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).canvasColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Flexible(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 1.0,
                                    color: Theme.of(context).canvasColor,
                                  ),
                                  flex: 1,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            padding:
                                EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 1.0,
                                color: Theme.of(context).unselectedWidgetColor,
                              ),
                              color: Theme.of(context).focusColor,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/logo-google.svg',
                                  height: 20.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  AppLocalizations.instance
                                      .text("loc_google_txt"),
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                          14.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, bottom: 20.0),
                          child: Text(
                            "Create a Cofinex Account",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(context).canvasColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Register()));
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15.0),
                            padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Theme.of(context).backgroundColor,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                AppLocalizations.instance.text("loc_signup"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        14.0,
                                        Theme.of(context).backgroundColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        )
                      ],
                    ),
                  ),
                  loading
                      ? CustomWidget(context: context).loadingIndicator(
                          CustomTheme.of(context).primaryColorLight,
                        )
                      : Container()
                ],
              )),
        ));
  }
}
