// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.itemImg,
    required this.itemName,
    required this.itemSpec,
    required this.itemProductType,
    this.productType,
  });

  final String id;
  final String itemImg;
  final String itemName;
  final String itemSpec;
  final ItemProductType itemProductType;
  final String? productType;

  Product copyWith({
    required String id,
    required String itemImg,
    required String itemName,
    required String itemSpec,
    required ItemProductType itemProductType,
    String? productType,
  }) =>
      Product(
        id: id ?? this.id,
        itemImg: itemImg ?? this.itemImg,
        itemName: itemName ?? this.itemName,
        itemSpec: itemSpec ?? this.itemSpec,
        itemProductType: itemProductType ?? this.itemProductType,
        productType: productType ?? this.productType,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    itemImg: json["item_img"],
    itemName: json["item_name"],
    itemSpec: json["item_spec"],
    itemProductType: itemProductTypeValues.map[json["item_product_type"]]!,
    productType: json["product_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "item_img": itemImg,
    "item_name": itemName,
    "item_spec": itemSpec,
    "item_product_type": itemProductTypeValues.reverse[itemProductType],
    "product_type": productType,
  };
}

enum ItemProductType { PRODUCT }

final itemProductTypeValues = EnumValues({
  "PRODUCT": ItemProductType.PRODUCT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
