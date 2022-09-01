import 'package:flutter/material.dart';
import 'package:flutter_store/mocks/page_run.dart';

class PageRun extends StatefulWidget {
  const PageRun({Key? key}) : super(key: key);

  @override
  State<PageRun> createState() => _PageRunState();
}

class _PageRunState extends State<PageRun> {
  int _pageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            itemCount: 3,
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
        )
      ],
    );
  }

  _buildItem(activeIndex, index) {
    return Center(
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
        height: activeIndex == index ? 500.0 : 450.0,
        margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: heroes[index].color,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Stack(),
      ),
    );
  }
}
