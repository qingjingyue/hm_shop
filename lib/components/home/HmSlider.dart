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
  /// 轮播图控制器
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  /// 轮播图索引
  int _currentIndex = 0;

  /// 获取轮播图
  Widget _getSlider() {
    // 在flutter中获取屏幕宽度
    final double screenWidth = MediaQuery.of(context).size.width;
    // 返回轮播图插件
    return CarouselSlider(
      carouselController: _carouselController,
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
        // 轮播图切换事件
        onPageChanged: (index, _) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }

  /// 获取轮播图指示器
  Widget _getDots() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.bannerList.length, (index) {
          return GestureDetector(
            onTap: () {
              _carouselController.animateToPage(index);
              _currentIndex = index;
              setState(() {});
            },
            // 使用带动画的Container
            child: AnimatedContainer(
              // 需要duration来指定动画时间
              duration: Duration(milliseconds: 300),
              width: _currentIndex == index ? 40 : 20,
              height: 6,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? Colors.white
                    : Color.fromRGBO(0, 0, 0, 0.3),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  /// 搜索框
  Widget _getSearch() {
    return Positioned(
      // 媒体查询上方安全区的高度
      top: MediaQuery.of(context).padding.top,
      left: 0,
      right: 0,
      child: Container(
        height: 50,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.4),
          borderRadius: BorderRadius.circular(25),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          "搜索...",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Stack -> 轮播图, 指示器, 搜索框
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
  }
}
