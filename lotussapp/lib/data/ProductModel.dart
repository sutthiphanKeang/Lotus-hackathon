class ProductData {
  final int id;
  final String sku;
  final String name;
  final List mediaGallery;
  final Map priceRange;
  const ProductData(
      {required this.id,
      required this.sku,
      required this.name,
      required this.mediaGallery, 
      required this.priceRange});
  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'],
      sku: json['sku'],
      name: json['name'],
      mediaGallery: json['mediaGallery'],
      priceRange: json['priceRange'],
    );
  }
}