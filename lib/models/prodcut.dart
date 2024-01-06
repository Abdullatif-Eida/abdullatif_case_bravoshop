class Product {
  final String website;
  final String brandLogo;
  final String productUrl;
  final String productName;
  final List<ProductColor> productColors;
  final List<ProductSize> productSizes;
  final List<String> productCategory;

  Product({
    required this.website,
    required this.brandLogo,
    required this.productUrl,
    required this.productName,
    required this.productColors,
    required this.productSizes,
    required this.productCategory,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      website: json['website'],
      brandLogo: json['brandLogo'],
      productUrl: json['productUrl'],
      productName: json['productName'],
      productColors: (json['productColors'] as List).map((colorJson) => ProductColor.fromJson(colorJson)).toList(),
      productSizes: (json['productSizes'] as List).map((sizeJson) => ProductSize.fromJson(sizeJson)).toList(),
      productCategory: List<String>.from(json['productCategory']),
    );
  }
}

class ProductColor {
  final String color;
  final String originalImage;
  final String available;
  final bool active;
  final String url;
  final String image;

  ProductColor({
    required this.color,
    required this.originalImage,
    required this.available,
    required this.active,
    required this.url,
    required this.image,
  });

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      color: json['color'],
      originalImage: json['original_image'],
      available: json['available'],
      active: json['active'],
      url: json['url'],
      image: json['image'],
    );
  }
}

class ProductSize {
  final String size;
  final double price;
  final String available;

  ProductSize({
    required this.size,
    required this.price,
    required this.available,
  });

  factory ProductSize.fromJson(Map<String, dynamic> json) {
    return ProductSize(
      size: json['size'],
      price: double.parse(json['price'].toString()),
      available: json['available'],
    );
  }
}
