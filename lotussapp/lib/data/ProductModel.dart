class Product {
  final int id;
  final String sku;
  final String name;
  final String urlKey;
  const Product(
      {required this.id,
      required this.sku,
      required this.name,
      required this.urlKey});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      sku: json['sku'],
      name: json['name'],
      urlKey: json['urlKey'],
    );
  }
}