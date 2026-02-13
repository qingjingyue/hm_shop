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

/// 特惠推荐数据模型
class Product {
  String id;
  String title;
  List<SubType> subTypes;

  Product({required this.id, required this.title, required this.subTypes});

  factory Product.formJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      subTypes: (json["subTypes"] as List)
          .map((item) => SubType.formJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SubType {
  String id;
  String title;
  GoodItems goodsItems;

  SubType({required this.id, required this.title, required this.goodsItems});

  factory SubType.formJson(Map<String, dynamic> json) {
    return SubType(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      goodsItems: GoodItems.formJson(
        json["goodsItems"] as Map<String, dynamic>,
      ),
    );
  }
}

class GoodItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<Good> items;

  GoodItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodItems.formJson(Map<String, dynamic> json) {
    return GoodItems(
      counts: json["counts"] ?? 0,
      pageSize: json["pageSize"] ?? 0,
      pages: json["pages"] ?? 0,
      page: json["page"] ?? 0,
      items: (json["items"] as List)
          .map((item) => Good.formJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Good {
  String id;
  String name;
  String desc;
  String price;
  String picture;
  int orderNum;

  Good({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory Good.formJson(Map<String, dynamic> json) {
    return Good(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      desc: json["desc"] ?? "",
      price: json["price"] ?? "",
      picture: json["picture"] ?? "",
      orderNum: json["orderNum"] ?? 0,
    );
  }
}

/// 商品详情项
class GoodDetailItem extends Good {
  int payCount = 0;

  /// 商品详情项
  GoodDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) : super(desc: "");
  // 转化方法
  factory GoodDetailItem.formJson(Map<String, dynamic> json) {
    return GoodDetailItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      price: json["price"]?.toString() ?? "",
      picture: json["picture"]?.toString() ?? "",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0") ?? 0,
      payCount: int.tryParse(json["payCount"]?.toString() ?? "0") ?? 0,
    );
  }
}

/// 猜你喜欢数据模型
class GoodDetailsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodDetailItem> items;

  GoodDetailsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodDetailsItems.formJson(Map<String, dynamic> json) {
    return GoodDetailsItems(
      counts: json["counts"] ?? 0,
      pageSize: json["pageSize"] ?? 0,
      pages: json["pages"] ?? 0,
      page: json["page"] ?? 0,
      items: (json["items"] as List)
          .map((item) => GoodDetailItem.formJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
