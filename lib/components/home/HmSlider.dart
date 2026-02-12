import 'package:flutter/material.dart';

class HmSlider extends StatefulWidget {
  const HmSlider({super.key});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      alignment: Alignment.center,
      color: Colors.blue,
      child: Text("轮播图", style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
