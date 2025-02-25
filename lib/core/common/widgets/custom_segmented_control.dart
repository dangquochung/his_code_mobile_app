import 'package:flutter/material.dart';

class CustomSegmentedControl extends StatefulWidget {
  final List<String> tabs;
  final Function(int) onTabSelected;
  final double tabHeight;
  final double tabWidth;
  final Color activeColor;
  final Color inactiveColor;

  const CustomSegmentedControl({
    Key? key,
    required this.tabs,
    required this.onTabSelected,
    this.tabHeight = 32.0,
    this.tabWidth = 110.0, // Chiều dài của mỗi tab có thể tuỳ chỉnh
    this.activeColor = const Color.fromRGBO(63, 138, 205, 1),
    this.inactiveColor = Colors.white,
  }) : super(key: key);

  @override
  _CustomSegmentedControlState createState() => _CustomSegmentedControlState();
}

class _CustomSegmentedControlState extends State<CustomSegmentedControl> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Cho phép cuộn ngang nếu cần
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(widget.tabs.length, (index) {
            final bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.onTabSelected(index);
              },
              child: Container(
                height: widget.tabHeight,
                width: widget.tabWidth, // Sử dụng chiều rộng tuỳ chỉnh
                margin: EdgeInsets.only(
                    right: index != widget.tabs.length - 1
                        ? 8.0
                        : 0), // Khoảng cách giữa các tab
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? widget.activeColor : widget.inactiveColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  widget.tabs[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : widget.activeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
