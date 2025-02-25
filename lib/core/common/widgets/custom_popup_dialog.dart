import 'package:flutter/material.dart';

class CustomPopupDialog extends StatelessWidget {
  final String title;
  final String? content;
  final String confirmText;
  final VoidCallback? onConfirm;
  final Color? titleColor;
  final Color? contentColor;
  final Color? confirmButtonColor;

  const CustomPopupDialog({
    Key? key,
    required this.title,
    this.content,
    this.confirmText = 'Xác Nhận',
    this.onConfirm,
    this.titleColor,
    this.contentColor,
    this.confirmButtonColor,
  }) : super(key: key);

  // Phương thức hiển thị dialog một cách dễ dàng
  static Future<void> show(
    BuildContext context, {
    required String title,
    String? content,
    String confirmText = 'Xác Nhận',
    VoidCallback? onConfirm,
    Color? titleColor,
    Color? contentColor,
    Color? confirmButtonColor,
  }) {
    return showDialog(
      context: context,
      builder: (context) => CustomPopupDialog(
        title: title,
        content: content,
        confirmText: confirmText,
        onConfirm: onConfirm,
        titleColor: titleColor,
        contentColor: contentColor,
        confirmButtonColor: confirmButtonColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Tiêu đề
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: titleColor ?? Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            
            // Nội dung (nếu có)
            if (content != null) ...[
              const SizedBox(height: 15),
              Text(
                content!,
                style: TextStyle(
                  fontSize: 16,
                  color: contentColor ?? Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ],
            
            // Khoảng cách
            const SizedBox(height: 20),
            
            // Nút Xác Nhận
            ElevatedButton(
              onPressed: () {
                // Gọi callback nếu có, sau đó đóng dialog
                onConfirm?.call();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: confirmButtonColor ?? Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                confirmText,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}