import 'package:flutter/material.dart';
import 'package:hm_shop/types/home.dart';

class HmHot extends StatefulWidget {
  /// 商品列表
  final Product product;

  /// 推荐类型
  final String type;

  const HmHot({super.key, required this.product, required this.type});

  @override
  State<HmHot> createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  // 获取前两条数据
  // 类似 计算属性
  List<Good> get _items {
    if (widget.product.subTypes.isEmpty) {
      return [];
    }
    return widget.product.subTypes.first.goodsItems.items.sublist(0, 2);
  }

  // 构建子项
  List<Widget> _getChildrenList() {
    return _items.map((item) {
      return Expanded(
        child: Container(
          // width: 80,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.picture,
                  // width: 80,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "lib/assets/home_cmd_inner.png",
                      // width: 80,
                      height: 100,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              SizedBox(height: 5),
              Text(
                "¥${item.price}",
                style: TextStyle(
                  fontSize: 12,
                  color: const Color.fromARGB(255, 86, 24, 20),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          widget.type == "step" ? "一站买全" : "爆款推荐",
          style: TextStyle(
            color: const Color.fromARGB(255, 86, 24, 20),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 8),
        Text(
          widget.type == "step" ? "精心优选" : "最受欢迎",
          style: TextStyle(
            fontSize: 8,
            color: const Color.fromARGB(255, 124, 63, 58),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.type == "step"
              ? const Color.fromARGB(255, 249, 247, 219)
              : const Color.fromARGB(255, 211, 228, 240),
        ),
        child: Column(
          children: [
            // 顶部内容
            _buildHeader(),
            SizedBox(height: 10),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _getChildrenList(),
            ),
          ],
        ),
      ),
    );
  }
}
