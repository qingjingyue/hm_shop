import 'package:get/get.dart';
import 'package:hm_shop/types/user.dart';

/// 管理用户信息
class UserController extends GetxController {
  // 监听用户信息变化 -> .obs
  Rx<UserInfo> user = UserInfo.fromJSON({}).obs;

  // 取值需要 user.value

  /// 更新用户信息
  void updateUserInfo(UserInfo info) {
    user.value = info;
  }
}
