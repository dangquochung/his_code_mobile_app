// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:vnpt_his/core/common/widgets/custom_appbar_webview.dart';
// import 'package:vnpt_his/core/common/widgets/custom_webview_url.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewPage extends StatefulWidget {
//   final String baseUrl;
//   final String initialPath;
//   final Map<String, String>? additionalHeaders;

//   const WebViewPage({
//     Key? key,
//     required this.baseUrl,
//     this.initialPath = '',
//     this.additionalHeaders,
//   }) : super(key: key);

//   @override
//   _WebViewPageState createState() => _WebViewPageState();
// }

// class _WebViewPageState extends State<WebViewPage> {
//   late WebViewController _webViewController;

//   @override
//   void initState() {
//     super.initState();
//     _webViewController = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..addJavaScriptChannel(
//         'FlutterChannel',
//         onMessageReceived: (JavaScriptMessage message) {
//           print('Received message from web: ${message.message}');
          
//           // Parse the JSON message
//           final data = jsonDecode(message.message);
          
//           // Handle the message
//           _handleMessageFromWeb(data);
//         },
//       )
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageFinished: (String url) {
//             print('Page finished loading: $url');
//           },
//         ),
//       )
//       ..loadRequest(
//         Uri.parse('${widget.baseUrl}${widget.initialPath}'),
//         headers: widget.additionalHeaders ?? {},
//       );
//   }

//   void _handleMessageFromWeb(Map<String, dynamic> data) {
//     // Xử lý dữ liệu nhận từ trang web
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Message from Web: ${data['message']}')),
//     );
//   }

//   void _sendMessageToWeb(String message) {
//     // Sử dụng runJavaScript để gửi message đến web
//     _webViewController.runJavaScript(
//       "window.postMessage('$message', '*');"
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBarWebView(
//         title: 'WebView',
//         backgroundColor: Colors.green,
//         onSettingsPressed: () {
//           _webViewController.reload();
//         },
//         onClosePressed: () {
//           Navigator.of(context).pop();
//         },
//         onSendMessagePressed: () {
//           _sendMessageToWeb(jsonEncode({'message': 'Hello from Flutter!'}));
//         },
//       ),
//       body: WebViewWidget(
//         controller: _webViewController,
//       ),
//     );
//   }
// }