import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/data_model/api_utils.dart';
import 'package:cofinex/data_model/model/currency_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Assets extends StatefulWidget {
  const Assets({Key? key}) : super(key: key);

  @override
  State<Assets> createState() => _AssetsState();
}

class _AssetsState extends State<Assets> {

  ScrollController _scrollController = ScrollController();
  APIUtils apiUtils = APIUtils();
  bool loading = false;

  List<CurrencyList> cyrptoCurrecy = [];

  bool loginStatus = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();

  }

  getDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {


      loginStatus = preferences.getBool("login")!;
      if (loginStatus) {
        loading = true;
        getCurrency();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: CustomTheme.of(context).backgroundColor,
          child:  loading
              ? CustomWidget(context: context).loadingIndicator(
            CustomTheme.of(context).buttonColor,
          ):Padding(
            padding: EdgeInsets.only(left: 20.0,right: 20.0),
            child:  Container(

                child:  cyrptoCurrecy.length > 0?ListView.builder(
                  physics: ScrollPhysics(),
                  itemCount: cyrptoCurrecy.length,
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        
                        Container(

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Container(
                                width: 40,
                                height: 40,
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context).splashColor,
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Theme.of(context).highlightColor,
                                ),
                                child: SvgPicture.network(
                                  "https://images.cofinex.io/crypto/ico/" +
                                      cyrptoCurrecy[index]
                                          .symbol
                                          .toString()
                                          .toLowerCase() +
                                      ".svg",
                                  height: 15.0,
                                ),
                              ),
                              const SizedBox(width: 15.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 15.0,),
                                  Text(
                                    cyrptoCurrecy[index].networktype.toString()+" ("+cyrptoCurrecy[index].symbol.toString() + ")",
                                    style: CustomWidget(context: context)
                                        .CustomSizedTextStyle(
                                        14.0,
                                        Theme.of(context).primaryColor,
                                        FontWeight.w600,
                                        'FontRegular'),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 15.0,),
                                  Container(

                                    width: MediaQuery.of(context).size.width*0.7,
                                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15.0),
                                        bottomRight: Radius.circular(15.0),
                                        bottomLeft: Radius.circular(15.0),
                                      ),
                                      color:   Theme.of(context).focusColor,
                                    ),
                                    child:   Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [


                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              " \$35,574.00",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  14.0,
                                                  Theme.of(context).primaryColor,
                                                  FontWeight.w500,
                                                  'FontRegular'),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(height: 8.0,),
                                            Text(
                                              "+%14.82",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  14.0,
                                                  Theme.of(context).buttonColor,
                                                  FontWeight.w500,
                                                  'FontRegular'),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              " \$50,000",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  14.0,
                                                  Theme.of(context).hoverColor.withOpacity(0.5),
                                                  FontWeight.w400,
                                                  'FontRegular'),
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 5.0,),

                                            Image.asset('assets/icon/chart.png',height: 30.0,width: 120.0,),
                                            const SizedBox(height: 5.0,),
                                            Text(
                                              "\$6,480",
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  14.0,
                                                  Theme.of(context).hoverColor.withOpacity(0.5),
                                                  FontWeight.w500,
                                                  'FontRegular'),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        const SizedBox(height: 10.0,)

                      ],
                    );
                  },
                ) : Container(
                    height: MediaQuery.of(context).size.height *
                        0.3,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                    ),
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
                    ))
            )
          )

      ),
    );
  }

  getCurrency() {
    apiUtils.getAllCurrency().then((CurrencyListModel loginData) {
      setState(() {
        if (loginData.status!) {
          loading = false;
          List<CurrencyList> listV = loginData.data!;
          for (int m = 0; m < listV.length; m++) {

              cyrptoCurrecy.add(listV[m]);

          }
          print(cyrptoCurrecy.length);
          cyrptoCurrecy=cyrptoCurrecy.toSet().toList();
          print(cyrptoCurrecy.length);
        } else {

          loading = false;
          cyrptoCurrecy = [];
        }
      });
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }
}
