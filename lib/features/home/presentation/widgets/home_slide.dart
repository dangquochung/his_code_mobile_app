import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vnpt_his/gen/assets.gen.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({
    Key? key,
    this.height = 244,
    this.autoPlayInterval = const Duration(seconds: 3),
  }) : super(key: key);

  final double height;
  final Duration autoPlayInterval;

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  late PageController _pageController;
  Timer? _timer;
  int _currentPage = 0;
  bool _isForward = true;

  final List<String> images = [
    Assets.images.home.defaultSlide1.path,
    Assets.images.home.defaultSlide2.path,
    Assets.images.home.defaultSlide3.path,
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7);
    _startAutoPlay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(widget.autoPlayInterval, (timer) {
      if (_currentPage == images.length - 1) {
        _isForward = false;
      } else if (_currentPage == 0) {
        _isForward = true;
      }

      if (_isForward) {
        _currentPage++;
      } else {
        _currentPage--;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              double scale = _currentPage == index ? 1.0 : 0.85;
              double opacity = _currentPage == index ? 1.0 : 0.6;

              return Transform.scale(
                scale: scale,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: opacity,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: const Color.fromARGB(25, 0, 0, 0),
                      //     blurRadius: 8,
                      //     offset: const Offset(0, 2),
                      //   ),
                      // ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: FittedBox( // Đảm bảo ảnh không bị cắt
                        fit: BoxFit.contain, 
                        child: Image.asset(
                          images[index],
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}