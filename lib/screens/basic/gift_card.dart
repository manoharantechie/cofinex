import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/theme/custom_theme.dart';

class GiftCard_Details extends StatefulWidget {
  const GiftCard_Details({Key? key}) : super(key: key);

  @override
  State<GiftCard_Details> createState() => _GiftCard_DetailsState();
}

class _GiftCard_DetailsState extends State<GiftCard_Details> {

  ScrollController _scrollController = ScrollController();
  List<String> gift_img = [
    "assets/images/arrow.png", "assets/images/ajio.png", "assets/images/arrow.png", "assets/images/ajio.png", "assets/images/arrow.png", "assets/images/ajio.png",
  ];

  List<String> gift_text =[
    "Arrow", "AJIO E-Gift Card", "Arrow", "AJIO E-Gift Card", "Arrow", "AJIO E-Gift Card",
  ];
  String selectedValue = "";
  bool loading = false;
  List<String> cardlist = [];

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
          AppLocalizations.instance.text("loc_gift_card"),
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
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: InkWell(
                          onTap: () {

                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width ,
                            height: 45.0,
                            decoration: BoxDecoration(
                                color:
                                CustomTheme.of(context).focusColor,
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 8.0,
                                ),
                                SvgPicture.asset("assets/images/search.svg", height: 18.0,color: Theme.of(context).accentColor,),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "Search...",
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      13.0,
                                      Theme.of(context).accentColor,
                                      FontWeight.w300,
                                      'FontRegular'),
                                ),
                              ],
                            ),
                          )),flex: 1,),
                      SizedBox(width: 5.0,),
                     Flexible(child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Container(
                           width: MediaQuery.of(context).size.width *0.3,
                           height: 45.0,
                           padding: EdgeInsets.fromLTRB(10, 0.0, 10, 0.0),
                           decoration: BoxDecoration(
                             border: Border.all(
                                 color: Theme.of(context).splashColor,
                                 width: 1.0),
                             borderRadius: BorderRadius.circular(10.0),
                             color: Theme.of(context).focusColor,
                           ),
                           child: Theme(
                             data: Theme.of(context).copyWith(
                               canvasColor: Theme.of(context).backgroundColor,
                             ),
                             child: DropdownButtonHideUnderline(
                               child: DropdownButton(
                                 menuMaxHeight: MediaQuery.of(context).size.height * 0.7,
                                 items: cardlist
                                     .map((value) => DropdownMenuItem(
                                   child: Text(
                                     value.toString(),
                                     style: CustomWidget(context: context)
                                         .CustomSizedTextStyle(
                                         14.0,
                                         Theme.of(context).errorColor,
                                         FontWeight.w600,
                                         'FontRegular'),
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
                                 hint: Text(
                                   "Categories",
                                   style: CustomWidget(context: context).CustomSizedTextStyle(
                                       11.0,
                                       Theme.of(context).primaryColor,
                                       FontWeight.w400,
                                       'FontRegular'),
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
                         ),
                         SizedBox(width: 5.0,),
                         Container(
                           padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             border: Border.all(width: 1.0,color: Theme.of(context).accentColor.withOpacity(0.5),),
                             color: Theme.of(context).focusColor,
                           ),
                           child: SvgPicture.asset("assets/images/adjus.svg", height: 20.0, color: Theme.of(context).accentColor,),
                         )
                       ],
                     ),flex: 1,)

                    ],
                  ),
                ),
                SizedBox(height: 15.0,),
                Container(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    controller: _scrollController,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                        childAspectRatio: 0.72
                    ),
                    // physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: gift_img.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: (){

                        },
                        child: Container(
                            padding: EdgeInsets.only(
                                top: 5.0, bottom: 5.0, right: 12.0, left: 12.0),
                            decoration: BoxDecoration(
                              color:  Theme.of(context).focusColor,
                              border: Border.all(width: 1.0,color: Theme.of(context).splashColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(gift_img[index].toString(),),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  gift_text[index].toString(),
                                  style: CustomWidget(context: context).CustomSizedTextStyle(
                                      12.0,
                                      Theme.of(context).primaryColor,
                                      FontWeight.w400,
                                      'FontRegular'),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(height: 5.0,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Theme.of(context).accentColor.withOpacity(0.2), width: 1.0),
                                          borderRadius: BorderRadius.circular(5.0)
                                      ),
                                      child: Text(
                                        "INR 200",
                                        style: CustomWidget(context: context).CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),flex: 2,),
                                    SizedBox(width: 5.0,),
                                    Flexible(child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Theme.of(context).accentColor.withOpacity(0.2), width: 1.0),
                                          borderRadius: BorderRadius.circular(5.0)
                                      ),
                                      child: Text(
                                        "1",
                                        style: CustomWidget(context: context).CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),flex: 1,)
                                  ],
                                ),
                                SizedBox(height: 10.0,),
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(width: 1.0,color: Theme.of(context).buttonColor,),
                                      color: Theme.of(context).focusColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                          AppLocalizations.instance
                                              .text("loc_add_cart"),
                                        style: CustomWidget(context: context).CustomSizedTextStyle(
                                            12.0,
                                            Theme.of(context).buttonColor,
                                            FontWeight.w400,
                                            'FontRegular'),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
