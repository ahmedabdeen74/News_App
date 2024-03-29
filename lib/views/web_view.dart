import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewPage extends StatefulWidget {
  const WebViewPage({
    super.key,
    required this.article,
  });
  static String id = 'WebViewPage';
  final String article;
  @override
  State<WebViewPage> createState() => _WebViewPageState();
}
class _WebViewPageState extends State<WebViewPage> {
  WebViewController controller=WebViewController();
  @override
  void initState() {
    controller = WebViewController()..loadRequest(Uri.parse(widget.article));
    setState(() {});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WebViewWidget(controller: controller),
    );
  }
}
