import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tencent_open_file/tencent_open_file.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _openResult = 'Unknown';

  Future<void> openFile() async {
    final filePath = '/Users/wangrunlin/Library/Developer/CoreSimulator/Devices/D5CE0385-9B66-4203-B5F7-1EDECB03C278/data/Containers/Data/Application/254EB815-49E5-43EB-9BDA-4E9217B67FDF/Documents/Simulator\ Screen\ Shot\ -\ iPhone\ 14\ Pro\ -\ 2022-11-14\ at\ 16.36.45.png';
    getApplicationDocumentsDirectory().then((value) => print(value));
    final result = await OpenFile.open(filePath);

    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('open result: $_openResult\n'),
              TextButton(
                child: Text('Tap to open file'),
                onPressed: openFile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
