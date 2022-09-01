import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_store/routes/home/components/popular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../home/components/page_run.dart';
import '../../../mocks/page_run.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/icons/menu.svg"),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/Location.svg"),
          const SizedBox(width: 20),
          Text(
            "15/2 New Texas",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/Notification.svg"),
          onPressed: () {},
        ),
      ],
    );
  }

  SingleChildScrollView body() {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      // padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Carousel(items: heroes, height: 250.0),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: const [
                PopularList(),
                ],
            ),
          )
          // const NewArrivalProducts(),
          // const PopularProducts(),
        ],
      ),
    );
  }
}

class PopularList extends StatefulWidget {
  const PopularList({Key? key}) : super(key: key);

  @override
  State<PopularList> createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
  final List<Map<String, dynamic>> _items = List.generate(
    10,
    (index) => {
      "id": index,
      "title": "Item $index",
      "height": Random().nextInt(150) + 50.5
    },
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MasonryGridView.count(
        shrinkWrap: true,
        itemCount: _items.length,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        // the number of columns
        crossAxisCount: 2,
        // vertical gap between two items
        mainAxisSpacing: 4,
        // horizontal gap between two items
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue,
            key: ValueKey(_items[index]['id']),
            child: SizedBox(
              height: _items[index]['height'],
              child: Center(
                child: Text(_items[index]['title']),
              ),
            ),
          );
        },
      ),
    );
  }
}
