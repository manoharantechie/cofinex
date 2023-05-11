import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/data_model/api_utils.dart';
import 'package:cofinex/data_model/model/deposit_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';

class Wallet_Address extends StatefulWidget {
  final String network;
  final String coin;
   Wallet_Address({Key? key, required this.network, required this.coin}) : super(key: key);

  @override
  State<Wallet_Address> createState() => _Wallet_AddressState();
}

class _Wallet_AddressState extends State<Wallet_Address> {
  bool loading = false;
  APIUtils apiUtils = APIUtils();
  String address="";
  String memo="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading=true;
    getCurrency();
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
              .text("loc_deposite")+" "+widget.coin,
          style: CustomWidget(context: context).CustomSizedTextStyle(
              18.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color:  Theme.of(context).focusColor,
        child:  loading
            ? CustomWidget(context: context).loadingIndicator(
          CustomTheme.of(context).buttonColor,
        )
            :Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0,20.0,0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100.0,),
              Text(
                AppLocalizations.instance.text("loc_wallet_address"),
                style: CustomWidget(context: context).CustomSizedTextStyle(
                    18.0,
                    Theme.of(context).primaryColor,
                    FontWeight.w600,
                    'FontRegular'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),

              Center(
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Image.network(
                    "https://chart.googleapis.com/chart?chs=250x250&cht=qr&chl=" +
                        address.toString(),
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
              ),

              SizedBox(
                height: 25.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(width: 1.0,color: Theme.of(context).splashColor,)
                ),
                padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0,bottom: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.instance.text("loc_address"),
                          style: CustomWidget(context: context).CustomSizedTextStyle(
                              8.0,
                              Theme.of(context).canvasColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          address,
                          style: CustomWidget(context: context).CustomSizedTextStyle(
                              12.0,
                              Theme.of(context).primaryColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),flex: 3,),
                    Flexible(child: InkWell(
                      onTap: (){
                        Clipboard.setData(
                            ClipboardData(text: address));
                        CustomWidget(context: context).showSnackBar(
                            context, "Address was Copied", true);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Theme.of(context).primaryColor,
                        ),
                        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                        child: Text(
                            AppLocalizations.instance.text("loc_copy"),
                          style: CustomWidget(context: context).CustomSizedTextStyle(
                              12.0,
                              Theme.of(context).focusColor,
                              FontWeight.w600,
                              'FontRegular'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),flex: 1,)

                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
          widget.coin=="XRP" ?   Container(
            width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(width: 1.0,color: Theme.of(context).splashColor,)
                ),
                padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0,bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Memo Number",
                      style: CustomWidget(context: context).CustomSizedTextStyle(
                          8.0,
                          Theme.of(context).canvasColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      memo,
                      style: CustomWidget(context: context).CustomSizedTextStyle(
                          12.0,
                          Theme.of(context).primaryColor,
                          FontWeight.w600,
                          'FontRegular'),
                      textAlign: TextAlign.start,
                    ),
                  ],
                )
              ):Container()
            ],
          ),
        ),
      ),
    );
  }

  getCurrency() {
    apiUtils.getDepositAddress(widget.coin, widget.network).then((dynamic loginData) {
      setState(() {

        if (loginData['status']) {
          loading = false;
          if(widget.coin=="XRP")
            {

              address=loginData["address"]["address"];
              memo=loginData["address"]["memo_number"];
            }
          else
            {
              address=loginData["address"];
            }


        } else {
        }
      });
    }).catchError((Object error) {
      setState(() {
        loading = false;
      });
    });
  }
}
