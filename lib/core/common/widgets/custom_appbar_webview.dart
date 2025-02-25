import 'package:flutter/material.dart';
import 'package:vnpt_his/core/common/widgets/custom_modal_view.dart';
import 'custom_modal_content.dart';

class CustomAppBarWebView extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? leadingText;
  final Color backgroundColor;
  final VoidCallback? onSettingsPressed;
  final VoidCallback? onClosePressed;
  final VoidCallback? onSendMessagePressed; 
  final VoidCallback? onCreateShortcut;

  const CustomAppBarWebView({
    Key? key,
    required this.title,
    this.leadingText,
    this.backgroundColor = Colors.green,
    this.onSettingsPressed,
    this.onClosePressed,
    this.onSendMessagePressed, 
    this.onCreateShortcut
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: null,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.message), // Biểu tượng gửi tin nhắn
          onPressed: onSendMessagePressed, // Hành động gửi tin nhắn
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 2 / 3,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16.0),
                ),
              ),
              builder: (BuildContext context) {
                return CustomModalView(
                  title: 'Web View', // Tiêu đề tùy chỉnh
                  content: ModalContent(
                    onReload: () {
                      Navigator.of(context).pop(); // Đóng modal trước khi reload
                      onSettingsPressed?.call();
                    },
                    onCreateShortcut: () {
                      onCreateShortcut?.call();
                    },
                  ),
                  onClose: () {
                    Navigator.of(context).pop(); // Đóng modal
                  },
                );
              },
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: onClosePressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}