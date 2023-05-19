import 'package:cofinex/screens/bottom/personal_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Verification_Screen1 extends StatefulWidget {
  final String url;
  const Verification_Screen1({Key? key, required this.url}) : super(key: key);

  @override
  State<Verification_Screen1> createState() => _Verification_Screen1State();
}

class _Verification_Screen1State extends State<Verification_Screen1> {

  List<String> cardlist = [];
  bool loading = false;
  String selectedValue = "";
  bool id = false;
  bool pass = false;
  bool drive = false;


  late final WebViewController webcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    webcontroller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(widget.url)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }


  @override
  Widget build(BuildContext context) {
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        leading: Padding(
            padding: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 10.0),
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
          AppLocalizations.instance.text("loc_verify"),
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
      body: WebViewWidget(controller: webcontroller),
    ));
  }

  Widget ui(){
    return Container(
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
                  Text(
                    AppLocalizations.instance
                        .text("loc_let_start"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        18.0,
                        Theme.of(context).primaryColor,
                        FontWeight.w600,
                        'FontRegular'),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    "Lorem ipsum dolor sit amet consectetur. Vivamus pellentesque urna ut.",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        10.0,
                        Theme.of(context).canvasColor,
                        FontWeight.w500,
                        'FontRegular'),
                  ),
                  SizedBox(height: 20.0,),
                  Padding(padding: EdgeInsets.only(left: 12.0),child: Text(
                    AppLocalizations.instance
                        .text("loc_issue"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        10.0,
                        Theme.of(context).canvasColor,
                        FontWeight.w500,
                        'FontRegular'),
                  ),),
                  SizedBox(height: 5.0,),
                  Container(
                    width: MediaQuery.of(context).size.width,
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
                            "Select country/region",
                            style: CustomWidget(context: context).CustomSizedTextStyle(
                                12.0,
                                Theme.of(context).primaryColor,
                                FontWeight.w600,
                                'FontRegular'),
                          ),
                          isExpanded: true,
                          value: selectedValue,
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Theme.of(context).accentColor,
                            size: 15.0,
                            // color: Them,
                            // color: AppColors.otherTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    AppLocalizations.instance
                        .text("loc_verify_txt2"),
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        12.0,
                        Theme.of(context).primaryColor,
                        FontWeight.w600,
                        'FontRegular'),
                  ),
                  SizedBox(height: 15.0,),
                  Text(
                    "Lorem ipsum dolor sit amet consectetur. Maecenas consectetur nulla at habitasse. Integer accumsan nulla adipiscing diam ut pellentesque. Diam arcu ornare turpis non non porttitor a et. Curabitur pellentesque.",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                        10.0,
                        Theme.of(context).canvasColor,
                        FontWeight.w500,
                        'FontRegular'),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              id = true;
                              pass = false;
                              drive = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(width: 1.0, color: Theme.of(context).splashColor,),
                              color: Theme.of(context).focusColor,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(child: Row(
                                  children: [
                                    Flexible(child: SvgPicture.asset("assets/images/id_card.svg",height: 30.0,),),
                                    SizedBox(width: 10.0,),
                                    Flexible(child: Text(
                                      AppLocalizations.instance
                                          .text("loc_id"),
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          12.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                    ), )
                                  ],
                                ),flex: 1,),
                                Flexible(child: Container(
                                  height: 18.0,
                                  width: 18.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1.0, color: Theme.of(context).dividerColor,),
                                    color: id ? Theme.of(context).buttonColor : Theme.of(context).focusColor ,
                                  ),
                                ),flex: 1,)

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        InkWell(
                          onTap: (){
                            setState(() {
                              id = false;
                              pass = true;
                              drive = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(width: 1.0, color: Theme.of(context).splashColor,),
                              color: Theme.of(context).focusColor,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(child: Row(
                                  children: [
                                    Flexible(child: SvgPicture.asset("assets/images/passport.svg",height: 30.0,),flex: 1,),
                                    SizedBox(width: 10.0,),
                                    Flexible(child: Text(
                                      AppLocalizations.instance
                                          .text("loc_passport"),
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          12.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                    ),flex: 2, )
                                  ],
                                ),flex: 1,),
                                Flexible(child: Container(
                                  height: 18.0,
                                  width: 18.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1.0, color:  Theme.of(context).dividerColor),
                                    color: pass ? Theme.of(context).buttonColor : Theme.of(context).focusColor ,
                                  ),
                                ),flex: 1,)

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        InkWell(
                          onTap: (){
                            setState(() {
                              id = false;
                              pass = false;
                              drive = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(width: 1.0, color: Theme.of(context).splashColor,),
                              color: Theme.of(context).focusColor,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(child: Row(
                                  children: [
                                    Flexible(child: SvgPicture.asset("assets/images/driving.svg",height: 30.0,),flex: 1,),
                                    SizedBox(width: 10.0,),
                                    Flexible(child: Text(
                                      AppLocalizations.instance
                                          .text("loc_drive_lic"),
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          12.0,
                                          Theme.of(context).primaryColor,
                                          FontWeight.w600,
                                          'FontRegular'),
                                    ), flex: 2,)
                                  ],
                                ),flex: 1,),
                                Flexible(child: Container(
                                  height: 18.0,
                                  width: 18.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1.0, color: Theme.of(context).dividerColor,),
                                    color: drive ? Theme.of(context).buttonColor : Theme.of(context).focusColor ,
                                  ),
                                ),flex: 1,)

                              ],
                            ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => PersonalInformationScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Theme.of(context).buttonColor,
                        ),
                        padding: EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 10.0),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Center(
                          child: Text(
                            AppLocalizations.instance
                                .text("loc_nxt"),
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                13.0,
                                Theme.of(context).focusColor,
                                FontWeight.w600,
                                'FontRegular'),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
