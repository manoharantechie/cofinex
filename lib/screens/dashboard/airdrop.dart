import 'package:cofinex/screens/dashboard/airdrop_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Airdrop_Screen extends StatefulWidget {
  const Airdrop_Screen({Key? key}) : super(key: key);

  @override
  State<Airdrop_Screen> createState() => _Airdrop_ScreenState();
}

class _Airdrop_ScreenState extends State<Airdrop_Screen> {
  ScrollController _scrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: Scaffold(
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
          AppLocalizations.instance.text("loc_air"),
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
        color:  Theme.of(context).backgroundColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0,20.0,0.0),
          child:  ListView.builder(
            physics: ScrollPhysics(),
            itemCount: 5,

            shrinkWrap: true,
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10.0,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AirdropDetails()));
                    },
                    child:  Container(
                      padding: EdgeInsets.only(
                          top: 10.0, right: 15.0, left: 15.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/back2.png"),
                          fit: BoxFit.cover,
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        children: [
                          Flexible(child:  Image.asset("assets/images/airdrop.png", ),flex: 1,),
                          Flexible(child: Container(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Embark on an adventure with Arbitrum and Cofinex Wallet",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).errorColor,
                                    FontWeight.w800,
                                    'FontRegular'),
                              ),
                              SizedBox(height: 3.0,),
                              Text(
                                "Arbitrum Airdrop Extravaganza Campaign",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    18.0,
                                    Theme.of(context).errorColor,
                                    FontWeight.w700,
                                    'FontRegular'),
                              ),
                              SizedBox(height: 3.0,),
                              Text(
                                "On Going",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    8.0,
                                    Theme.of(context).buttonColor,
                                    FontWeight.w800,
                                    'FontRegular'),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                "Prize #1: Exclusive",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).errorColor,
                                    FontWeight.w800,
                                    'FontRegular'),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Airdrop ',
                                  style: CustomWidget(context: context)
                                      .CustomSizedTextStyle(
                                      12.0,
                                      Theme.of(context).errorColor,
                                      FontWeight.w800,
                                      'FontRegular'),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '\$10000',
                                      style: CustomWidget(context: context)
                                          .CustomSizedTextStyle(
                                          12.0,
                                          Theme.of(context).buttonColor,
                                          FontWeight.w800,
                                          'FontRegular'),),
                                  ],
                                ),
                              ),


                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child:  Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment:MainAxisAlignment.end,
                                      children: [
                                        SvgPicture.asset("assets/icon/share.svg",),
                                        const SizedBox(width: 10.0,),
                                        SvgPicture.asset("assets/images/gift.svg"),
                                      ],
                                    )
                                ),
                              )




                            ],
                          ),),flex: 2,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                ],
              );
            },
          ),
        ),
      ),
    ));
  }
}
