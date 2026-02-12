import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  const HmCategory({super.key});

  @override
  State<HmCategory> createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    // 返回一个横向滚动的组件
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            color: Colors.blue,
            child: Text(
              "分类$index",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
