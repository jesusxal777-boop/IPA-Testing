import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:dreambyte_store/main.dart';
import 'package:dreambyte_store/providers/store_controller.dart';

void main() {
  group('DreamByte Store Widget Tests', () {
    testWidgets('App starts and shows home screen', (WidgetTester tester) async {
      await tester.pumpWidget(const DreamByteStore());
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('HomeScreen displays product list', (WidgetTester tester) async {
      await tester.pumpWidget(const DreamByteStore());
      await tester.pumpAndSettle();
      
      expect(find.byType(ListView), findsWidgets);
    });

    testWidgets('Add to cart button works', (WidgetTester tester) async {
      await tester.pumpWidget(const DreamByteStore());
      await tester.pumpAndSettle();
      
      final addButtons = find.byIcon(Icons.add);
      expect(addButtons, findsWidgets);
    });

    testWidgets('Cart icon shows item count', (WidgetTester tester) async {
      await tester.pumpWidget(const DreamByteStore());
      await tester.pumpAndSettle();
      
      expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
    });
  });

  group('StoreController Tests', () {
    late StoreController controller;

    setUp(() {
      controller = StoreController();
    });

    test('Initial cart is empty', () {
      expect(controller.cartItems.length, 0);
      expect(controller.totalItems, 0);
    });

    test('Can add products to cart', () {
      final product = controller.products.first;
      controller.addToCart(product);
      
      expect(controller.totalItems, 1);
      expect(controller.cartItems.contains(product), true);
    });

    test('Subtotal calculation is correct', () {
      final product = controller.products.first;
      controller.addToCart(product);
      
      expect(controller.subtotal, product.price);
    });

    test('Tax calculation is 16%', () {
      final product = controller.products.first;
      controller.addToCart(product);
      
      final expectedTax = product.price * 0.16;
      expect(controller.tax, expectedTax);
    });

    test('Total includes tax', () {
      final product = controller.products.first;
      controller.addToCart(product);
      
      final expectedTotal = product.price * 1.16;
      expect(controller.total, expectedTotal);
    });

    test('Can remove products from cart', () {
      final product = controller.products.first;
      controller.addToCart(product);
      controller.removeFromCart(product);
      
      expect(controller.totalItems, 0);
      expect(controller.cartItems.contains(product), false);
    });

    test('Can update product quantity', () {
      final product = controller.products.first;
      controller.addToCart(product);
      controller.updateQuantity(product, 5);
      
      expect(controller.getProductQuantity(product), 5);
    });

    test('Filtered products by category work', () {
      controller.setSelectedCategory('Tecnología');
      final filtered = controller.filteredProducts;
      
      expect(filtered.every((p) => p.category == 'Tecnología'), true);
    });

    test('Search filter works', () {
      controller.setSearchQuery('Dream');
      final filtered = controller.filteredProducts;
      
      expect(filtered.every((p) => p.name.contains('Dream')), true);
    });

    test('Can clear cart', () {
      controller.addToCart(controller.products.first);
      controller.addToCart(controller.products[1]);
      controller.clearCart();
      
      expect(controller.totalItems, 0);
      expect(controller.cartItems.length, 0);
    });
  });
}
