import 'dart:io';

import 'package:cofinex/common/bottom_nav.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/common/theme/themes.dart';
import 'package:cofinex/common/web_loader.dart';
import 'package:cofinex/data_model/api_utils.dart';
import 'package:cofinex/data_model/graph_ql_utils.dart';
import 'package:cofinex/data_model/model/ticker_data_model.dart';
import 'package:cofinex/data_model/model/user_details_model.dart';
import 'package:cofinex/data_model/query_utils.dart';
import 'package:cofinex/screens/basic/invite.dart';
import 'package:cofinex/screens/basic/register.dart';
import 'package:cofinex/screens/bottom/assets.dart';
import 'package:cofinex/screens/basic/notification.dart';
import 'package:cofinex/screens/bottom/profile.dart';

import 'package:cofinex/screens/bottom/market.dart';
import 'package:cofinex/screens/bottom/trade.dart';
import 'package:cofinex/screens/cards/apply_cards.dart';
import 'package:cofinex/screens/dashboard/airdrop.dart';
import 'package:cofinex/screens/dashboard/exchange.dart';
import 'package:cofinex/screens/dashboard/gift_card.dart';
import 'package:cofinex/screens/dashboard/leader_board.dart';
import 'package:cofinex/screens/dashboard/staking.dart';
import 'package:cofinex/screens/profile/choose_currency.dart';
import 'package:cofinex/screens/wallet/wallet.dart';
import 'package:cofinex/screens/wallet/widthdraw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../dashboard/card_details.dart';

class Home_Screen extends StatefulWidget {
  final bool loginStatus;

  const Home_Screen({Key? key, required this.loginStatus}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final PageStorageBucket bucket = PageStorageBucket();
  List<BottomNavItem>? _bottomItems;
  int currentIndex = 0;
  int selectedIndex = 0;

  ScrollController _scrollController = ScrollController();
  List grid_name = [
    "Withdraw",
    "Exchange",
    "Staking",
    "Cards",
    "Leaders",
    "Airdrop",
    "Giftcard",
    "Invite"
  ];

  List grid_img = [
    "assets/images/withdraw.svg",
    "assets/images/exchange.svg",
    "assets/images/staking.svg",
    "assets/icon/card.svg",
    "assets/images/cup.svg",
    "assets/icon/airdrop.svg",
    "assets/icon/gift.svg",
    "assets/images/invite.svg"
  ];
  List list_name = ["Bitcoin", "Binance USD", "Ethereum", "Ripple"];
  List list_img = [
    "assets/images/bit.svg",
    "assets/images/binance.svg",
    "assets/images/eth.svg",
    "assets/images/xrp.svg"
  ];
  bool dashview = true;
  List<Widget> bottomPage = [
    MarketScreen(),
    TradeScreen(),
    Wallet_Screen(),
    Assets()
  ];
  APIUtils apiUtils = APIUtils();
  List<String> titleText = [
    "loc_side_home",
    "loc_side_markets",
    "loc_side_trade",
    "loc_side_wallet",
    "loc_side_nft"
  ];
  Widget screen = MarketScreen();

  List<AllTicker> allTicker = [];
  GraphAPIUtils qlapiUtils = GraphAPIUtils();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bottomItems = createBottomItems();
    getDetails();
    storeData();
  }

  storeData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("login", widget.loginStatus);

