import 'package:flutter/material.dart';

class HmSuggestion extends StatefulWidget {
  const HmSuggestion({super.key});

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      color: Colors.blue,
      child: Text("推荐", style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
