import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/types/home.dart';
import 'package:hm_shop/utils/DioRequest.dart';

/// 获取轮播图列表
Future<List<BannerItem>> getBannerListAPI() async {
  final List<dynamic> data = await dioRequest.get(HttpConstants.BANNER_LIST);
  return data
      .map((item) => BannerItem.formJson(item as Map<String, dynamic>))
      .toList();
}

/// 获取分类列表
Future<List<CategoryItem>> getCategoryListAPI() async {
  final List<dynamic> data = await dioRequest.get(HttpConstants.CATEGORY_LIST);
  return data
      .map((item) => CategoryItem.formJson(item as Map<String, dynamic>))
      .toList();
}

/// 获取特惠推荐
Future<Product> getProductListAPI() async {
  final dynamic data = await dioRequest.get(HttpConstants.PRODUCT_LIST);
  return Product.formJson(data as Map<String, dynamic>);
}

/// 热榜推荐
Future<Product> getInVogueListAPI() async {
  final dynamic data = await dioRequest.get(HttpConstants.IN_VOGUE_LIST);
  return Product.formJson(data as Map<String, dynamic>);
}

/// 一站式推荐
Future<Product> getOneStopListAPI() async {
  final dynamic data = await dioRequest.get(HttpConstants.ONE_STOP_LIST);
  return Product.formJson(data as Map<String, dynamic>);
}

/// 更多推荐列表
Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  final List<dynamic> data = await dioRequest.get(
    HttpConstants.RECOMMEND_LIST,
    params: params,
  );
  return data
      .map((item) => GoodDetailItem.formJson(item as Map<String, dynamic>))
      .toList();
}
