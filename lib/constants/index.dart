// ignore_for_file: constant_identifier_names

/// 全局常量
class GlobalConstants {
  /// 后端接口基础URL
  static const String BASE_URL = "https://meikou-api.itheima.net";

  /// 超时时间
  static const int TIME_OUT = 10;

  /// 成功状态
  static const String SUCCESS_CODE = "1";

  /// 本地存储的token key
  static const String TOKEN_KEY = "hm_shop_token";
}

/// 请求地址常量
class HttpConstants {
  /// 轮播图列表
  static const String BANNER_LIST = "/home/banner";

  /// 分类列表
  static const String CATEGORY_LIST = "/home/category/head";

  /// 特惠推荐
  static const String PRODUCT_LIST = "/hot/preference";

  /// 热榜推荐地址
  static const String IN_VOGUE_LIST = "/hot/inVogue";

  /// 一站式推荐地址
  static const String ONE_STOP_LIST = "/hot/oneStop";

  /// 更多推荐列表
  static const String RECOMMEND_LIST = "/home/recommend";

  /// 猜你喜欢列表
  static const String GUESS_LIST = "/home/goods/guessLike";

  /// 登录地址
  static const String LOGIN = "/login";

  /// 用户信息地址
  static const String USER_PROFILE = "/member/profile";
}
