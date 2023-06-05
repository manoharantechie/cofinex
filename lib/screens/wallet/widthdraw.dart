import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:cofinex/data_model/api_utils.dart';
import 'package:cofinex/data_model/graph_ql_utils.dart';
import 'package:cofinex/data_model/model/wallet_details.dart';
import 'package:cofinex/data_model/query_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/custom_widget.dart';
import '../../common/localization/localizations.dart';
import '../../common/textformfield_custom.dart';

class Widthdraw_Screen extends StatefulWidget {
  const Widthdraw_Screen({Key? key}) : super(key: key);

  @override
  State<Widthdraw_Screen> createState() => _Widthdraw_ScreenState();
}

class _Widthdraw_ScreenState extends State<Widthdraw_Screen> {

  FocusNode addressFocus = FocusNode();
  FocusNode fromaddressFocus = FocusNode();
  TextEditingController addressController = TextEditingController();
  TextEditingController fromAddressController = TextEditingController();
  FocusNode totamountFocus = FocusNode();
  TextEditingController totamountController = TextEditingController();
  WalletDetails? selectedValue;
  bool loading = false;

  APIUtils apiUtils=APIUtils();


  ScrollController _scrollController = ScrollController();

  bool checkHide = false;

  ScanResult? scanResult;
  var _autoEnableFlash = false;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _aspectTolerance = 0.00;

  String address="";
  String memo="";

  List<WalletDetails> allTicker = [];

  GraphAPIUtils qlapiUtils = GraphAPIUtils();

