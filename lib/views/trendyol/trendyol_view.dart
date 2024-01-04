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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Scrollbar(
              controller: ScrollController(),
              radius: const Radius.circular(18),
              thickness: 3,
              interactive: true,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: WebViewWidget(controller: controller))),
        ),
      ),
    );
  }
}
