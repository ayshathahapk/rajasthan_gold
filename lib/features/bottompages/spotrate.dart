import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SpotRate extends StatefulWidget {
  const SpotRate({super.key});

  @override
  State<SpotRate> createState() => _SporRateState();
}

class _SporRateState extends State<SpotRate> {
  double _progress=0;
  final uri = Uri.parse("https://aurifyae.github.io/Rajasthan-Gold-App/");
  late InAppWebViewController inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri.uri(uri),
              ),
              onWebViewCreated: (controller) {
                inAppWebViewController = controller;
              },
              onProgressChanged: (controller, progress) {
                setState(() {
                  _progress = progress / 100;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
