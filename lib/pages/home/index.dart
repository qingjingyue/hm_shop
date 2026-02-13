import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/home/HmCategory.dart';
import 'package:hm_shop/components/home/HmHot.dart';
import 'package:hm_shop/components/home/HmMoreList.dart';
import 'package:hm_shop/components/home/HmSlider.dart';
import 'package:hm_shop/components/home/HmSuggestion.dart';
import 'package:hm_shop/types/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<BannerItem> _bannerList;
  late List<CategoryItem> _categoryList;

  /// 获取轮播图列表
  void _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  /// 获取分类列表
  void _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // 初始化轮播图列表
    _getBannerList();
    // 初始化分类列表
    _getCategoryList();
  }

  /// 获取滚动子组件
  List<Widget> _getScrollChildren() {
    return [
      // slivers中需要使用Sliver家族的组件包裹非sliver组件
      // 轮播图
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 分类
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 推荐
      SliverToBoxAdapter(child: HmSuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 爆款
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()),
              SizedBox(width: 10),
              Expanded(child: HmHot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 更多
      HmMoreList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
