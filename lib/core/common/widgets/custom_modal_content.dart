import 'package:flutter/material.dart';

class ModalContent extends StatelessWidget {
  final VoidCallback? onReload;
  final VoidCallback? onCreateShortcut;
  const ModalContent({Key? key, this.onReload, this.onCreateShortcut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.0,
            shrinkWrap: true,
            children: [
              _buildGridItem(
                icon: Icons.qr_code,
                title: 'Mã QR',
                onTap: () {
                  // Xử lý khi bấm vào "Mã QR"
                },
              ),
              _buildGridItem(
                icon: Icons.add_box,
                title: 'Tạo phím tắt',
                onTap: onCreateShortcut ?? () {},

              ),
              _buildGridItem(
                icon: Icons.favorite,
                title: 'Yêu thích',
                onTap: () {
                  // Xử lý khi bấm vào "Yêu thích"
                },
              ),
              _buildGridItem(
                icon: Icons.security,
                title: 'Quản lý quyền',
                onTap: () {
                  // Xử lý khi bấm vào "Quản lý quyền"
                },
              ),
              _buildGridItem(
                icon: Icons.refresh,
                title: 'Tải lại',
                onTap: onReload ?? () {}, // Gọi callback reload WebView
              ),
              _buildGridItem(
                icon: Icons.arrow_upward,
                title: 'Thu nhỏ',
                onTap: () {
                  // Xử lý khi bấm vào "Thu nhỏ"
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildCloseButton(context),
        ],
      ),
    );
  }

  Widget _buildGridItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(231, 231, 231, 1),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: const Color.fromRGBO(63, 138, 205, 1), width: 1.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32.0,
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCloseButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          padding: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop(); // Đóng modal
        },
        child: const Text(
          'Đóng',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}