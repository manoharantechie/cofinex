import 'package:cofinex/screens/bottom/profile_verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/textformfield_custom.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {

  FocusNode nameFocus = FocusNode();
  TextEditingController nameController = TextEditingController();
  String selectedValue = "";
  bool loading = false;
  List<String> coinlist = [];

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
          AppLocalizations.instance.text("loc_profile"),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      padding: EdgeInsets.only(
                          top: 20.0, right: 15.0, left: 15.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(child: SvgPicture.asset(
                            "assets/profile/Icon.svg",
                          ),flex: 1,),
                          SizedBox(
                            width: 20.0,
                          ),
                          Flexible(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dan Tourlan",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    14.0,
                                    Theme.of(context).focusColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                              ),
                              SizedBox(height: 8.0,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.instance
                                        .text("loc_uid")+" :",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        10.0,
                                        Theme.of(context).dialogBackgroundColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),
                                  Text(
                                    "1773854678",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        10.0,
                                        Theme.of(context).dialogBackgroundColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                  ),
                                  SizedBox(width: 5.0,),
                                  Icon(Icons.copy_outlined, size: 12,color: Theme.of(context).dialogBackgroundColor,)

                                ],
                              ),
                              SizedBox(height: 8.0,),
                             InkWell(
                               onTap: (){
                                 Navigator.of(context)
                                     .push(MaterialPageRoute(builder: (context) => ProfileVerification_Screen()));
                               },
                               child:  Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5.0),
                                   color: Theme.of(context).toggleableActiveColor.withOpacity(0.2),
                                 ),
                                 padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                                 child: Text(
                                   AppLocalizations.instance
                                       .text("loc_unverified"),
                                   style: CustomWidget(context: context)
                                       .CustomSizedTextStyle(
                                       8.0,
                                       Theme.of(context).dialogBackgroundColor,
                                       FontWeight.w600,
                                       'FontRegular'),
                                 ),
                               ),
                             )
                            ],
                          ),flex: 1,)
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.instance
                                .text("loc_uname"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                10.0,
                                Theme.of(context).canvasColor,
                                FontWeight.w500,
                                'FontRegular'),
                          ),
                          SizedBox(height: 10.0,),
                          TextFormFieldCustom(
                            onEditComplete: () {
                              nameFocus.unfocus();
                              // FocusScope.of(context).requestFocus(snameFocus);
                            },
                            radius: 10.0,
                            error: "",
                            textColor: Theme.of(context).backgroundColor,
                            borderColor: Theme.of(context).accentColor.withOpacity(0.5),
                            fillColor: Theme.of(context).focusColor,
                            hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                12.0, Theme.of(context).bottomAppBarColor, FontWeight.w600, 'FontRegular'),
                            textStyle: CustomWidget(context: context).CustomTextStyle(
                                Theme.of(context).backgroundColor, FontWeight.w600, 'FontRegular'),
                            textInputAction: TextInputAction.next,
                            focusNode: nameFocus,
                            maxlines: 1,
                            text: '',
                            hintText: "Dan Tourlan",
                            obscureText: false,
                            textChanged: (value) {},
                            onChanged: () {},
                            suffix: Container(
                              width: 0.0,
                            ),
                            validator: (value) {

                            },
                            enabled: false,
                            textInputType: TextInputType.name,
                            controller: nameController,
                          ),
                          SizedBox(height: 20.0,),
                          Text(
                            AppLocalizations.instance
                                .text("loc_reffer_id"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                10.0,
                                Theme.of(context).canvasColor,
                                FontWeight.w500,
                                'FontRegular'),
                          ),
                          SizedBox(height: 10.0,),
                          TextFormFieldCustom(
                            onEditComplete: () {
                              nameFocus.unfocus();
                              // FocusScope.of(context).requestFocus(snameFocus);
                            },
                            radius: 10.0,
                            error: "",
                            textColor: Theme.of(context).backgroundColor,
                            borderColor: Theme.of(context).accentColor.withOpacity(0.5),
                            fillColor: Theme.of(context).focusColor,
                            hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                12.0, Theme.of(context).canvasColor, FontWeight.w500, 'FontRegular'),
                            textStyle: CustomWidget(context: context).CustomTextStyle(
                                Theme.of(context).backgroundColor, FontWeight.w600, 'FontRegular'),
                            textInputAction: TextInputAction.next,
                            focusNode: nameFocus,
                            maxlines: 1,
                            text: '',
                            hintText: "!268237#272895",
                            obscureText: false,
                            textChanged: (value) {},
                            onChanged: () {},
                            suffix: Container(
                              child: Icon(
                                Icons.qr_code_2_outlined, size: 25.0, color:  Theme.of(context).primaryColor,
                              ),
                            ),
                            validator: (value) {

                            },
                            enabled: false,
                            textInputType: TextInputType.name,
                            controller: nameController,
                          ),
                          SizedBox(height: 20.0,),
                          Text(
                            AppLocalizations.instance
                                .text("loc_language"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                10.0,
                                Theme.of(context).canvasColor,
                                FontWeight.w500,
                                'FontRegular'),
                          ),
                          SizedBox(height: 10.0,),
                          TextFormFieldCustom(
                            onEditComplete: () {
                              nameFocus.unfocus();
                              // FocusScope.of(context).requestFocus(snameFocus);
                            },
                            radius: 10.0,
                            error: "",
                            textColor: Theme.of(context).backgroundColor,
                            borderColor: Theme.of(context).accentColor.withOpacity(0.5),
                            fillColor: Theme.of(context).focusColor,
                            hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                12.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
                            textStyle: CustomWidget(context: context).CustomTextStyle(
                                Theme.of(context).backgroundColor, FontWeight.w600, 'FontRegular'),
                            textInputAction: TextInputAction.next,
                            focusNode: nameFocus,
                            maxlines: 1,
                            text: '',
                            hintText: "English",
                            obscureText: false,
                            textChanged: (value) {},
                            onChanged: () {},
                            suffix: Container(
                              width: 0.0,
                            ),
                            validator: (value) {

                            },
                            enabled: false,
                            textInputType: TextInputType.name,
                            controller: nameController,
                          ),
                          SizedBox(height: 20.0,),
                          Text(
                            AppLocalizations.instance
                                .text("loc_currency"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                10.0,
                                Theme.of(context).canvasColor,
                                FontWeight.w500,
                                'FontRegular'),
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 45.0,
                                padding: EdgeInsets.fromLTRB(8, 0.0, 5, 0.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context).splashColor,
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Theme.of(context).splashColor.withOpacity(0.5),
                                ),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    canvasColor: Theme.of(context).backgroundColor,
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      menuMaxHeight: MediaQuery.of(context).size.height * 0.7,
                                      items: coinlist
                                          .map((value) => DropdownMenuItem(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8.0),
                                                color: Theme.of(context).backgroundColor,
                                              ),
                                              child: SvgPicture.asset("assets/images/bit.svg", height: 20.0,),
                                            ),
                                            SizedBox(width: 8.0,),
                                            Text(
                                              value.toString(),
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  12.0,
                                                  Theme.of(context).errorColor,
                                                  FontWeight.w500,
                                                  'FontRegular'),
                                            ),
                                          ],
                                        ),
                                        value: value,
                                      ))
                                          .toList(),
                                      onChanged: (value) async {
                                        setState(() {
                                          selectedValue = value.toString();
                                          loading=true;

                                        });
                                      },
                                      hint: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                8.0, 5.0, 8.0, 5.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                              color:
                                              Theme.of(context).backgroundColor,
                                            ),
                                            child: SvgPicture.asset(
                                              "assets/images/bit.svg",
                                              height: 20.0,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          Text(
                                            "USD",
                                            style: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                12.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                          )
                                        ],
                                      ),
                                      isExpanded: true,
                                      value: selectedValue,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Theme.of(context).accentColor,
                                        // color: Them,
                                        // color: AppColors.otherTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),flex: 1,),
                              Flexible(child: Container(),flex: 2,)
                            ],
                          ),
                          SizedBox(height: 20.0,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).focusColor,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            width: 1.0,
                            color: Theme.of(context).splashColor,
                          )),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/profile/exit.svg",
                                  height: 18.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "Logout",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      12.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).focusColor,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            width: 1.0,
                            color: Theme.of(context).splashColor,
                          )),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/profile/delete.svg",
                                  height: 18.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "Delete Account",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      12.0,
                                      Theme.of(context).scaffoldBackgroundColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
