import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/Global.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  // static const loadingTag = "##loading##"; //表尾标记
  // var _items = <Repo>[Repo()..name = loadingTag];
  bool hasMore = true; //是否还有数据
  int page = 1; //当前请求的是第几页

  @override
  Widget build(BuildContext context) {
    List tabs = ["想法", "推荐", "热榜"];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TabBar(
            labelColor: Colors.grey[700],
            tabs: tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
        body: _buildBody(),
        // 构建主页面
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {},
              ),
              const SizedBox(), //中间位置空出
              IconButton(
                icon: const Icon(Icons.business),
                onPressed: () {},
              ),
            ], //均分底部导航栏横向空间
          ),
        ),
        floatingActionButton: IconButton(
            icon: const Icon(Icons.add), color: Colors.blue, onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [],
      ),
    );
  }

//已登录，则显示项目列表
//   return ListView.separated(
//     itemCount: _items.length,
//     itemBuilder: (context, index) {
//       //如果到了表尾
//       if (_items[index].name == loadingTag) {
//         //不足100条，继续获取数据
//         if (hasMore) {
//           //获取数据
//           _retrieveData();
//           //加载时显示loading
//           return Container(
//             padding: const EdgeInsets.all(16.0),
//             alignment: Alignment.center,
//             child: const SizedBox(
//               width: 24.0,
//               height: 24.0,
//               child: CircularProgressIndicator(strokeWidth: 2.0),
//             ),
//           );
//         } else {
//           //已经加载了100条数据，不再获取数据。
//           return Container(
//             alignment: Alignment.center,
//             padding: const EdgeInsets.all(16.0),
//             child: const Text(
//               "没有更多了",
//               style: TextStyle(color: Colors.grey),
//             ),
//           );
//         }
//       }
//       //显示单词列表项
//       return RepoItem(_items[index]);
//     },
//     separatorBuilder: (context, index) => const Divider(height: .0),
//   );
// }
// }
  static OutlineInputBorder inputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  );

  Form custom = Form(
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "搜索商品",
        filled: true,
        fillColor: Colors.white,
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        prefixIcon: Icon(Icons.search),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: SizedBox(
            height: 55,
            width: 55,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  )),
              child: const Icon(Icons.filter_vintage),
            ),
          ),
        ),
      ),
    ),
  );
}
