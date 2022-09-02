import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final List items;
  final double height;

  const Carousel({
    Key? key,
    required this.items,
    required this.height,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _pageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.9,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            itemCount: widget.items.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _pageIndex = index;
              });
            },
            itemBuilder: (BuildContext ctx, int index) {
              return _buildItem(_pageIndex, index);
            },
          ),
        ),
        PageIndicator(_pageIndex, widget.items.length),
      ],
    );
  }

  _buildItem(activeIndex, index) {
    final items = widget.items;

    return Center(
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
        height: activeIndex == index ? 250.0 : 200.0,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: items[index].color,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Stack(),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentIndex;

  const PageIndicator(this.currentIndex, this.pageCount);

  Widget _indicator(bool isActive) {
    return Container(
      width: 6.0,
      height: 6.0,
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xff666a84) : const Color(0xffb9bcca),
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 3.0),
            blurRadius: 3.0,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < pageCount; i++) {
      indicators.add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildIndicators(),
    );
  }
}
