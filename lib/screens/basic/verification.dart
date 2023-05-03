import 'package:cofinex/common/localization/localizations.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/data_model/api_utils.dart';
import 'package:cofinex/data_model/model/get_otp_model.dart';
import 'package:cofinex/screens/basic/home.dart';
import 'package:cofinex/screens/basic/login.dart';
import 'package:cofinex/screens/basic/login_first.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/custom_widget.dart';
import '../../common/textformfield_custom.dart';

class Verification_Screen extends StatefulWidget {
  final String user_id;

  const Verification_Screen({Key? key, required this.user_id})
      : super(key: key);

  @override
  State<Verification_Screen> createState() => _Verification_ScreenState();
}

class _Verification_ScreenState extends State<Verification_Screen> {
  FocusNode codeFocus = FocusNode();
  TextEditingController codeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  APIUtils apiUtils = APIUtils();

  String otp="";
  bool loading=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading=true;
    getOTP(widget.user_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Theme.of(context).backgroundColor,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        elevation: 0.0,
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
        // title: Text(
        //   AppLocalizations.instance
        //       .text("loc_pooja_list"),
        //   style: CustomWidget(context: context).CustomSizedTextStyle(
        //       20.0, Theme.of(context).backgroundColor, FontWeight.w700, 'FontRegular'),
        // ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child:Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.instance.text("loc_verify"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  27.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w700,
                                  'FontRegular'),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
                              child: Text(
                                AppLocalizations.instance.text("loc_verify_txt1"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(context).canvasColor,
                                    FontWeight.w500,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
                        child: Text(
                          AppLocalizations.instance.text("loc_verify_txt"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              10.0,
                              Theme.of(context).canvasColor,
                              FontWeight.w500,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Form(child:  TextFormFieldCustom(
                        onEditComplete: () {
                          codeFocus.unfocus();
                          // FocusScope.of(context).requestFocus(snameFocus);
                        },
                        radius: 10.0,
                        error: "Enter Code",
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
                        textStyle: CustomWidget(context: context).CustomTextStyle(
                            Theme.of(context).bottomAppBarColor,
                            FontWeight.w600,
                            'FontRegular'),
                        textInputAction: TextInputAction.next,
                        focusNode: codeFocus,
                        maxlines: 1,
                        text: '',
                        hintText: "Enter code",
                        obscureText: false,
                        textChanged: (value) {},
                        onChanged: () {},
                        suffix: Container(
                          width: 0.0,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter Code";
                          }
                        },
                        enabled: true,
                        textInputType: TextInputType.text,
                        controller: codeController,
                      ),key: _formKey,),
                      SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.instance.text("loc_dont_code"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  10.0,
                                  Theme.of(context).canvasColor,
                                  FontWeight.w500,
                                  'FontRegular'),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  loading=true;
                                  sentOTP(widget.user_id);
                                });
                              },
                              child:   Text(
                                AppLocalizations.instance.text("loc_resend"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    10.0,
                                    Theme.of(context).bottomAppBarColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if(_formKey.currentState!.validate())
                            {
                              if(codeController.text.toString()==otp){
                                loading=true;
                                activateEmail(widget.user_id);
                              }
                              else
                              {
                                CustomWidget(context: context)
                                    .showSnackBar(context, "Please Enter Valide Code..!", false);
                              }

                            }

                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15.0),
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
                              AppLocalizations.instance.text("loc_submit"),
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
                        height: 15.0,
                      )
                    ],
                  ),
                )
              ],
            ),
            loading
                ? CustomWidget(context: context).loadingIndicator(
              CustomTheme.of(context).buttonColor,
            )
                : Container()
          ],
        )
      ),
    );
  }

  sentOTP(String id) {
    apiUtils
        .generateOTP(id)
        .then((dynamic loginData) {

      setState(() {
        loading = false;
      });

      CustomWidget(context: context)
          .showSnackBar(context, "OTP send to your Email", false);


    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }
  getOTP(String id) {
    apiUtils
        .fetchOTP(id)
        .then((GetOtpModel loginData) {
      if (loginData.status!) {
        setState(() {
          loading = false;
          otp=loginData.data![0].otp.toString();
        });

      }
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }
  activateEmail(String id) {
    apiUtils
        .verifyEmail(id)
        .then((dynamic loginData) {

      if (loginData["status"]!) {
        CustomWidget(context: context)
            .showSnackBar(context, "User Registered Successfully..!", true);
        setState(() {
          loading = false;
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginFirst()));
        });

      }
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }
}
