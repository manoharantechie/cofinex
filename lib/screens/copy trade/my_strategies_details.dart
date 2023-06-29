import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/custom_widget.dart';
import '../../common/theme/custom_theme.dart';

class My_Strategies_Details extends StatefulWidget {
  const My_Strategies_Details({Key? key}) : super(key: key);

  @override
  State<My_Strategies_Details> createState() => _My_Strategies_DetailsState();
}

class _My_Strategies_DetailsState extends State<My_Strategies_Details> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.of(context).focusColor,
        elevation: 0.0,
        leading: Container(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 22.0,
                color: CustomTheme.of(context).primaryColor,
              ),
            )
        ),

        centerTitle: true,
        title: Text(
          "My strategies",
          style: CustomWidget(context: context)
              .CustomSizedTextStyle(
              18.0,
              Theme.of(context).primaryColor,
              FontWeight.w600,
              'FontRegular'),
        ),
        actions: [
          Ink(
            child: Container(
              padding: EdgeInsets.only(right: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.add_box_outlined, size: 15.0, color: Theme.of(context).primaryColor,),
                  const SizedBox(width: 10.0,),
                  Icon(Icons.question_mark_outlined, size: 15.0, color: Theme.of(context).primaryColor,),
                ],
              ),
            ),
          )
        ],

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: CustomTheme.of(context).focusColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Grid",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        18.0,
                        Theme.of(context).primaryColor,
                        FontWeight.w600,
                        'FontRegular'),
                  ),
                  const SizedBox(height: 10.0,),

                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).focusColor,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 2.0, //extend the shadow
                              offset: Offset(
                                7.0, // Move to right 7.0 horizontally
                                8.0, // Move to bottom 8.0 Vertically
                              )
                          ),
                        ]
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Spot grid",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                            const SizedBox(height: 10.0,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Automate a sell-high, ",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      8.0,
                                      Theme.of(context).unselectedWidgetColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                ),
                                Text(
                                  "buy-low spot strategy",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      8.0,
                                      Theme.of(context).unselectedWidgetColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                ),
                              ],
                            )

                          ],
                        ),
                        SvgPicture.asset("assets/images/block_1.svg", color: Theme.of(context).primaryColor,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).focusColor,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 2.0, //extend the shadow
                              offset: Offset(
                                7.0, // Move to right 7.0 horizontally
                                8.0, // Move to bottom 8.0 Vertically
                              )
                          ),
                        ]
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Future grid",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                            const SizedBox(height: 10.0,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Automate a sell-high, ",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      8.0,
                                      Theme.of(context).unselectedWidgetColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                ),
                                Text(
                                  "buy-low spot strategy",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      8.0,
                                      Theme.of(context).unselectedWidgetColor,
                                      FontWeight.w600,
                                      'FontRegular'),
                                ),
                              ],
                            )

                          ],
                        ),
                        SvgPicture.asset("assets/images/block_2.svg", color: Theme.of(context).primaryColor,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15.0,),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Martingale",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        18.0,
                        Theme.of(context).primaryColor,
                        FontWeight.w600,
                        'FontRegular'),
                  ),
                  const SizedBox(height: 10.0,),

                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).focusColor,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 2.0, //extend the shadow
                              offset: Offset(
                                7.0, // Move to right 7.0 horizontally
                                8.0, // Move to bottom 8.0 Vertically
                              )
                          ),
                        ]
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Spot Martingale",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                            const SizedBox(height: 10.0,),
                            Text(
                              "Automate spot orders at your specified price ",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  8.0,
                                  Theme.of(context).unselectedWidgetColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),

                          ],
                        ),
                        SvgPicture.asset("assets/images/block_3.svg", color: Theme.of(context).primaryColor,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).focusColor,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 2.0, //extend the shadow
                              offset: Offset(
                                7.0, // Move to right 7.0 horizontally
                                8.0, // Move to bottom 8.0 Vertically
                              )
                          ),
                        ]
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Spot Martingale",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                            const SizedBox(height: 10.0,),
                            Text(
                              "Automate spot orders at your specified price ",
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  8.0,
                                  Theme.of(context).unselectedWidgetColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),

                          ],
                        ),
                        SvgPicture.asset("assets/images/block_4.svg", color: Theme.of(context).primaryColor,)
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    ));
  }
}
