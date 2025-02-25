import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:vnpt_his/core/common/widgets/base_loading_widget.dart';

class IOSWebViewPage extends StatefulWidget {
  final String url;
  final String title;

  const IOSWebViewPage({required this.url, required this.title, Key? key})
      : super(key: key);

  @override
  _IOSWebViewPageState createState() => _IOSWebViewPageState();
}

class _IOSWebViewPageState extends State<IOSWebViewPage> {
  late InAppWebViewController webViewController;
  bool isLoading = true; // Trạng thái loading
  final InAppWebViewSettings settings = InAppWebViewSettings(
    cacheEnabled: true,
    useShouldInterceptRequest: true,
    transparentBackground: true,
    javaScriptEnabled: true,
    domStorageEnabled: true,
    clearCache: false,
    allowsBackForwardNavigationGestures: true,
    allowsInlineMediaPlayback: true,
    mediaPlaybackRequiresUserGesture: false,
    forceDark: ForceDark.OFF,
    cacheMode: CacheMode.LOAD_CACHE_ELSE_NETWORK,
    useOnLoadResource: true,
    useOnDownloadStart: true,
  );

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(233, 244, 255, 1),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => webViewController.reload(),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(color: Color.fromRGBO(233, 244, 255, 1)),
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
            initialSettings: settings,
            onLoadStart: (controller, url) {
              setState(() => isLoading = true);
            },
            onLoadStop: (controller, url) {
              setState(() => isLoading = false);
            },
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
          ),
          // Hiển thị animation loading nếu đang tải
          if (isLoading)
            Positioned(
              top: screenHeight / 2 - 150,
              left: 0,
              right: 0,
              child: BaseLoadingWidget(),
            ),
        ],
      ),
    );
  }
}
