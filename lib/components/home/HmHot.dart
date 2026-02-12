import 'package:flutter/material.dart';

class HmHot extends StatefulWidget {
  const HmHot({super.key});

  @override
  State<HmHot> createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      color: Colors.blue,
      child: Text("爆款", style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
