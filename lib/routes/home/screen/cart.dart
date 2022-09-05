import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_store/models/index.dart';

class CartDisplayModel {
  final Cart item;
  final bool selected;

  CartDisplayModel({required this.item, required this.selected});
}

class CartSreen extends StatefulWidget {
  const CartSreen({Key? key}) : super(key: key);

  @override
  State<CartSreen> createState() => _CartSreenState();
}

class _CartSreenState extends State<CartSreen> {
  //购物车数据服务
  // CartService _cartService = CartService();
  //购物车列表数据
  late List<CartDisplayModel> _cartList;
  //是否登录
  bool _isLogin = false;
  //是否全选
  bool _isAllCheck = false;
  //是否全都不选
  bool _isAllNotCheck = false;
  //总计
  late double _totalMoney;
  //token
  // var token;
  //获取当前查询购物车中选中的商品数量
  var _checkedGoodsAmount;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //监听刷新事件
    _listener();
    _refreshEvent();
    return _isLogin == true
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("购物车"),
            ),
            body: _cartList.isEmpty
                ? Container(
                    padding: const EdgeInsets.only(top: 70),
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            "images/emptycar.png",
                            width: 135,
                            height: 135,
                          ),
                          const SizedBox(
                            height: 46,
                          ),
                          const Text(
                            "还没有添加任何商品，快去选购吧！",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black26),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.blue,
                                    Colors.yellow,
                                  ],
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                ),
                                borderRadius: BorderRadius.circular(150),
                              ),
                              child: const Text(
                                "去逛逛",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const Center())
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "购物车",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.lightBlueAccent,
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                // Container(
                //   alignment: Alignment.center,
                //   child: Image.asset(
                //     "images/wukong.png",
                //     height: 60,
                //     width: double.infinity,
                //   ),
                // ),
                const Center(
                  child: Text("还没有登录哦"),
                ),
                GestureDetector(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                      // child:
                      //   GradientButton("去登录", 0xFFFF9E00, 0xFFFF4800, () {
                      // NavigatorUtil.goLogin(context);
                      // },
                      // textSize: 18, textColor: 0xFFFEFEFE),
                    ))
              ],
            ),
          );
  }

  _listener() {
    //初始化的时候监听是否登录
    // loginEventBus.on<LoginEvent>().listen((LoginEvent loginEvent) {
    //   print("购物车页面是否判定登录");
    //   setState(() {
    //     _isLogin = loginEvent.isLogin;
    //   });
    // });
  }

//监听刷新事件,当用户从商品详情页面点击添加至购物车时会触发刷新事件
  _refreshEvent() {
    //重新调用接口赋值
    // CarteventBus.on<RefreshEvent>().listen((RefreshEvent refreshEvent) {
    //   if (refreshEvent.isRefresh) {
    //     _getCartData(token);
    //   }
    // });
    // CarteventBus.fire(RefreshEvent(false));
  }

  //判断是否全部不选，如果有一个等于true就返回false
  bool _isNotSelectedAll() {
    //迭代循环购物车列表所有checked属性,当全部为true时为全选状态
    for (int i = 0; i < _cartList.length; i++) {
      if (_cartList[i].selected) {
        return false;
      }
    }
    return true;
  }

  //判断是否全选
  bool _isSelectedAll() {
    //迭代循环购物车列表所有checked属性,当全部为true时为全选状态
    for (int i = 0; i < _cartList.length; i++) {
      if (!_cartList[i].selected) {
        return false;
      }
    }
    return true;
  }
}
