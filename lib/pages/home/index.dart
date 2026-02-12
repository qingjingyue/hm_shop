import 'package:flutter/material.dart';
import 'package:hm_shop/components/home/HmCategory.dart';
import 'package:hm_shop/components/home/HmHot.dart';
import 'package:hm_shop/components/home/HmMoreList.dart';
import 'package:hm_shop/components/home/HmSlider.dart';
import 'package:hm_shop/components/home/HmSuggestion.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _getScrollChildren() {
    return [
      // slivers中需要使用Sliver家族的组件包裹非sliver组件
      // 轮播图
      SliverToBoxAdapter(child: HmSlider()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      // 分类
      SliverToBoxAdapter(child: HmCategory()),
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
