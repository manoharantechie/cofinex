import 'package:cofinex/common/country.dart';
import 'package:cofinex/common/textformfield_error_custom.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/data_model/api_utils.dart';
import 'package:cofinex/screens/basic/home.dart';
import 'package:cofinex/screens/basic/login.dart';
import 'package:cofinex/screens/basic/login_first.dart';
import 'package:cofinex/screens/basic/verification.dart';
import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/textformfield_custom.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _Sign_Up_screenState();
}

class _Sign_Up_screenState extends State<Register> {
  bool loading = false;
  bool passVisible = false;
  FocusNode firstNFocus = FocusNode();
  FocusNode lasttNFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  FocusNode mobileFocus = FocusNode();
  FocusNode referralFocus = FocusNode();
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
  String isoCountryCode = "";
  APIUtils apiUtils = APIUtils();
  final _formKey = GlobalKey<FormState>();
  String errortext = "";
  bool errorCheck = false;
  Country? _selectedCountry;
  bool countryB = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isoCountryCode = systemLocales.first.countryCode.toString();initCountry();

  }

  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
      countryB = true;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).backgroundColor,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        leading: Padding(
            padding: EdgeInsets.only(left: 0.0, top: 5.0, bottom: 5.0),
            child: InkWell(
              onTap: () {
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
                  child: SingleChildScrollView(
                      child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 5.0),
                        child: Text(
                          AppLocalizations.instance.text("loc_sign_up"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                                  27.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w700,
                                  'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "First Name",
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
                        firstNFocus.unfocus();
                        FocusScope.of(context).requestFocus(lasttNFocus);
                      },
                      radius: 10.0,
                      error: "Enter FirstName",
                      textColor: Theme.of(context).bottomAppBarColor,
                      borderColor:
                          Theme.of(context).accentColor.withOpacity(0.5),
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
                      focusNode: firstNFocus,
                      maxlines: 1,
                      text: '',
                      hintText: "First Name",
                      obscureText: false,
                      textChanged: (value) {},
                      onChanged: () {},
                      suffix: Container(
                        width: 0.0,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter FirstName";
                        }
                      },
                      enabled: true,
                      textInputType: TextInputType.name,
                      controller: FirstNameController,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "Last Name",
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
                        lasttNFocus.unfocus();
                        FocusScope.of(context).requestFocus(emailFocus);
                      },
                      radius: 10.0,
                      error: "Enter LastName",
                      textColor: Theme.of(context).bottomAppBarColor,
                      borderColor:
                          Theme.of(context).accentColor.withOpacity(0.5),
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
                      focusNode: lasttNFocus,
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
                        if (value!.isEmpty) {
                          return "Please enter LastName";
                        }
                      },
                      enabled: true,
                      textInputType: TextInputType.name,
                      controller: LastNameController,
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
                         FocusScope.of(context).requestFocus(mobileFocus);
                      },
                      radius: 10.0,
                      error: "Enter Email address",
                      textColor: Theme.of(context).bottomAppBarColor,
                      borderColor:
                          Theme.of(context).accentColor.withOpacity(0.5),
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
                      height: 15.0,
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "Mobile number",
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

                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: CustomTheme.of(context)
                                      .accentColor
                                      .withOpacity(0.5),
                                  width: 1.0),
                              color: CustomTheme.of(context)
                                  .shadowColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: _onPressedShowBottomSheet,
                                  child: Row(
                                    children: [
                                      Text(
                                        countryB
                                            ? _selectedCountry!.callingCode.toString()
                                            : "+1",
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                          12.0,
                                            Theme.of(context).bottomAppBarColor,
                                            FontWeight.normal,
                                            'FontRegular'),
                                      ),
                                      const SizedBox(
                                        width: 3.0,
                                      ),
                                       Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: 15.0,
                                        color:  Theme.of(context).bottomAppBarColor,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                              ],
                            )),
                        Flexible(
                          child: TextFormField(
                            controller: mobileController,
                            focusNode: mobileFocus,
                            maxLines: 1,
                            enabled: true,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            ],
                            keyboardType: TextInputType.number,
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                16.0,
                                Theme.of(context).bottomAppBarColor,
                                FontWeight.w600,
                                'FontRegular'),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 12, right: 0, top: 2, bottom: 2),
                              hintText:"Mobile number",


                              hintStyle:  CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context)
                                      .bottomAppBarColor
                                      .withOpacity(0.5),
                                  FontWeight.w600,
                                  'FontRegular'),
                              filled: true,
                              fillColor: CustomTheme.of(context)
                                  .shadowColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: CustomTheme.of(context)
                                        .accentColor
                                        .withOpacity(0.5),
                                    width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: CustomTheme.of(context)
                                        .accentColor
                                        .withOpacity(0.5),
                                    width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: CustomTheme.of(context)
                                        .accentColor
                                        .withOpacity(0.5),
                                    width: 1.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                    color: CustomTheme.of(context)
                                        .accentColor
                                        .withOpacity(0.5),
                                    width: 1.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // TextFormFieldCustom(
                    //   onEditComplete: () {
                    //     mobileFocus.unfocus();
                    //      FocusScope.of(context).requestFocus(passFocus);
                    //   },
                    //   radius: 10.0,
                    //   error: "Enter Email address",
                    //   textColor: Theme.of(context).bottomAppBarColor,
                    //   borderColor:
                    //   Theme.of(context).accentColor.withOpacity(0.5),
                    //  fillColor: Theme.of(context).shadowColor,
                    //   hintStyle: CustomWidget(context: context)
                    //       .CustomSizedTextStyle(
                    //       12.0,
                    //       Theme.of(context)
                    //           .bottomAppBarColor
                    //           .withOpacity(0.5),
                    //       FontWeight.w600,
                    //       'FontRegular'),
                    //   textStyle: CustomWidget(context: context)
                    //       .CustomSizedTextStyle(
                    //       16.0,
                    //       Theme.of(context).bottomAppBarColor,
                    //       FontWeight.w600,
                    //       'FontRegular'),
                    //   textInputAction: TextInputAction.next,
                    //   focusNode: mobileFocus,
                    //   maxlines: 1,
                    //   text: '',
                    //   hintText: "Mobile number",
                    //   obscureText: false,
                    //   textChanged: (value) {},
                    //   onChanged: () {},
                    //   suffix: Container(
                    //     width: 0.0,
                    //   ),
                    //   validator: (value) {
                    //     int va=int.parse(value!.length.toString());
                    //     print(value.length);
                    //     if (value.isEmpty) {
                    //       return "Please enter Mobile number";
                    //     } else if (va <= 10) {
                    //       return "Please enter valid Mobile number";
                    //     }
                    //
                    //     return null;
                    //   },
                    //   enabled: true,
                    //   textInputType: TextInputType.name,
                    //   controller: mobileController,
                    // ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Text(
                        AppLocalizations.instance.text("loc_pass"),
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
                      obscureText: !passVisible,
                      textInputAction: TextInputAction.next,
                      textColor: Theme.of(context).bottomAppBarColor,
                      borderColor: Theme.of(context).accentColor.withOpacity(0.5),
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
                      radius: 10.0,
                      focusNode: passFocus,
                      suffix: IconButton(
                        icon: Icon(
                          passVisible ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.5),
                        ),
                        onPressed: () {
                          setState(() {
                            passVisible = !passVisible;
                          });
                        },
                      ),
                      controller: passwordController,
                      enabled: true,
                      onChanged: () {},
                      hintText: "************",
                      textChanged: (value) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Password";
                        }

                        return null;
                      },
                      maxlines: 1,
                      error: "Enter Valid Password",
                      text: "",
                      onEditComplete: () {
                        passFocus.unfocus();
                       FocusScope.of(context).requestFocus(referralFocus);
                      },
                      textInputType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "Referral ID",
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
                        referralFocus.unfocus();
                        // FocusScope.of(context).requestFocus(snameFocus);
                      },
                      radius: 10.0,
                      error: "Enter Email address",
                      textColor: Theme.of(context).bottomAppBarColor,
                      borderColor:
                      Theme.of(context).accentColor.withOpacity(0.5),
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
                      focusNode: referralFocus,
                      maxlines: 1,
                      text: '',
                      hintText: "Referral ID",
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
                      textInputType: TextInputType.name,
                      controller: referralController,
                    ),

                    SizedBox(
                      height: 25.0,
                    ),

                    InkWell(
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());

                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;

                              if (loading) {
                                doRegisterFunc();
                              }
                            });
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).buttonColor,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Theme.of(context).backgroundColor,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            AppLocalizations.instance.text("loc_crt_acc"),
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

                    SizedBox(
                      height: 35.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,

                      child: Text(
                        AppLocalizations.instance.text("loc_not_acc"),
                        textAlign: TextAlign.center,
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                            14.0,
                            Theme.of(context).canvasColor,
                            FontWeight.w600,
                            'FontRegular'),
                      ),
                    ),
                    const SizedBox(height: 10.0,),

                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LoginFirst()));
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
                            AppLocalizations.instance.text("loc_signin"),
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
                      height: 25.0,
                    ),
                  ],
                ),
              ))),

              loading
                  ? CustomWidget(context: context).loadingIndicator(
                      CustomTheme.of(context).buttonColor,
                    )
                  : Container()
            ],
          )),
    );
  }

  doRegisterFunc() {
    print("Manp");
    apiUtils
        .doRegisterEmail(
            FirstNameController.text.toString(),
            LastNameController.text.toString(),
            emailController.text.toString(),
            _selectedCountry!.countryCode.toString().toLowerCase(),
            passwordController.text.toString(),mobileController.text.toString(),referralController.text.toString())
        .then((dynamic loginData) {
      if (loginData.toString() == "false") {
        setState(() {
          loading = false;
          CustomWidget(context: context).showSnackBar(
              context, "User not registered ..Try again...!", false);
        });
      } else if (loginData["status"].toString() == "false") {
        setState(() {
          loading = false;
          CustomWidget(context: context)
              .showSnackBar(context, loginData["message"], false);
        });
      } else {
        setState(() {
          storeData(loginData["userId"].toString());
          sentOTP(loginData["userId"]);
        });
      }
    }).catchError((Object error) {
      print(error);
      setState(() {
        loading = false;
      });
    });
  }

  sentOTP(String id) {
    apiUtils.generateOTP(id).then((dynamic loginData) {
      setState(() {
        loading = false;
      });
      CustomWidget(context: context)
          .showSnackBar(context, "Code send to your Email", true);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Verification_Screen(
                user_id: id,
              )));
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }

  storeData(String userID) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("user_id", userID);
  }

  void _onPressedShowBottomSheet() async {
    final country = await showCountryPickerSheets(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
        print(_selectedCountry!.countryCode.toString().toLowerCase(),);
      });
    }
  }
}
