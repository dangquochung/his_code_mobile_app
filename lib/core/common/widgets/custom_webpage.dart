// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:vnpt_his/core/common/widgets/custom_appbar_webview.dart';
// import 'package:vnpt_his/core/common/widgets/custom_popup_dialog.dart';
// import 'package:vnpt_his/presentation/features/home/home_features/home_hen_kham/model/user_hen_kham.dart';
// import 'package:vnpt_his/presentation/features/navigation/navigation_view.dart';
// import 'package:vnpt_his/presentation/features/navigation/navigation_view_model.dart';
// import 'package:vnpt_his/presentation/features/setting/setting_view_model.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

// class WebViewPage extends ConsumerStatefulWidget {
//   final String baseUrl;
//   final String initialPath;
//   final Map<String, String>? additionalHeaders;
//   final Function(WebViewController)? onWebViewCreated;

//   const WebViewPage({
//     Key? key,
//     required this.baseUrl,
//     this.initialPath = '',
//     this.additionalHeaders,
//     this.onWebViewCreated,
//   }) : super(key: key);

//   @override
//   ConsumerState<WebViewPage> createState() => _WebViewPageState();
// }

// class _WebViewPageState extends ConsumerState<WebViewPage> {
//   late WebViewController _webViewController;
//   late User _currentUser;

//   @override
//   void initState() {
//     super.initState();

//     _currentUser = User(
//       hoTen: 'Vũ Ngọc Huyền',
//       gioiTinh: '0',
//       ngaySinh: '1996-02-16',
//       soDienThoai: '0979314935',
//       diaChi: 'Số 10 Đường ABC, Phường XYZ, Quận 1, TP.HCM',
//     );

//     _webViewController = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..addJavaScriptChannel(
//         'FlutterChannel',
//         onMessageReceived: (JavaScriptMessage message) {
//           try {
//             final data = jsonDecode(message.message);
//             _handleMessageFromWeb(data);
//           } catch (e) {
//             print('Error parsing message from web: $e');
//           }
//         },
//       )
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageFinished: (String url) {
//             print('Page finished loading: $url');
//             _sendUserToWeb();
//             _sendModeToWeb();
//           },
//         ),
//       )
//       ..loadRequest(
//         Uri.parse('${widget.baseUrl}${widget.initialPath}'),
//         headers: widget.additionalHeaders ?? {},
//       );

//     if (widget.onWebViewCreated != null) {
//       widget.onWebViewCreated!(_webViewController);
//     }
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _sendUserToWeb();
//     _sendModeToWeb();
//   }

//   void _sendModeToWeb() {
//     final isDarkMode = ref.read(profileViewModelProvider).darkMode;

//     final modeMessage = {
//       "type": "darkMode",
//       "data": isDarkMode ? "1" : "0",
//     };

//     print("window.postMessage(${jsonEncode(modeMessage)}, '*');");

//     _webViewController.runJavaScript(
//       "window.postMessage(${jsonEncode(modeMessage)}, '*');",
//     );
//   }

//   void _sendUserToWeb() {
//     final userMessage = {"type": "duLieu", "data": _currentUser.toJson()};

//     print("window.postMessage(${jsonEncode(userMessage)}, '*');");

//     _webViewController.runJavaScript(
//       "window.postMessage(${jsonEncode(userMessage)}, '*');",
//     );
//   }

//   void _createHomeShortcut(BuildContext context) async {
//     String? currentUrl = await _webViewController.currentUrl();

//     if (currentUrl != null && currentUrl.isNotEmpty) {
//       final Uri url = Uri.parse(currentUrl);

//       if (await canLaunchUrl(url)) {
//         await launchUrl(
//           url,
//           mode: LaunchMode.externalApplication,
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Không thể mở URL: $currentUrl')),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Không tìm thấy URL hiện tại')),
//       );
//     }
//   }

//   void _handleMessageFromWeb(Map<String, dynamic> data) {
//     if (data['message'] is Map<String, dynamic>) {
//       final messageData = data['message'];
//       String popupContent = '''
// Thông tin đặt khám:
// - Họ tên: ${messageData['hoTen'] ?? 'Không có'}
// - Giới tính: ${messageData['gioiTinh'] == '1' ? 'Nam' : 'Nữ'}
// - Ngày sinh: ${messageData['ngaySinh'] ?? 'Không có'}
// - Số điện thoại: ${messageData['soDienThoai'] ?? 'Không có'}
// - Địa chỉ: ${messageData['diaChi'] ?? 'Không có'}
// - Phòng khám: ${messageData['phongKham'] ?? 'Không có'}
// ''';

//       CustomPopupDialog.show(
//         context,
//         title: 'Hẹn khám thành công!',
//         content: popupContent,
//         confirmText: 'Xác nhận',
//         titleColor: Colors.green,
//         onConfirm: () {
//           print('Popup đặt khám đã được đóng');
//         },
//       );
//     } else {
//       CustomPopupDialog.show(
//         context,
//         title: 'Lỗi',
//         content: 'Không thể hiển thị thông tin đặt khám',
//         confirmText: 'Đóng',
//         titleColor: Colors.red,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBarWebView(
//         title: 'WebView User Info',
//         backgroundColor: Colors.green,
//         onSettingsPressed: () => _webViewController.reload(),
//         onClosePressed: () {
//           ref
//               .read(navigationProvider.notifier)
//               .setSelectedIndex(NavigationView.homeIndex);
//         },
//         onSendMessagePressed: _sendUserToWeb,
//         onCreateShortcut: () => _createHomeShortcut(context),
//       ),
//       body: WebViewWidget(controller: _webViewController),
//     );
//   }
// }
