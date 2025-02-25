import 'package:flutter/material.dart';

class CustomTabBarScreen extends StatefulWidget {
  final List<String> tabTitles;
  final List<Widget> tabContents;
  final ValueChanged<int>? onTabChanged;

  const CustomTabBarScreen({
    required this.tabTitles,
    required this.tabContents,
    this.onTabChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTabBarScreen> createState() => _CustomTabBarScreenState();
}

class _CustomTabBarScreenState extends State<CustomTabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabTitles.length, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        widget.onTabChanged?.call(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: constraints.maxWidth,
          child: Column(
            children: [
              Container(
                color: const Color.fromRGBO(63, 138, 205, 1),
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: const Color.fromRGBO(36, 98, 153, 1),
                  indicatorWeight: 8,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white54,
                  isScrollable: false,
                  labelPadding: EdgeInsets.zero, // Loại bỏ padding mặc định
                  tabs: widget.tabTitles.map((title) {
                    return Tab(
                      height: 48, // Tăng chiều cao tab để có thêm không gian
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Center(
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 13, // Giảm font size một chút
                              fontWeight: FontWeight.w700,
                              height: 1.1, // Giảm line height
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: widget.tabContents,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}