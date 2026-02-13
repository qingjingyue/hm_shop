/// 轮播图数据模型
class BannerItem {
  String id;
  String imgUrl;

  /// 构造函数
  BannerItem({required this.id, required this.imgUrl});

  /// 命名构造函数, 使用factory声明的 工厂构造函数，从JSON数据创建对象
  factory BannerItem.formJson(Map<String, dynamic> json) {
    return BannerItem(id: json["id"] ?? "", imgUrl: json["imgUrl"] ?? "");
  }
}

/// 分类数据模型
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });

  factory CategoryItem.formJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      picture: json["picture"] ?? "",
      children: json["children"] != null
          ? (json["children"] as List)
                .map(
                  (item) => CategoryItem.formJson(item as Map<String, dynamic>),
                )
                .toList()
          : null,
    );
  }
}
