import 'package:flutter/material.dart';
import 'package:flutter_store/mocks/page_run.dart';
import 'package:flutter_store/routes/home/component/popular.dart';
import '../component/page_run.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight * 1),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
        title: SizedBox(
          height: 40,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: TextField(
              onChanged: (String txt) {},
              style: const TextStyle(
                fontSize: 15,
              ),
              // cursorColor: HotelAppTheme.buildLightTheme().primaryColor,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade300,
                filled: true,
                prefixIcon: const Icon(Icons.search),
                contentPadding:
                    const EdgeInsets.only(top: 0, bottom: 0, left: 20),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide.none,
                ),
                hintText: '搜索',
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/Notification.svg"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      // padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Carousel(items: heroes, height: 250.0),
          const PopularList(),
        ],
      ),
    );
  }
}
