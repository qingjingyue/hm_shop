import 'package:flutter/material.dart';

/// 加载弹窗
class LoadingDialog {
  /// 显示加载弹窗
  static show(BuildContext context, {String msg = '加载中...'}) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text(msg),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 隐藏加载弹窗
  static hide(BuildContext context) {
    Navigator.pop(context);
  }
}
