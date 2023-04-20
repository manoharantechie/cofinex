import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/data_model/api_utils.dart';
import 'package:cofinex/screens/basic/home.dart';
import 'package:cofinex/screens/basic/login.dart';
import 'package:cofinex/screens/basic/verification.dart';
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
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
  String isoCountryCode = "";
  APIUtils apiUtils = APIUtils();


  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isoCountryCode = systemLocales.first.countryCode.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Theme.of(context).backgroundColor,
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
                                10.0,
                                Theme.of(context).accentColor,
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
                      fillColor: Theme.of(context).splashColor,
                      hintStyle: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                              12.0,
                              Theme.of(context)
                                  .bottomAppBarColor
                                  .withOpacity(0.5),
                              FontWeight.w600,
                              'FontRegular'),
                      textStyle: CustomWidget(context: context).CustomTextStyle(
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
                                10.0,
                                Theme.of(context).accentColor,
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
                      fillColor: Theme.of(context).splashColor,
                      hintStyle: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                              12.0,
                              Theme.of(context)
                                  .bottomAppBarColor
                                  .withOpacity(0.5),
                              FontWeight.w600,
                              'FontRegular'),
                      textStyle: CustomWidget(context: context).CustomTextStyle(
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
                                10.0,
                                Theme.of(context).accentColor,
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
                      radius: 10.0,
                      error: "Enter Email or Phone Number",
                      textColor: Theme.of(context).bottomAppBarColor,
                      borderColor:
                          Theme.of(context).accentColor.withOpacity(0.5),
                      fillColor: Theme.of(context).splashColor,
                      hintStyle: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                              12.0,
                              Theme.of(context)
                                  .bottomAppBarColor
                                  .withOpacity(0.5),
                              FontWeight.w600,
                              'FontRegular'),
                      textStyle: CustomWidget(context: context).CustomTextStyle(
                          Theme.of(context).bottomAppBarColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textInputAction: TextInputAction.next,
                      focusNode: emailFocus,
                      maxlines: 1,
                      text: '',
                      hintText: "incrypto-app@email.com",
                      obscureText: false,
                      textChanged: (value) {},
                      onChanged: () {},
                      suffix: Container(
                        width: 0.0,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Email";
                        } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
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
                        AppLocalizations.instance.text("loc_pass"),
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                                10.0,
                                Theme.of(context).accentColor,
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
                      borderColor: Theme.of(context).splashColor,
                      fillColor: Theme.of(context).splashColor,
                      hintStyle: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                              12.0,
                              Theme.of(context)
                                  .bottomAppBarColor
                                  .withOpacity(0.5),
                              FontWeight.w600,
                              'FontRegular'),
                      textStyle: CustomWidget(context: context).CustomTextStyle(
                          Theme.of(context).bottomAppBarColor,
                          FontWeight.w600,
                          'FontRegular'),
                      radius: 5.0,
                      focusNode: passFocus,
                      suffix: IconButton(
                        icon: Icon(
                          passVisible ? Icons.visibility : Icons.visibility_off,
                          color:  Theme.of(context)
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
                      },
                      textInputType: TextInputType.visiblePassword,
                    ),

                    SizedBox(
                      height: 25.0,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).unfocus();                          if (_formKey.currentState!.validate()) {

                            setState(() {
                              loading=true;
                              doRegisterFunc();
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
                  ],
                ),
              ))),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, bottom: 20.0),
                      child: Text(
                        AppLocalizations.instance.text("loc_not_acc"),
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
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()));

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
                  ],
                ),
              ),
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
    apiUtils
        .doRegisterEmail(
            FirstNameController.text.toString(),
            LastNameController.text.toString(),
            emailController.text.toString(),
            isoCountryCode.toLowerCase(),
            passwordController.text.toString())
        .then((dynamic loginData) {


      if (loginData.toString()=="false") {
        setState(() {
          loading = false;
          CustomWidget(context: context)
              .showSnackBar(context, "User not registered ..Try again...!", false);
        });



      } else {

        setState(() {
          storeData(loginData["userId"].toString());
          sentOTP(loginData["userId"]);

        });
      }
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }
  sentOTP(String id) {
    apiUtils
        .generateOTP(id)
        .then((dynamic loginData) {

        setState(() {
          loading = false;
        });

        print(loginData);
        CustomWidget(context: context)
            .showSnackBar(context, "Code send to your Email", true);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Verification_Screen(user_id: id,)));

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
}
