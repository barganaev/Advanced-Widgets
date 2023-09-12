import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataShowerScreen extends StatefulWidget {
  const DataShowerScreen({super.key});

  @override
  State<DataShowerScreen> createState() => _DataShowerScreenState();
}

class _DataShowerScreenState extends State<DataShowerScreen> {
  String _htmlText = '';
  String _inputValue = '';

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
              child: Center(
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
                    Text(_htmlText),               
                  ],
                ),
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
            )
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