import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Leader_Board_Screen extends StatefulWidget {
  const Leader_Board_Screen({Key? key}) : super(key: key);

  @override
  State<Leader_Board_Screen> createState() => _Leader_Board_ScreenState();
}

class _Leader_Board_ScreenState extends State<Leader_Board_Screen> {

  ScrollController _scrollController = ScrollController();
  List list_name=[
    "Merkulove","CrTrader","Singh","Cryptodeter","Codecrypto","Bitcoinbutler","Coinunlike","Coinfizzle"
  ];

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
                  Icons.arrow_back_ios_new,
                  color: Theme.of(context).bottomAppBarColor,
                ),
              ),)),

        title: Text(
          AppLocalizations.instance
              .text("loc_leader"),
          style: CustomWidget(context: context).CustomSizedTextStyle(
              18.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            children: [
              ListView.builder(
                physics: ScrollPhysics(),
                itemCount: list_name.length,
                shrinkWrap: true,
                controller: _scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => Wallet_Address()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(width: 1.0,color: Theme.of(context).splashColor,)
                          ),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                          decoration: BoxDecoration(
                                            // border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
                                            // borderRadius: BorderRadius.circular(15.0),
                                            color: Theme.of(context).buttonColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Text(
                                            "1",
                                            style: CustomWidget(context: context)
                                                .CustomSizedTextStyle(
                                                10.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w700,
                                                'FontRegular'),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(width: 8.0,),
                                        Text(
                                          list_name[index].toString(),
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              14.0,
                                              Theme.of(context).primaryColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),

                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                      AppLocalizations.instance.text("loc_wallet_increase"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context).canvasColor,
                                            FontWeight.w500,
                                            'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(width: 5.0,),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            border: Border.all(width: 1.0,color: Theme.of(context).splashColor,),
                                            color: Theme.of(context).indicatorColor,
                                        ),
                                        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                                        child: Text(
                                          " 64.6%",
                                          style: CustomWidget(context: context)
                                              .CustomSizedTextStyle(
                                              12.0,
                                              Theme.of(context).splashColor,
                                              FontWeight.w600,
                                              'FontRegular'),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  )

                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,)
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
