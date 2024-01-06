import 'package:abdullatifcase/views/trendyol/mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TrendyolView extends StatefulWidget {
  const TrendyolView({super.key});

  @override
  State<TrendyolView> createState() => _TrendyolViewState();
}

class _TrendyolViewState extends State<TrendyolView> with Trendyol {
  @override
  void initState() {
    //To close status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    super.initState();
    loadWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Scrollbar(
              controller: ScrollController(),
              radius: const Radius.circular(18),
              thickness: 3,
              interactive: true,
              child: WebViewWidget(controller: controller)),
          Positioned(
              child: Container(
            height: 100,
            width: 200,
            color: Colors.red,
          )),
        ],
      ),
    );
  }
}
