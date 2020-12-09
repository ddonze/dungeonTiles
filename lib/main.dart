import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'dart:core';
import 'dart:ui';
import 'mazeGame.dart';
import 'dart:io';
import 'package:flutter/foundation.dart'
  show debugDefaultTargetPlatformOverride;
  
void main() async {
  if (Platform.isLinux || Platform.isWindows) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  await flameUtil.initialDimensions();
  runApp(
    MaterialApp(
      title: 'Tile Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color(0xff0b2b44),
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  MyApp({Key key,}) : super(key: key);
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MazeGame game;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    this.game = MazeGame(Rect.fromLTWH(0, 0, screenSize.width, screenSize.height));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.2, vertical: screenSize.height*0.2),
      width: double.infinity,
      height: double.infinity,
      child: game.widget,
    );
  }
}
