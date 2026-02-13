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
  /// 轮播图列表
  List<BannerItem> _bannerList = [];

  /// 获取轮播图列表
  void _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  /// 分类列表
  List<CategoryItem> _categoryList = [];

  /// 获取分类列表
  void _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  /// 特惠推荐
  Product _product = Product(id: "", title: "", subTypes: []);

  /// 获取特惠推荐
  void _getProduct() async {
    _product = await getProductListAPI();
    setState(() {});
  }

  /// 热榜推荐
  Product _inVogue = Product(id: "", title: "", subTypes: []);

  /// 获取热榜推荐
  void _getInVogue() async {
    _inVogue = await getInVogueListAPI();
    setState(() {});
  }

  /// 一站式推荐
  Product _oneStop = Product(id: "", title: "", subTypes: []);

  /// 获取一站式推荐
  void _getOneStop() async {
    _oneStop = await getOneStopListAPI();
    setState(() {});
  }

  // 更多推荐列表
  List<GoodDetailItem> _recommendList = [];

  // 获取更多推荐列表
  void _getRecommendList() async {
    _recommendList = await getRecommendListAPI({"limit": 10});
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // 初始化轮播图列表
    _getBannerList();
    // 初始化分类列表
    _getCategoryList();
    // 初始化特惠推荐
    _getProduct();
    // 初始化热榜推荐
    _getInVogue();
    // 初始化一站式推荐
    _getOneStop();
    // 初始化推荐列表
    _getRecommendList();
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
      SliverToBoxAdapter(child: HmSuggestion(product: _product)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 爆款
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: HmHot(product: _inVogue, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: HmHot(product: _oneStop, type: "step"),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 更多, 无限滚动列表
      HmMoreList(recommendList: _recommendList),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
