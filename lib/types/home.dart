/// 轮播图数据模型
class BannerItem {
  String id;
  String imgUrl;

  /// 命名构造函数
  BannerItem({required this.id, required this.imgUrl});

  /// 工厂构造函数，从JSON数据创建对象
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(id: json["id"] ?? "", imgUrl: json["imgUrl"] ?? "");
  }
}
