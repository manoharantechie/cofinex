import 'package:cofinex/common/bottom_nav.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/screens/bottom/dashboard.dart';
import 'package:cofinex/screens/wallet/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  final PageStorageBucket bucket = PageStorageBucket();
  List<BottomNavItem>? _bottomItems;
  int currentIndex=0;
  int selectIndex=0;
  List<Widget>     bottomPage = [
    Dashboard(),
    Container(),
    Container(),
    Wallet_Screen(),
    Container(),
  ];

  List<String> titleText=["loc_side_home","loc_side_markets","loc_side_trade","loc_side_wallet","loc_side_nft"];

   Widget screen = Dashboard();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bottomItems = createBottomItems();
  }


  void onSelectItem(int index) async {
    setState(() {
      selectIndex=index;


        currentIndex = index;
        screen = bottomPage[index];

    });
  }
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

              },
                child: Container(
                  margin: EdgeInsets.only(left: 5.0),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).buttonColor,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/user.svg",
                      height: 20.0,
                    ),
                  ),
                ))),

        title: currentIndex==0? InkWell(
            onTap: () {

            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 35.0,
              decoration: BoxDecoration(
                  color:
                      CustomTheme.of(context).focusColor,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: CustomTheme.of(context)
                          .canvasColor
                          .withOpacity(0.4),
                      width: 1)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.search_rounded,
                    color: CustomTheme.of(context).canvasColor,
                    size: 18.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "ETH/USDT",
                    style: CustomWidget(context: context)
                        .CustomSizedTextStyle(
                            13.0,
                            Theme.of(context).accentColor,
                            FontWeight.w300,
                            'FontRegular'),
                  ),
                ],
              ),
            ))
            :Text(
          AppLocalizations.instance
              .text(titleText[currentIndex]),
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
                      currentIndex==0?  "assets/images/notification.svg":"assets/icon/search.svg",
                        height: 20.0,
                      ),
                    ),
                  ))),

        ],
      ),
      body:  PageStorage(child:  screen, bucket: bucket),
      bottomNavigationBar: BottomNav(
        index: currentIndex,
        selectedIndex: selectIndex,
        color: CustomTheme.of(context).primaryColor,
        iconStyle: IconStyle(
          color: CustomTheme.of(context).canvasColor,
          onSelectColor: CustomTheme.of(context).focusColor,
          size: 25.0,
        ),
        bgStyle: BgStyle(
          color: CustomTheme.of(context).primaryColor,
          onSelectColor: CustomTheme.of(context).primaryColor,
        ),
        labelStyle: LabelStyle(
          visible: true,
          textStyle: CustomWidget(context: context).CustomSizedTextStyle(
            12.0,
              Theme.of(context).canvasColor,
              FontWeight.normal,
              'FontRegular'),
          onSelectTextStyle: CustomWidget(context: context).CustomSizedTextStyle(
            12.0,
              Theme.of(context).focusColor,
              FontWeight.normal,
              'FontRegular'),
        ),
        onTap: (i) {
          setState(() {
            onSelectItem(i);
            currentIndex=i;

          });
        },
        items: _bottomItems,
      ),

    );
  }
  List<BottomNavItem> createBottomItems() {
    final bottomItems = [
      new BottomNavItem("assets/bottom/home.svg", label: "loc_side_home"),
      new BottomNavItem("assets/bottom/chart.svg", label: "loc_side_markets"),
      new BottomNavItem("assets/bottom/swap.svg", label: "loc_side_trade"),
      new BottomNavItem("assets/bottom/wallet.svg", label: "loc_side_wallet"),
      new BottomNavItem("assets/bottom/nft.svg", label: "loc_side_nft"),
    ];
    return bottomItems;
  }

}
