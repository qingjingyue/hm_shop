import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hm_shop/api/user.dart';
import 'package:hm_shop/pages/cart/index.dart';
import 'package:hm_shop/pages/category/index.dart';
import 'package:hm_shop/pages/home/index.dart';
import 'package:hm_shop/pages/mine/index.dart';
import 'package:hm_shop/stores/TokenManager.dart';
import 'package:hm_shop/stores/UserController.dart';
import 'package:hm_shop/types/user.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 定义底部导航栏数据
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/assets/ic_public_home_normal.png", //正常显示图标
      "active_icon": "lib/assets/ic_public_home_active.png", // 激活显示图标
      "text": "首页",
    },
    {
      "icon": "lib/assets/ic_public_pro_normal.png", //正常显示图标
      "active_icon": "lib/assets/ic_public_pro_active.png", // 激活显示图标
      "text": "分类",
    },
    {
      "icon": "lib/assets/ic_public_cart_normal.png", //正常显示图标
      "active_icon": "lib/assets/ic_public_cart_active.png", // 激活显示图标
      "text": "购物车",
    },
    {
      "icon": "lib/assets/ic_public_my_normal.png", //正常显示图标
      "active_icon": "lib/assets/ic_public_my_active.png", // 激活显示图标
      "text": "我的",
    },
  ];

  // 定义当前选中的索引
  int _currentIndex = 0;

  List<BottomNavigationBarItem> _getTabBarWidget() {
    return _tabList.map((item) {
      return BottomNavigationBarItem(
        icon: Image.asset(item["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(item["active_icon"]!, width: 30, height: 30),
        label: item["text"],
      );
    }).toList();
  }

  // 定义页面列表
  List<Widget> _getChildren() {
    return [
      const HomeView(),
      const CategoryView(),
      const CartView(),
      const MineView(),
    ];
  }

  @override
  void initState() {
    super.initState();
    // 初始化时获取用户信息
    _initUser();
  }

  final UserController _userController = Get.put(UserController());

  // 初始化用户信息
  Future<void> _initUser() async {
    await tokenManager.init();
    UserInfo userInfo = await getUserInfoAPI();
    _userController.updateUserInfo(userInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea避开安全区组件
      body: SafeArea(
        // IndexedStack根据当前索引显示对应的页面
        child: IndexedStack(index: _currentIndex, children: _getChildren()),
      ),
      // 实现底部导航栏切换
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
        items: _getTabBarWidget(),
        // 选中项颜色
        selectedItemColor: Colors.black,
        // 未选中项是否显示Label
        showUnselectedLabels: true,
        // 未选中项颜色
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
