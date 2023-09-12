import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class WebviewShowerScreen extends StatefulWidget {
  const WebviewShowerScreen({super.key});

  @override
  State<WebviewShowerScreen> createState() => _WebviewShowerScreenState();
}

class _WebviewShowerScreenState extends State<WebviewShowerScreen> {
  String _htmlText = '';
  String _inputValue = '';

  // TODO: Web and Desktop errors related with this line of code below!!!
  var asdf = WebViewPlatform.instance;

  WebViewController webViewController = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.disabled)
  ..loadRequest(Uri.parse('https://www.pub.dev'))
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  );

  String getPlatform() {
    if (kIsWeb) {
      return 'Web';
    } else {
      return '${Platform.operatingSystem}';
    }
  }

  Future<void> _loadHtmlPage() async {
    print('Helloy');
    // final result = await http.get(Uri.parse('https://flutter.dev/'));
    final result = await http.get(Uri.parse(_inputValue));
    setState(() {
      _htmlText = result.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Build apps for any screen',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const Text(
                    'CORS Header: None',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 200,
                    // TODO: Experiment with height of Webview widget
                    width: MediaQuery.of(context).size.width,
                    child: WebViewWidget(
                      controller: webViewController,
                    )
                  ),             
                ],
              ),
            ),

            // Text Field Container
            Align(
              alignment: Alignment.bottomCenter,
              child: IntrinsicHeight(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      // TextField
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: (String value) {
                                setState(() {
                                  _inputValue = value;
                                });
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(width: 2, color: Colors.black)
                                )
                              ),
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: ElevatedButton(
                              onPressed: () {
                                _loadHtmlPage();
                              },
                              child: Text('LOAD')
                            ),
                          ),
                        ],
                      ),

                      // Device Platform
                      Text(
                        // 'APPLICATION RUNNING ON ${Platform.operatingSystem}',
                        'APPLICATION RUNNING ON ${getPlatform()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _loadHtmlPage,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}