import 'package:flutter/material.dart';
import 'package:flutter_store/routes/home/components/page_run.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/categories.dart';

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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Explore",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
          ),
          const Text(
            "best Outfits for you",
            style: TextStyle(fontSize: 18),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            // child: SearchForm(),
          ),
          const PageRun(),
          const Categories(),
          // const NewArrivalProducts(),
          // const PopularProducts(),
        ],
      ),
    );
  }
}
