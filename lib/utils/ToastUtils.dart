import 'package:flutter/material.dart';

class ToastUtils {
  static bool _isShow = false;

  static void showToast(BuildContext context, String? msg) {
    if (_isShow) {
      return;
    }
    // 显示Toast
    _isShow = true;
    // 3秒后隐藏
    Future.delayed(Duration(seconds: 3), () {
      _isShow = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 180,
        shape: RoundedRectangleBorder(
          // 圆角
          borderRadius: BorderRadius.circular(40),
        ),
        // 悬浮状态
        behavior: SnackBarBehavior.floating,
        // 显示时间
        duration: Duration(seconds: 3),
        content: Text(msg ?? "加载成功", textAlign: TextAlign.center),
      ),
    );
  }
}
