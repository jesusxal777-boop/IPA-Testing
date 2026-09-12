enum ProductCategory { technology, accessories, software }

enum BadgeType { nuevo, popular, oferta, gratis }

class Product {
  final int id;
  final String name;
  final String category;
  final double price;
  final double? previousPrice;
  final BadgeType? badge;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.previousPrice,
    this.badge,
    this.description = '',
    this.imageUrl = '',
  });

  bool get isOnSale => previousPrice != null && previousPrice! > price;
  double get discount => isOnSale ? ((previousPrice! - price) / previousPrice! * 100).round().toDouble() : 0.0;

  @override
  String toString() => 'Product(id: $id, name: $name, price: $price)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
