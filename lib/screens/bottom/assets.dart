import 'package:cofinex/common/custom_widget.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Assets extends StatefulWidget {
  const Assets({Key? key}) : super(key: key);

  @override
  State<Assets> createState() => _AssetsState();
}

class _AssetsState extends State<Assets> {

  ScrollController _scrollController = ScrollController();
  List list_name=[
    "Bitcoin","Binance USD","Ethereum","Ripple","Dogecoin"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: CustomTheme.of(context).backgroundColor,
          child: Padding(
            padding: EdgeInsets.only(left: 20.0,right: 20.0),
            child:  Container(

                child: ListView.builder(
                  physics: ScrollPhysics(),
                  itemCount: list_name.length,
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
                              decoration: BoxDecoration(
                                border: Border.all(color: Theme.of(context).splashColor, width: 1.0),
                                borderRadius:BorderRadius.circular(10.0),
                                color:  Theme.of(context).buttonColor,
                              ),
                              padding: EdgeInsets.all(10.0),
                              child:   SvgPicture.asset('assets/icon/btc.svg'),
                            ),const SizedBox(width: 15.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 15.0,),
                                  Text(
                                    list_name[index].toString()+" (BTC)",
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
                                      color: Colors.white,
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
                )
            )
          )

      ),
    );
  }
}
