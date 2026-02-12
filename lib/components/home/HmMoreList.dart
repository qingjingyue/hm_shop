import 'package:flutter/material.dart';

class HmMoreList extends StatefulWidget {
  const HmMoreList({super.key});

  @override
  State<HmMoreList> createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      // 控制列数
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => Container(
        height: 100,
        alignment: Alignment.center,
        color: Colors.blue,
        child: Text(
          "更多$index",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
