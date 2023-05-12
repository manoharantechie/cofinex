
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cofinex/common/loading_indicator.dart';
import 'package:cofinex/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';



class CustomWidget {


  final BuildContext context;

  CustomWidget({required this.context});

  //TODO Alert dialog
  showSuccessAlertDialog(
    String title,
    String message,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)), //this right here
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [CustomTheme.of(context).splashColor, CustomTheme.of(context).splashColor],
                    begin: Alignment.topRight,
                    //const FractionalOffset(0.0, 0.5),
                    end: Alignment.bottomLeft,
                    //const FractionalOffset(1.0, 0.6),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              height: MediaQuery.of(context).size.height * 0.30,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSansBold',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 7.0, bottom: 10.0),
                      height: 2.0,
                      color: CustomTheme.of(context).primaryColor
                    ),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      child: GestureDetector(
                        child: Container(
                          width: 100,
                          height: 40,
                          margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                          decoration: BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [
                                  CustomTheme.of(context).splashColor,
                                  CustomTheme.of(context).splashColor
                                ],
                                begin: Alignment.topRight,
                                //const FractionalOffset(0.0, 0.5),
                                end: Alignment.bottomLeft,
                                //const FractionalOffset(1.0, 0.6),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "ok".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "OpenSansBold",
                                  color: CustomTheme.of(context).primaryColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
    // show the dialog
  }

  Widget loadingIndicator(Color color) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color:  Color(0xFF1d0068),
      child:  Center(
        child: Container(
          child: Center(
            child:  Image.asset(
              'assets/profile/loader.gif',
              width: 60,
              height: 60
            )
          ),
        ),
      ),
    );
  }

  Widget loadingIndicatorWeb(Color color) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color:  Color(0xFF1d0068),
      child:  Center(
        child: Container(
          child: Center(
              child:  Image.asset(
                  'assets/icon/loader.gif',
                  width: 250,
                  height: 250
              )
          ),
        ),
      ),
    );
  }

  Widget loadingIndicator1(Color color) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color:  Color(0xFF1d0068),
      child:  Center(
        child: Container(
          child: Center(
            child: SpinKitFadingCube(
              color: color,
            ),
          ),
        ),
      ),
    );
  }
  CustomTextStyle(Color color, FontWeight weight, String family) {
    return TextStyle(
      fontFamily: family,
      color: color,
        letterSpacing: 1.5,
      fontWeight: weight,
      fontSize: 10.0
    );
  }

  // custombar(String title, String message, bool status) {
  //
  //  var snackBar = SnackBar(
  //     elevation: 0,
  //     behavior: SnackBarBehavior.floating,
  //     backgroundColor: Colors.transparent,
  //     content: AwesomeSnackbarContent(
  //       title: title,
  //       message: message,
  //       color: status?Colors.green:Colors.red,
  //       contentType: status ? ContentType.success : ContentType.failure,
  //     ),
  //   );
  //   return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  CustomSizedTextStyle(
      double size, Color color, FontWeight weight, String family) {
    return TextStyle(
      fontSize: size,
      fontFamily: family,
      color: color,
      letterSpacing: 1.5,
      fontWeight: weight,
    );
  }

  Widget noInternet() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color:  Color(0xFF1d0068),
      child: Center(
        child: Container(
          child: Center(child: Image.asset('assets/image/internet.png')),
        ),
      ),
    );
  }

  Widget noRecordsFound(String data, Color color) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(data,
            style: TextStyle(
              fontFamily: "FontRegular",
              color: color,
            )),
      ),
    );
  }


  void showSnackBar(BuildContext contexts,String text,bool type) {
    final snackBar = SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      content: Container(
        height: 35.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child:  Text(text),),
            IconButton(onPressed: (){

            }, icon: Icon(Icons.clear,color: Colors.white,size: 10.0,))
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: type ?Colors.teal:Colors.redAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


}
