
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/theme/custom_theme.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
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
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => Profile_Screen()));
                },
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Theme.of(context).bottomAppBarColor,
                  ),
                ))),

        title: Text(
          AppLocalizations.instance
              .text("loc_acc"),
          style: CustomWidget(context: context).CustomSizedTextStyle(
              18.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        ),

        actions: [
          Padding(
              padding: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 8.0, right: 20.0),
              child: InkWell(
                  onTap: () {

                    // Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10.0, 3.0, 10.0,3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).backgroundColor,
                        border: Border.all(width: 1.0,color: Theme.of(context).splashColor,)
                    ),
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
        color:  Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 20.0,right: 20.0, ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.only(top: 15.0,right: 15.0,left: 15.0,bottom: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Theme.of(context).primaryColor,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/profile/Icon.svg",
                      height: 50.0,
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      "Dan Tourlan",
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                          14.0,
                          Theme.of(context).focusColor,
                          FontWeight.w600,
                          'FontRegular'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0,),
              Container(
                padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,bottom: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(width: 1.0,color: Theme.of(context).splashColor,)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.0,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/profile/verification.svg",
                              height: 25.0,
                            ),
                            SizedBox(width: 10.0,),
                            Text(
                                AppLocalizations.instance
                                .text("loc_verification"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                          ],
                        )),
                        Flexible(child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.0,
                          color: Theme.of(context).splashColor,
                        ))
                      ],
                    ),
                    SizedBox(height: 10.0,),

                    Container(
                      height: 1.0,
                      color: Theme.of(context).splashColor,
                    ),
                    SizedBox(height: 15.0,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/profile/security.svg",
                              height: 25.0,
                            ),
                            SizedBox(width: 10.0,),
                            Text(
                              AppLocalizations.instance
                                  .text("loc_security"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                          ],
                        )),
                        Flexible(child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.0,
                          color: Theme.of(context).splashColor,
                        ))
                      ],
                    ),
                    SizedBox(height: 10.0,),

                    Container(
                      height: 1.0,
                      color: Theme.of(context).splashColor,
                    ),
                    SizedBox(height: 15.0,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/profile/icon_aml.svg",
                              height: 25.0,
                            ),
                            SizedBox(width: 10.0,),
                            Text(
                              AppLocalizations.instance
                                  .text("loc_aml"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  12.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                          ],
                        )),
                        Flexible(child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.0,
                          color: Theme.of(context).splashColor,
                        ))
                      ],
                    ),
                    SizedBox(height: 10.0,),


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
