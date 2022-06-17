// ignore_for_file: non_constant_identifier_names

class ProductsModel {
  late final int product_id;
  late final String product_name;
  late final String product_price;
  late final String created_at;

  ProductsModel({
    required this.product_id,
    required this.product_name,
    required this.product_price,
    required this.created_at,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      product_id: json['product_id'],
      product_name: json['product_name'],
      product_price: json['product_price'],
      created_at: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'product_id': product_id,
        'product_name': product_name,
        'product_price': product_price,
        'created_at': created_at,
      };
}
