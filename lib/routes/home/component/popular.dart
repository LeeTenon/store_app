import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter_store/models/index.dart';
import 'package:flutter_store/models/product_popular/product_popular.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopularList extends StatefulWidget {
  const PopularList({Key? key}) : super(key: key);

  @override
  State<PopularList> createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
  Dio dio = Dio();

  final List<Map<String, dynamic>> _items = List.generate(
    10,
    (index) => {
      "id": index,
      "title": "Item $index",
      "height": Random().nextInt(150) + 50.5
    },
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Dio().get("http://10.0.2.2:7999/v1/product/popular"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasError) {
            Map<String, dynamic> tmp = jsonDecode(snapshot.data.toString());
            var productList = ProductPopular.fromJson(tmp);
            var list = productList.productList!;
            return Center(
              child: MasonryGridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.length,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blue,
                    key: ValueKey(list[index].pid),
                    child: SizedBox(
                      height: 200,
                      child: Stack(fit: StackFit.expand, children: [
                        Text(list[index].title!),
                        Image.network(
                          list[index].coverUrl!,
                          fit: BoxFit.cover,
                        )
                      ]),
                    ),
                  );
                },
              ),
            );
          } else {
            Fluttertoast.showToast(msg: snapshot.error.toString());
          }
        }
        return const Text("无数据");
      },
    );
  }
}
