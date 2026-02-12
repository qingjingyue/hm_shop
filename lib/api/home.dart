import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/types/home.dart';
import 'package:hm_shop/utils/DioRequest.dart';

/// 获取轮播图列表
Future<List<BannerItem>> getBannerListAPI() async {
  final List<dynamic> data = await dioRequest.get(HttpConstants.BANNER_LIST);
  return data
      .map((item) => BannerItem.fromJson(item as Map<String, dynamic>))
      .toList();
}
