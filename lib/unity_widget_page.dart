import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class unityWidgetPage extends StatelessWidget {
  const unityWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    UnityWidgetController? _unityWidgetController;

    void onUnityCreated(controller) {
      _unityWidgetController = controller;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Planta AR'),
      ),
      body: UnityWidget(
        onUnityCreated: onUnityCreated,
      ),
    );
  }
}
