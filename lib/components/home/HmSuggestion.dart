import 'package:flutter/material.dart';
import 'package:hm_shop/types/home.dart';

class HmSuggestion extends StatefulWidget {
  final Product product;

  const HmSuggestion({super.key, required this.product});

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            "特惠推荐",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 86, 24, 20),
            ),
          ),
          SizedBox(width: 10),
          Text(
            "精选省攻略",
            style: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 124, 63, 58),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeft() {
    return Container(
      width: 80,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage("lib/assets/home_cmd_inner.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// 获取前3个商品
  List<Good> _getDisplayItems() {
    if (widget.product.subTypes.isEmpty) {
      return [];
    }

    return widget.product.subTypes.first.goodsItems.items.sublist(0, 3);
  }

  List<Widget> _getChildrenList() {
    return _getDisplayItems()
        .map(
          (item) => Expanded(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  child: Image.network(
                    item.picture,
                    // width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                    // 图片加载失败时的回调
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      "lib/assets/home_cmd_inner.png",
                      // width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 240, 96, 12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "¥${item.price}",
                    style: TextStyle(fontSize: 8, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/home_cmd_sm.png"),
          // 图片填充模式
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 10),
          Row(
            children: [
              _buildLeft(),
              SizedBox(width: 10),
              Expanded(
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _getChildrenList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
