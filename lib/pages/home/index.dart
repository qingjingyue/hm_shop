import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/home/HmCategory.dart';
import 'package:hm_shop/components/home/HmHot.dart';
import 'package:hm_shop/components/home/HmMoreList.dart';
import 'package:hm_shop/components/home/HmSlider.dart';
import 'package:hm_shop/components/home/HmSuggestion.dart';
import 'package:hm_shop/types/home.dart';
import 'package:hm_shop/utils/ToastUtils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  /// 轮播图列表
  List<BannerItem> _bannerList = [];

  /// 获取轮播图列表
  Future<void> _getBannerList() async {
    _bannerList = await getBannerListAPI();
  }

  /// 分类列表
  List<CategoryItem> _categoryList = [];

  /// 获取分类列表
  Future<void> _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
  }

  /// 特惠推荐
  Product _product = Product(id: "", title: "", subTypes: []);

  /// 获取特惠推荐
  Future<void> _getProduct() async {
    _product = await getProductListAPI();
  }

  /// 热榜推荐
  Product _inVogue = Product(id: "", title: "", subTypes: []);

  /// 获取热榜推荐
  Future<void> _getInVogue() async {
    _inVogue = await getInVogueListAPI();
  }

  /// 一站式推荐
  Product _oneStop = Product(id: "", title: "", subTypes: []);

  /// 获取一站式推荐
  Future<void> _getOneStop() async {
    _oneStop = await getOneStopListAPI();
  }

  // 更多推荐列表
  List<GoodDetailItem> _recommendList = [];

  // 页码
  int _page = 1;

  // 每页数量
  final int _limit = 10;

  // 是否正在加载
  bool _isLoading = false;

  // 是否还有更多数据
  bool _hasMore = true;

  // 获取更多推荐列表
  Future<void> _getRecommendList() async {
    if (_isLoading || !_hasMore) return;
    _isLoading = true;
    int requestLimit = _page * _limit;
    _recommendList = await getRecommendListAPI({"limit": requestLimit});
    _isLoading = false;
    if (_recommendList.length < requestLimit) {
      _hasMore = false;
      return;
    }
    _page++;
  }

  @override
  void initState() {
    super.initState();
    // // 初始化轮播图列表
    // _getBannerList();
    // // 初始化分类列表
    // _getCategoryList();
    // // 初始化特惠推荐
    // _getProduct();
    // // 初始化热榜推荐
    // _getInVogue();
    // // 初始化一站式推荐
    // _getOneStop();
    // // 初始化推荐列表
    // _getRecommendList();
    // _onRefresh();
    Future.microtask(() => _refreshIndicatorKey.currentState?.show());
    // 注册滚动事件
    _registerEvent();
  }

  /// 下拉刷新
  Future<void> _onRefresh() async {
    // 重置数据
    _page = 1;
    _isLoading = false;
    _hasMore = true;
    // 重新获取数据
    await Future.wait([
      _getBannerList(),
      _getCategoryList(),
      _getProduct(),
      _getInVogue(),
      _getOneStop(),
      _getRecommendList(),
    ]);
    setState(() {});
    // 提示刷新成功
    ToastUtils.showToast(context, "刷新成功");
  }

  /// 监听滚动到底部事件
  void _registerEvent() {
    _scrollController.addListener(() {
      // pixels: 当前滚动位置
      // maxScrollExtent: 最大滚动位置
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 50) {
        // 加载更多
        _getRecommendList();
      }
    });
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

  final ScrollController _scrollController = ScrollController();

  // 绑定RefreshIndicator的key
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      // 下拉刷新
      onRefresh: _onRefresh,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: _getScrollChildren(),
      ),
    );
  }
}