    if (widget.loginStatus) {
      fillList();
      getUserDetails();
      getKycDetails();
    }
  }

  getDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      String themeType = preferences.getString('theme').toString();
      print(themeType);

      if (themeType == null || themeType == "null") {
        CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.LIGHT);
      } else if (themeType == "dark") {
        CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.DARK);
      } else {
        CustomTheme.instanceOf(context).changeTheme(MyThemeKeys.LIGHT);
      }
    });
  }

  storeuserData(String username, String email,String kyclink,String kyc) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("name", username);
    preferences.setString("mail", email);
    preferences.setString("kycLink", kyclink);
    preferences.setString("kyc", kyc);
  }
  storekycData(String kyclink) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString("kycLink", kyclink);

  }

  void onSelectItem(int index) async {
    setState(() {
      if (index == 0) {
        dashview = true;
      } else {
        dashview = false;
        currentIndex = index;
        selectedIndex = index;
        screen = bottomPage[index - 1];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: WillPopScope(
          child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).backgroundColor,
              elevation: 0.0,
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: Theme.of(context).backgroundColor,

                // Status bar brightness (optional)
                statusBarIconBrightness:
                    Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
              leading: Padding(
                  padding: EdgeInsets.only(left: 12.0, top: 10.0, bottom: 10.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Profile_Screen()));
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
              title: currentIndex == 0
                  ? InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 35.0,
                        decoration: BoxDecoration(
                            color: CustomTheme.of(context).focusColor,
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
                  : Text(
                      AppLocalizations.instance.text(titleText[currentIndex]),
                      style: CustomWidget(context: context)
                          .CustomSizedTextStyle(
                              18.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w600,
                              'FontRegular'),
                    ),
              actions: [
                Padding(
                    padding: EdgeInsets.only(
                        left: 0.0, top: 10.0, bottom: 8.0, right: 20.0),
                    child: InkWell(
                        onTap: () {
                          if (currentIndex == 0) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Notification_Screen()));
                          }

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
                              currentIndex == 0
                                  ? "assets/images/notification.svg"
                                  : "assets/icon/search.svg",
                              height: 20.0,
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                        ))),
              ],
            ),
            body: PageStorage(
                child: dashview ? dashBoard() : screen, bucket: bucket),
            bottomNavigationBar: BottomNav(
              index: currentIndex,
              selectedIndex: selectedIndex,
              color: Color(0xFF01081E),
              iconStyle: IconStyle(
                color: Color(0xFF848484),
                onSelectColor: CustomTheme.of(context).errorColor,
                size: 22.0,
              ),
              bgStyle: BgStyle(
                color: Color(0xFF01081E),
                onSelectColor: Color(0xFF01081E),
              ),
              labelStyle: LabelStyle(
                visible: true,
                textStyle: CustomWidget(context: context).CustomSizedTextStyle(
                    10.0, Color(0xFF848484), FontWeight.normal, 'FontRegular'),
                onSelectTextStyle: CustomWidget(context: context)
                    .CustomSizedTextStyle(12.0, Theme.of(context).errorColor,
                        FontWeight.normal, 'FontRegular'),
              ),
              onTap: (i) {
                setState(() {
                  onSelectItem(i);
                  currentIndex = i;
                  selectedIndex = i;
                });
              },
              items: _bottomItems,
            ),
          ),
          onWillPop: () async {
            if (currentIndex != 0) {
              setState(() async {
                selectedIndex = 0;
                currentIndex = 0;
                onSelectItem(0);
              });
            } else {
              exit(0);
            }
            return false;
          },
        ));
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

  Widget dashBoard() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).backgroundColor,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 15.0, 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage("assets/icon/back.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.instance.text("loc_tot_asset"),
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                        12.0,
                        Theme.of(context).accentColor,
                        FontWeight.w600,
                        'FontRegular'),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "2,460.89",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                                22.0,
                                Theme.of(context).errorColor,
                                FontWeight.w700,
                                'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "USD",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                                12.0,
                                Theme.of(context).accentColor,
                                FontWeight.w600,
                                'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "0.23415600",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                                14.0,
                                Theme.of(context).errorColor,
                                FontWeight.w600,
                                'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "BTC",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                                12.0,
                                Theme.of(context).accentColor,
                                FontWeight.w600,
                                'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.instance.text("loc_actions"),
                    style: CustomWidget(context: context).CustomSizedTextStyle(
                        18.0,
                        Theme.of(context).primaryColor,
                        FontWeight.w600,
                        'FontRegular'),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () {
                            if (widget.loginStatus) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Choose_Currency()));
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Register()));
                            }
                          },
                          child: Container(
                            padding:
                                EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                width: 1.0,
                                color: Theme.of(context).splashColor,
                              ),
                              color: Theme.of(context).focusColor,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/deposite.svg",
                                        height: 25.0,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        AppLocalizations.instance
                                            .text("loc_deposite"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                12.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15.0,
                                  color: Theme.of(context).accentColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Flexible(
                        child: InkWell(
                          onTap: () {
                            if (widget.loginStatus) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Choose_Currency()));
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Register()));
                            }
                          },
                          child: Container(
                            padding:
                                EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                width: 1.0,
                                color: Theme.of(context).splashColor,
                              ),
                              color: Theme.of(context).focusColor,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/crypco.svg",
                                        height: 25.0,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        AppLocalizations.instance
                                            .text("loc_buy_cryp"),
                                        style: CustomWidget(context: context)
                                            .CustomSizedTextStyle(
                                                12.0,
                                                Theme.of(context).primaryColor,
                                                FontWeight.w600,
                                                'FontRegular'),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15.0,
                                  color: Theme.of(context).accentColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      controller: _scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      // physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: grid_name.length,
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: () {
                            if (index == 0) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Widthdraw_Screen()));
                            } else if (index == 1) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Exchange_Screen()));
                            } else if (index == 2) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Staking()));
                            } else if (index == 3) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ApplyCard()));
                            } else if (index == 4) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Leader_Board_Screen()));
                            } else if (index == 5) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Airdrop_Screen()));
                            } else if (index == 6) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => GiftCard_Details()));
                            } else if (index == 7) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Invite_Screen()));
                            }
                          },
                          child: Container(
                              padding: EdgeInsets.only(
                                top: 5.0,
                                bottom: 5.0,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).focusColor,
                                border: Border.all(
                                    width: 1.0,
                                    color: Theme.of(context).splashColor),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    grid_img[index].toString(),
                                    height: 25.0,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    grid_name[index].toString(),
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                            10.0,
                                            Theme.of(context).primaryColor,
                                            FontWeight.w600,
                                            'FontRegular'),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            widget.loginStatus
                ? Container()
                : Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 15.0, 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage("assets/icon/back.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "Get rewarded up to 4030 USDT for signing up!",
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        22.0,
                                        Theme.of(context).errorColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                textAlign: TextAlign.start,
                              ),
                              flex: 2,
                            ),
                            Flexible(
                              child: Container(),
                              flex: 1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Register()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Theme.of(context).buttonColor,
                            ),
                            child: Center(
                              child: Text(
                                AppLocalizations.instance.text("loc_signup"),
                                style: CustomWidget(context: context)
                                    .CustomSizedTextStyle(
                                        14.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Cryptocurency",
                  style: CustomWidget(context: context).CustomSizedTextStyle(
                      18.0,
                      Theme.of(context).primaryColor,
                      FontWeight.w600,
                      'FontRegular'),
                  textAlign: TextAlign.center,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        onSelectItem(1);
                        setState(() {
                          selectedIndex = 1;
                          dashview = false;
                          currentIndex = 1;
                        });
                      },
                      child: Text(
                        "See All",
                        style: CustomWidget(context: context)
                            .CustomSizedTextStyle(
                                12.0,
                                Theme.of(context).accentColor,
                                FontWeight.w600,
                                'FontRegular'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Container(
                      width: 50,
                      height: 1.0,
                      decoration:
                          BoxDecoration(color: Theme.of(context).primaryColor),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).splashColor, width: 1.0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                  color: Theme.of(context).highlightColor,
                ),
                child: allTicker.length > 0
                    ? ListView.builder(
                        physics: ScrollPhysics(),
                        itemCount: 5,
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemBuilder: (BuildContext context, int index) {
                          bool test = false;
                          String coinImage =
                              allTicker[index].pair!.split("-")[0].toString();
                          if (double.parse(allTicker[index]
                                  .priceChangePercent24Hr
                                  .toString()) >
                              0) {
                            test = true;
                          } else {
                            test = false;
                          }
                          return Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 40,
                                                height: 40,
                                                padding: EdgeInsets.all(8.0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Theme.of(context)
                                                          .splashColor,
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  color: Theme.of(context)
                                                      .highlightColor,
                                                ),
                                                child: SvgPicture.network(
                                                  "https://images.cofinex.io/crypto/ico/" +
                                                      coinImage.toLowerCase() +
                                                      ".svg",
                                                  height: 15.0,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    allTicker[index]
                                                        .pair
                                                        .toString(),
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            13.0,
                                                            Theme.of(context)
                                                                .primaryColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  Text(
                                                    coinImage,
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            12.0,
                                                            Theme.of(context)
                                                                .canvasColor,
                                                            FontWeight.w500,
                                                            'FontRegular'),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SvgPicture.asset(test
                                            ? 'assets/icon/graph_success.svg'
                                            : 'assets/icon/graph_fail.svg'),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                double.parse(allTicker[index]
                                                        .marketPrice
                                                        .toString())
                                                    .toStringAsFixed(4),
                                                style: CustomWidget(
                                                        context: context)
                                                    .CustomSizedTextStyle(
                                                        14.0,
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        FontWeight.w600,
                                                        'FontRegular'),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    double.parse(allTicker[
                                                                index]
                                                            .priceChangePercent24Hr
                                                            .toString())
                                                        .toStringAsFixed(2),
                                                    style: CustomWidget(
                                                            context: context)
                                                        .CustomSizedTextStyle(
                                                            12.0,
                                                            test
                                                                ? Theme.of(
                                                                        context)
                                                                    .indicatorColor
                                                                : Theme.of(
                                                                        context)
                                                                    .scaffoldBackgroundColor,
                                                            FontWeight.w600,
                                                            'FontRegular'),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 1.0,
                                color: Theme.of(context).splashColor,
                              )
                            ],
                          );
                        },
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                // Add one stop for each color
                                // Values should increase from 0.0 to 1.0
                                stops: [
                              0.1,
                              0.5,
                              0.9,
                            ],
                                colors: [
                              Theme.of(context).backgroundColor,
                              Theme.of(context).backgroundColor,
                              Theme.of(context).backgroundColor,
                            ])),
                        child: Center(
                          child: Text(
                            " No records Found..!",
                            style: CustomWidget(context: context)
                                .CustomSizedTextStyle(
                                    16.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w500,
                                    'FontRegular'),
                          ),
                        ))),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  fillList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    QueryMutation queryMutation = QueryMutation();

    GraphQLClient _client =
        qlapiUtils.clientToQuery(preferences.getString("token").toString());
    QueryResult result = await _client.query(
      QueryOptions(document: gql(queryMutation.getTickeDetails())),
    );

    List<dynamic> listData = result.data!["getAllTickerInfoV2"]["items"];

    setState(() {
      allTicker = (listData).map((item) => AllTicker.fromJson(item)).toList();

      allTicker
        ..sort((a, b) => ((double.parse(b.marketPrice.toString()) +
                (double.parse(b.volumeTotal24Hr.toString())))
            .compareTo((double.parse(a.marketPrice.toString()) +
                (double.parse(a.volumeTotal24Hr.toString()))))));
    });
  }

  getUserDetails() {
    apiUtils.getUserDetails().then((dynamic loginData) {
      setState(() {
        if (loginData["status"].toString() == "false") {
        } else {
          UserDetailsModel datas=UserDetailsModel.fromJson(loginData);

          storeuserData(datas.data!.name.toString(),datas.data!.email.toString(),datas.data!.kycCaptureLink.toString(),datas.data!.kycStatus.toString());
        }
      });
    }).catchError((Object error) {
      setState(() {});
    });
  }

  getKycDetails() {
    apiUtils.getInitKYC().then((dynamic loginData) {
      setState(() {
        if (loginData["status"].toString() == "false") {
        } else {

          storekycData(loginData['url']);


        }
      });
    }).catchError((Object error) {
      setState(() {});
    });
  }
}

class testWidget extends StatefulWidget {
  const testWidget({Key? key}) : super(key: key);

  @override
  State<testWidget> createState() => _testWidgetState();
}

class _testWidgetState extends State<testWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text(
          "Coming Soon....!",
          style: CustomWidget(context: context).CustomSizedTextStyle(18.0,
              Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        ),
      ),
    );
  }
}
