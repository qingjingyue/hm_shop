import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/types/home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;

  const HmSlider({super.key, required this.bannerList});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  /// 获取轮播图
  Widget _getSlider() {
    // 在flutter中获取屏幕宽度
    final double screenWidth = MediaQuery.of(context).size.width;
    // 返回轮播图插件
    return CarouselSlider(
      items: widget.bannerList.map((item) {
        return Image.network(
          item.imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }).toList(),
      options: CarouselOptions(
        height: 300,
        // 图片与屏幕的宽度比例
        viewportFraction: 1,
        // 自动播放
        autoPlay: true,
        // 自动播放间隔
        autoPlayInterval: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Stack -> 轮播图, 指示器, 搜索框
    return Stack(children: [_getSlider()]);
  }
}
