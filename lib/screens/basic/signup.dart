import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/textformfield_custom.dart';

class Sign_Up_screen extends StatefulWidget {
  const Sign_Up_screen({Key? key}) : super(key: key);

  @override
  State<Sign_Up_screen> createState() => _Sign_Up_screenState();
}

class _Sign_Up_screenState extends State<Sign_Up_screen> {

  bool loading = false;
  bool passVisible = false;
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
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
        padding: EdgeInsets.fromLTRB(20.0, 0.0,20.0,0.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color:  Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            child: Text(
              AppLocalizations.instance.text("loc_sign_up"),
              style: CustomWidget(context: context)
                  .CustomSizedTextStyle(
                  26.0,
                  Theme.of(context).primaryColor,
                  FontWeight.w700,
                  'FontRegular'),
              textAlign: TextAlign.center,
            ),),
            SizedBox(height: 15.0,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                  child: Text(
                    AppLocalizations.instance.text("loc_email_phone"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        10.0,
                        Theme.of(context).accentColor,
                        FontWeight.w500,
                        'FontRegular'),
                    textAlign: TextAlign.center,
                  ),),
                  SizedBox(height: 5.0,),
                  TextFormFieldCustom(
                    onEditComplete: () {
                      emailFocus.unfocus();
                      // FocusScope.of(context).requestFocus(snameFocus);
                    },
                    radius: 10.0,
                    error: "Enter Pooja Name",
                    textColor: Theme.of(context).backgroundColor,
                    borderColor: Theme.of(context).accentColor.withOpacity(0.5),
                    fillColor: Theme.of(context).splashColor,
                    hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                        15.0, Theme.of(context).disabledColor, FontWeight.w500, 'FontRegular'),
                    textStyle: CustomWidget(context: context).CustomTextStyle(
                        Theme.of(context).backgroundColor, FontWeight.w500, 'FontRegular'),
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

                    },
                    enabled: true,
                    textInputType: TextInputType.name,
                    controller: emailController,
                  ),
                  SizedBox(height: 25.0,),
                  Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    child: Text(
                      AppLocalizations.instance.text("loc_pass"),
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          10.0,
                          Theme.of(context).accentColor,
                          FontWeight.w500,
                          'FontRegular'),
                      textAlign: TextAlign.center,
                    ),),
                  SizedBox(height: 5.0,),
                  TextFormFieldCustom(
                    obscureText: !passVisible,
                    textInputAction: TextInputAction.next,
                    textColor: Theme.of(context).backgroundColor,
                    borderColor: Theme.of(context).splashColor,
                    fillColor: Theme.of(context).splashColor,
                    hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                        15.0, Theme.of(context).disabledColor, FontWeight.w500, 'FontRegular'),
                    textStyle: CustomWidget(context: context).CustomTextStyle(
                        Theme.of(context).backgroundColor, FontWeight.w500, 'FontRegular'),
                    radius: 5.0,
                    focusNode: passFocus,
                    suffix: Container(
                      width: 0.0,
                    ),
                    controller: passwordController,
                    enabled: true,
                    onChanged: () {},
                    hintText: "******",
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
                  SizedBox(height: 15.0,),

                  SizedBox(height: 20.0,),
                  InkWell(
                    onTap: (){
                      setState(() {

                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Theme.of(context).backgroundColor, ),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.instance.text("loc_crt_acc"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              14.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w500,
                              'FontRegular'),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.3,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding:const EdgeInsets.only(left: 25.0, right: 25.0,bottom: 20.0),
                    child: Text(
                      AppLocalizations.instance.text("loc_all_account"),
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).accentColor,
                          FontWeight.w500,
                          'FontRegular'),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => Sign_Up_screen()));
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Theme.of(context).backgroundColor, ),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.instance.text("loc_signin"),
                          style: CustomWidget(context: context)
                              .CustomSizedTextStyle(
                              16.0,
                              Theme.of(context).backgroundColor,
                              FontWeight.w500,
                              'FontRegular'),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
