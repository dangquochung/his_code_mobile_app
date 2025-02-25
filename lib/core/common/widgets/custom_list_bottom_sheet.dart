import 'package:flutter/material.dart';

class CustomListBottomSheet {
  static void show({
    required BuildContext context,
    required String title,
    required List<String> options,
    required ValueChanged<String> onOptionSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // tùy chỉnh chiều cao
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 3 / 5, // Chiều cao bằng 3/5 màn hình
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.close, size: 24),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 24), // Để cân bằng với nút close
                  ],
                ),
              ),
              const Divider(height: 1, thickness: 1),
              // List item
              Expanded(
                child: ListView.separated(
                  itemCount: options.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        options[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(63, 138, 205, 1),
                        ),
                      ),
                      onTap: () {
                        onOptionSelected(options[index]);
                        Navigator.of(context)
                            .pop(); // Close sheet after select
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
