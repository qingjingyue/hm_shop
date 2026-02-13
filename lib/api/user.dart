import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/types/user.dart';
import 'package:hm_shop/utils/DioRequest.dart';

/// 登录
Future<UserInfo> loginAPI(Map<String, dynamic> data) async {
  final dynamic rse = await dioRequest.post(HttpConstants.LOGIN, data: data);
  return UserInfo.fromJSON(rse as Map<String, dynamic>);
}

/// 获取用户信息
Future<UserInfo> getUserInfoAPI() async {
  final dynamic rse = await dioRequest.get(HttpConstants.USER_PROFILE);
  return UserInfo.fromJSON(rse as Map<String, dynamic>);
}
