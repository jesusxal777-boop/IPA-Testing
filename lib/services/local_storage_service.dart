import 'dart:convert';
import 'package:flutter/foundation.dart';

/// Mock local storage service for cart persistence
/// In production, use shared_preferences or similar
class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();

  factory LocalStorageService() {
    return _instance;
  }

  LocalStorageService._internal();

  final Map<String, dynamic> _storage = {};

  Future<void> saveCart(Map<String, int> cart) async {
    try {
      final jsonData = jsonEncode(cart);
      _storage['cart'] = jsonData;
      if (kDebugMode) {
        print('Cart saved: $jsonData');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error saving cart: $e');
      }
    }
  }

  Future<Map<String, int>> loadCart() async {
    try {
      final jsonData = _storage['cart'] as String?;
      if (jsonData == null) return {};
      final decoded = jsonDecode(jsonData) as Map<String, dynamic>;
      return Map<String, int>.from(
        decoded.map((k, v) => MapEntry(k, v as int)),
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error loading cart: $e');
      }
      return {};
    }
  }

  Future<void> clearCart() async {
    _storage.remove('cart');
  }
}
