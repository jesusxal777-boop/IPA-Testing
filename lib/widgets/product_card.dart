import 'package:flutter/material.dart';
import '../models/product.dart';
import '../theme/dreambyte_theme.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final int quantity;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onTap,
    this.quantity = 0,
  }) : super(key: key);

  String _getBadgeLabel(BadgeType? badge) {
    switch (badge) {
      case BadgeType.nuevo:
        return 'Nuevo';
      case BadgeType.popular:
        return 'Popular';
      case BadgeType.oferta:
        return 'Oferta';
      case BadgeType.gratis:
        return 'Gratis';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              DreamByteTheme.navyMedium.withOpacity(0.7),
              DreamByteTheme.navyMedium.withOpacity(0.4),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: DreamByteTheme.cyanNeon.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Background blur effect
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: DreamByteTheme.navyMedium.withOpacity(0.3),
                  ),
                ),
              ),
              // Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image/Placeholder
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: DreamByteTheme.blueGradient,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '🌐',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name
                          Text(
                            product.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 4),
                          // Category
                          Text(
                            product.category,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: DreamByteTheme.cyanNeon,
                                  fontSize: 12,
                                ),
                          ),
                          const Spacer(),
                          // Price section
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\$${product.price.toStringAsFixed(0)} MXN',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  if (product.previousPrice != null)
                                    Text(
                                      '\$${product.previousPrice?.toStringAsFixed(0)} MXN',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                ],
                              ),
                              const Spacer(),
                              if (quantity > 0)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: DreamByteTheme.electricBlue,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    'x$quantity',
                                    style: const TextStyle(
                                      color: DreamByteTheme.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Badge
              if (product.badge != null)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      gradient: DreamByteTheme.blueGradient,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      _getBadgeLabel(product.badge),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
