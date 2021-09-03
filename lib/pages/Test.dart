import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class Test extends StatefulWidget {
  final String instrumentName;
  final String instrumentType;

  Test({Key key, this.instrumentName, this.instrumentType});
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  UnityWidgetController _unityWidgetController;
  double _sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _unityWidgetController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("AR " + widget.instrumentName),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: Text("Hai"),
              height: 300,
            ),
            UnityWidget(
              onUnityCreated: onUnityCreated,
              onUnityMessage: onUnityMessage,
              onUnitySceneLoaded: onUnitySceneLoaded,
              fullscreen: false,
            ),
          ],
        ),
      ),
      onWillPop: () async {
        this._unityWidgetController.pause();
        Navigator.of(context).pop();
        return true;
      },
    );
  }

  // Communcation from Flutter to Unity
  void setRotationSpeed(String speed) {
    _unityWidgetController.postMessage(
      'Cube',
      'SetRotationSpeed',
      speed,
    );
  }

  // Communication from Unity to Flutter
  void onUnityMessage(message) {
    print('Received message from unity: ${message.toString()}');
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) async {
    this._unityWidgetController = controller;
    final bool isReady = await this._unityWidgetController.isReady();
    if (isReady) {
      bool isPaused = await this._unityWidgetController.isPaused();
      if (isPaused) {
        await this._unityWidgetController.resume();
      }
      String sceneName =
          widget.instrumentName.split(" ")[0] + widget.instrumentType;

      controller.postMessage('Wrapper', 'Move', sceneName);
    }
    log("\n\n\n " + isReady.toString() + "\n\n\n");
  }

  // Communication from Unity when new scene is loaded to Flutter
  void onUnitySceneLoaded(SceneLoaded sceneInfo) {
    print('Received scene loaded from unity: ${sceneInfo.name}');
    print(
        'Received scene loaded from unity buildIndex: ${sceneInfo.buildIndex}');
  }

  void onUnityUnloaded() {
    this._unityWidgetController.pause();
  }
}
