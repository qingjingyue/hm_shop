import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/types/home.dart';
import 'package:hm_shop/utils/DioRequest.dart';

/// 猜你喜欢列表
/// @param:
///   - page: 页码
///   - pageSize: 每页数量
Future<GoodDetailsItems> getGuessLikeListAPI(
  Map<String, dynamic> params,
) async {
  final dynamic data = await dioRequest.get(
    HttpConstants.GUESS_LIST,
    params: params,
  );
  return GoodDetailsItems.formJson(data as Map<String, dynamic>);
}