  String token = "";


  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'Cancel');
  bool loginStatus = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading=true;
    fillList();
  }

  Future<void> _scan(bool type) async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': _cancelController.text,
            'flash_on': _flashOnController.text,
            'flash_off': _flashOffController.text,
          },
          useCamera: _selectedCamera,
          autoEnableFlash: _autoEnableFlash,
          android: AndroidOptions(
            aspectTolerance: _aspectTolerance,
            useAutoFocus: _useAutoFocus,
          ),
        ),
      );
      setState(() {
        scanResult = result;
        var str = scanResult!.rawContent.toString();
     if(type)
       {
         if(str.contains(":")){
           var parts = str.split(':');
           addressController.text=parts[1].trim().toString();
         }else{
           addressController.text=scanResult!.rawContent.toString();
         }
       }
     else
       {
         if(str.contains(":")){
           var parts = str.split(':');
           fromAddressController.text=parts[1].trim().toString();
         }else{
           fromAddressController.text=scanResult!.rawContent.toString();
         }
       }

      });
    } on PlatformException catch (e) {
      setState(() {
        scanResult = ScanResult(
          type: ResultType.Error,
          rawContent: e.code == BarcodeScanner.cameraAccessDenied
              ? 'The user did not grant the camera permission!'
              : 'Unknown error: $e',
        );
      });
    }
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
              .text("loc_widthdraw"),
          style: CustomWidget(context: context).CustomSizedTextStyle(
              18.0, Theme.of(context).primaryColor, FontWeight.w600, 'FontRegular'),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color:  Theme.of(context).focusColor,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0,20.0,0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "From Address",
                              style: CustomWidget(context: context).CustomSizedTextStyle(
                                  10.0,
                                  Theme.of(context).canvasColor,
                                  FontWeight.w500,
                                  'FontRegular'),
                              textAlign: TextAlign.center,
                            ),),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormFieldCustom(
                            onEditComplete: () {
                              fromaddressFocus.unfocus();
                              // FocusScope.of(context).requestFocus(snameFocus);
                            },
                            radius: 10.0,
                            error: "Enter Amount",
                            textColor: Theme.of(context).bottomAppBarColor,
                            borderColor: Theme.of(context).splashColor,
                            fillColor: Theme.of(context).focusColor,
                            hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                12.0, Theme.of(context).canvasColor, FontWeight.w500, 'FontRegular'),
                            textStyle: CustomWidget(context: context).CustomTextStyle(
                                Theme.of(context).bottomAppBarColor, FontWeight.w500, 'FontRegular'),
                            textInputAction: TextInputAction.next,
                            focusNode: fromaddressFocus,
                            maxlines: 1,
                            text: '',
                            hintText: "Input or press and hold to paste the address",
                            obscureText: false,
                            textChanged: (value) {},
                            onChanged: () {},
                            suffix: InkWell(
                              onTap: (){
                                _scan(false);
                              },
                              child: Container(
                                child: Icon(
                                  Icons.qr_code_2_outlined,
                                  color: Theme.of(context).primaryColor,
                                  size: 25.0,
                                ),
                              ),
                            ),
                            validator: (value) {

                            },
                            enabled: true,
                            textInputType: TextInputType.text,
                            controller: fromAddressController,
                          ),

                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "To Address",
                              style: CustomWidget(context: context).CustomSizedTextStyle(
                                  10.0,
                                  Theme.of(context).canvasColor,
                                  FontWeight.w500,
                                  'FontRegular'),
                              textAlign: TextAlign.center,
                            ),),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormFieldCustom(
                            onEditComplete: () {
                              addressFocus.unfocus();
                              // FocusScope.of(context).requestFocus(snameFocus);
                            },
                            radius: 10.0,
                            error: "Enter Amount",
                            textColor: Theme.of(context).bottomAppBarColor,
                            borderColor: Theme.of(context).splashColor,
                            fillColor: Theme.of(context).focusColor,
                            hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                12.0, Theme.of(context).canvasColor, FontWeight.w500, 'FontRegular'),
                            textStyle: CustomWidget(context: context).CustomTextStyle(
                                Theme.of(context).bottomAppBarColor, FontWeight.w500, 'FontRegular'),
                            textInputAction: TextInputAction.next,
                            focusNode: addressFocus,
                            maxlines: 1,
                            text: '',
                            hintText: "Input or press and hold to paste the address",
                            obscureText: false,
                            textChanged: (value) {},
                            onChanged: () {},
                            suffix: InkWell(
                              onTap: (){
                                _scan(true);
                              },
                              child: Container(
                                child: Icon(
                                  Icons.qr_code_2_outlined,
                                  color: Theme.of(context).primaryColor,
                                  size: 25.0,
                                ),
                              ),
                            ),
                            validator: (value) {

                            },
                            enabled: true,
                            textInputType: TextInputType.text,
                            controller: addressController,
                          ),

                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              AppLocalizations.instance.text("loc_tot").toUpperCase(),
                              style: CustomWidget(context: context).CustomSizedTextStyle(
                                  10.0,
                                  Theme.of(context).canvasColor,
                                  FontWeight.w500,
                                  'FontRegular'),
                              textAlign: TextAlign.center,
                            ),),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(child:
                              TextFormFieldCustom(
                                onEditComplete: () {
                                  totamountFocus.unfocus();
                                  // FocusScope.of(context).requestFocus(snameFocus);
                                },
                                radius: 10.0,
                                error: "Enter Amount",
                                textColor: Theme.of(context).bottomAppBarColor,
                                borderColor: Theme.of(context).splashColor,
                                fillColor: Theme.of(context).focusColor,
                                hintStyle: CustomWidget(context: context).CustomSizedTextStyle(
                                    12.0, Theme.of(context).canvasColor, FontWeight.w500, 'FontRegular'),
                                textStyle: CustomWidget(context: context).CustomTextStyle(
                                    Theme.of(context).bottomAppBarColor, FontWeight.w500, 'FontRegular'),
                                textInputAction: TextInputAction.next,
                                focusNode: totamountFocus,
                                maxlines: 1,
                                text: '',
                                hintText: "Min. Ammount: 0.001",
                                obscureText: false,
                                textChanged: (value) {},
                                onChanged: () {},
                                suffix: Container(
                                  width: 0.0,
                                ),
                                validator: (value) {

                                },
                                enabled: true,
                                textInputType: TextInputType.number,
                                controller: totamountController,
                              ),flex: 2,),
                              SizedBox(width: 15.0,),
                              Flexible(child:
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 45.0,
                                padding: EdgeInsets.fromLTRB(8, 0.0, 5, 0.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context).splashColor,
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Theme.of(context).splashColor.withOpacity(0.5),
                                ),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    canvasColor: Theme.of(context).backgroundColor,
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      menuMaxHeight: MediaQuery.of(context).size.height * 0.7,
                                      items: allTicker
                                          .map((value) => DropdownMenuItem(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 25,
                                              height: 25,
                                              padding:
                                              EdgeInsets
                                                  .all(
                                                  2.0),
                                              decoration:
                                              BoxDecoration(
                                                border: Border.all(
                                                    color: Theme.of(
                                                        context)
                                                        .splashColor,
                                                    width:
                                                    1.0),
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    10.0),
                                                color: Theme.of(
                                                    context)
                                                    .highlightColor,
                                              ),
                                              child: SvgPicture
                                                  .network(
                                                "https://images.cofinex.io/crypto/ico/" +
                                                    value.token.toString()
                                                        .toLowerCase() +
                                                    ".svg",
                                                height: 15.0,
                                              ),
                                            ),
                                            SizedBox(width: 3.0,),
                                            Text(
                                              value.token.toString(),
                                              style: CustomWidget(context: context)
                                                  .CustomSizedTextStyle(
                                                  10.0,
                                                  Theme.of(context).primaryColor,
                                                  FontWeight.w700,
                                                  'FontRegular'),
                                            ),
                                          ],
                                        ),
                                        value: value,
                                      ))
                                          .toList(),
                                      onChanged: (value) async {
                                        setState(() {
                                          selectedValue = value;
                                          loading=true;

                                        });
                                      },

                                      isExpanded: true,
                                      value: selectedValue,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Theme.of(context).unselectedWidgetColor,
                                        // color: Them,
                                        // color: AppColors.otherTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),flex: 1,)
                            ],
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(child: Text(
                                AppLocalizations.instance.text("loc_fee")+" :",
                                style: CustomWidget(context: context).CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).canvasColor,
                                    FontWeight.w500,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),flex: 1,),
                              Flexible(child: Text(
                                "0.1%",
                                style: CustomWidget(context: context).CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),flex: 1,)
                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            height: 1.0,
                            color: Theme.of(context).splashColor,
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(child: Text(
                                AppLocalizations.instance.text("loc_amt_receive"),
                                style: CustomWidget(context: context).CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).canvasColor,
                                    FontWeight.w500,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),flex: 1,),
                              Flexible(child: Text(
                                "0 USD",
                                style: CustomWidget(context: context).CustomSizedTextStyle(
                                    12.0,
                                    Theme.of(context).primaryColor,
                                    FontWeight.w600,
                                    'FontRegular'),
                                textAlign: TextAlign.center,
                              ),flex: 1,)
                            ],
                          ),

                        ],
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(fromAddressController.text.isEmpty)
                            {
                              CustomWidget(context: context).showSnackBar(
                                  context, "Enter From Address", false);
                            }
                            else   if(addressController.text.isEmpty)
                            {
                              CustomWidget(context: context).showSnackBar(
                                  context, "Enter To Address", false);
                            }
                            else if(totamountController.text.isEmpty)
                            {

                              CustomWidget(context: context).showSnackBar(
                                  context, "Enter Withdraw Amount", false);
                            }
                            else{
                              setState(() {
                                loading=true;
                                doWithdraw();
                              });
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15.0),
                          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Theme.of(context).backgroundColor, ),
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.instance.text("loc_widthdraw"),
                              style: CustomWidget(context: context)
                                  .CustomSizedTextStyle(
                                  14.0,
                                  Theme.of(context).primaryColor,
                                  FontWeight.w600,
                                  'FontRegular'),
                            ),
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
              loading
                  ? CustomWidget(context: context).loadingIndicator(
                CustomTheme.of(context).primaryColorLight,
              )
                  : Container()
            ],
          )
      ),
    ));
  }
  fillList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    QueryMutation queryMutation = QueryMutation();

    GraphQLClient _client = qlapiUtils
        .clientSecondToQuery(preferences.getString("token").toString());
    QueryResult result = await _client.query(
      QueryOptions(document: gql(queryMutation.getWalletBalance())),
    );
    setState(() {
      loading=false;
    });
    List<dynamic> listData = result.data!["getAllWalletBalances"]["items"];

    if(listData.length>0)
      {
        setState(() {
          loading = false;
          allTicker =
              (listData).map((item) => WalletDetails.fromJson(item)).toList();
          selectedValue=allTicker.first;

        });
      }
    else
      {

        allTicker=[];
      }


  }

  doWithdraw() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    QueryMutation queryMutation = QueryMutation();

    GraphQLClient _client = qlapiUtils
        .clientSecondToQuery(preferences.getString("token").toString());
    QueryResult result = await _client.query(
      QueryOptions(document: gql(queryMutation.withdrawRequest(fromAddressController.text.toString(), addressController.text.toString(), totamountController.text.toString(), selectedValue!.token.toString()))),
    );

    CustomWidget(context: context).showSnackBar(
        context, result.data!["status"].toString(), true);

    setState(() {
      loading = false;

    });
  }
}
