import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LiveWidget extends StatefulWidget {


  const LiveWidget({Key? key,}) : super(key: key);

  @override
  State<LiveWidget> createState() => _LiveWidgetState();
}

class _LiveWidgetState extends State<LiveWidget> {

  String url = "";
  bool loading = false;
  double progress = 0;
  late final WebViewController controller;
  String fileText="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFFFFFFF))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            print("Mano");
          },

          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            print(error);
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith( Uri.dataFromString(
                '<html lang="en"><head><meta charset="UTF-8"> <meta http-equiv="X-UA-Compatible" content="IE=edge"> <meta name="viewport" content="width=device-width, initial-scale=1.0"> <title>loader</title> <style> .loader { display: block; justify-content: center; } .bar { width: 7px; height: 18px; margin: 0 9px; border-radius: 10px; animation: loading_5192 1s ease-in-out infinite; background-color: aqua; } .bar:nth-child(1) { animation-delay: 0.01s; } .bar:nth-child(2) { animation-delay: 0.09s; } .bar:nth-child(3) { animation-delay: 0.19s; } .bar:nth-child(4) { animation-delay: 0.29s; } @keyframes loading_5192 { 0% { transform: scale(1); } 20% { transform: scale(1, 2.5); } 40% { transform: scale(1); } } .jelly { --uib-size: 40px; --uib-speed: .8s; --uib-color: #2c2b2b; position: fixed; height: calc(var(--uib-size) / 2); top: 50%; left: 50%; width: var(--uib-size); animation: rotate72317 calc(var(--uib-speed) * 2) linear infinite; } .jelly::before, .jelly::after { content: ''; position: absolute; top: 0%; left: 25%; width: 50%; height: 100%; background: var(--uib-color); border-radius: 100%; } .jelly::before { animation: shift-left var(--uib-speed) ease infinite; } .jelly::after { animation: shift-right var(--uib-speed) ease infinite; } .container { width: 50; margin-left: auto; margin-right: auto; } .jelly-maker { width: 0; height: 0; position: absolute; } @keyframes rotate72317 { 0%, 49.999%, 100% { transform: none; } 50%, 99.999% { transform: rotate(90deg); } } @keyframes shift-left { 0%, 100% { transform: translateX(0%); } 50% { transform: scale(0.65) translateX(-75%); } } @keyframes shift-right { 0%, 100% { transform: translateX(0%); } 50% { transform: scale(0.65) translateX(75%); } } </style> </head> <body> <div class="container"> <div class="jelly center"> <svg width="0" height="0" class="jelly-maker"> <defs> </defs> </svg> </div> </div> </body> </html>',
                mimeType: 'text/html')
                .toString(),)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse( Uri.dataFromString(
          '<html lang="en"><head><meta charset="UTF-8"> <meta http-equiv="X-UA-Compatible" content="IE=edge"> <meta name="viewport" content="width=device-width, initial-scale=1.0"> <title>loader</title> <style> .loader { display: block; justify-content: center; } .bar { width: 7px; height: 18px; margin: 0 9px; border-radius: 10px; animation: loading_5192 1s ease-in-out infinite; background-color: aqua; } .bar:nth-child(1) { animation-delay: 0.01s; } .bar:nth-child(2) { animation-delay: 0.09s; } .bar:nth-child(3) { animation-delay: 0.19s; } .bar:nth-child(4) { animation-delay: 0.29s; } @keyframes loading_5192 { 0% { transform: scale(1); } 20% { transform: scale(1, 2.5); } 40% { transform: scale(1); } } .jelly { --uib-size: 40px; --uib-speed: .8s; --uib-color: #2c2b2b; position: fixed; height: calc(var(--uib-size) / 2); top: 50%; left: 50%; width: var(--uib-size); animation: rotate72317 calc(var(--uib-speed) * 2) linear infinite; } .jelly::before, .jelly::after { content: ''; position: absolute; top: 0%; left: 25%; width: 50%; height: 100%; background: var(--uib-color); border-radius: 100%; } .jelly::before { animation: shift-left var(--uib-speed) ease infinite; } .jelly::after { animation: shift-right var(--uib-speed) ease infinite; } .container { width: 50; margin-left: auto; margin-right: auto; } .jelly-maker { width: 0; height: 0; position: absolute; } @keyframes rotate72317 { 0%, 49.999%, 100% { transform: none; } 50%, 99.999% { transform: rotate(90deg); } } @keyframes shift-left { 0%, 100% { transform: translateX(0%); } 50% { transform: scale(0.65) translateX(-75%); } } @keyframes shift-right { 0%, 100% { transform: translateX(0%); } 50% { transform: scale(0.65) translateX(75%); } } </style> </head> <body> <div class="container"> <div class="jelly center"> <svg width="0" height="0" class="jelly-maker"> <defs> </defs> </svg> </div> </div> </body> </html>',
          mimeType: 'text/html')
          .toString(),));
    //loading=true;

    print(fileText);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,


        body:Container(

            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,

            child: Center(
              child: Container(
                width: 150.0,
                height: 150.0,
                child:  WebViewWidget(
                  controller: controller,


                ),
              ),
            )
        )
    );
  }
}
