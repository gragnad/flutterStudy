import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  String baseUrl;
  String title;
  WebViewPage({Key key, this.baseUrl, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WebViewPageState();

}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(),
     body: WebView(
       initialUrl: widget.baseUrl,
       javascriptMode: JavascriptMode.unrestricted,
     ),
   );
  }
}