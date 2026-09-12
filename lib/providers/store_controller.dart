import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../services/local_storage_service.dart';

class StoreController extends ChangeNotifier {
  final LocalStorageService _storageService = LocalStorageService();

  // Product catalog
  final List<Product> _products = [
    Product(
      id: 1,
      name: 'DreamBuds',
      category: 'Accesorios',
      price: 899,
      previousPrice: 999,
      badge: BadgeType.nuevo,
      description: 'Premium wireless earbuds with active noise cancellation',
      imageUrl: 'assets/images/dreambuds.png',
    ),
    Product(
      id: 2,
      name: 'DreamByte One',
      category: 'Tecnología',
      price: 4999,
      badge: BadgeType.popular,
      description: 'Flagship desktop computer for professionals',
      imageUrl: 'assets/images/dreambyteone.png',
    ),
    Product(
      id: 3,
      name: 'DreamWatch',
      category: 'Tecnología',
      price: 1799,
      previousPrice: 1999,
      badge: BadgeType.oferta,
      description: 'Smart watch with health tracking features',
      imageUrl: 'assets/images/dreamwatch.png',
    ),
    Product(
      id: 4,
      name: 'DreamPad',
      category: 'Tecnología',
      price: 2999,
      description: 'Powerful tablet for creative professionals',
      imageUrl: 'assets/images/dreampad.png',
    ),
    Product(
      id: 5,
      name: 'DreamBuds Case',
      category: 'Accesorios',
      price: 249,
      previousPrice: 299,
      description: 'Protective carrying case for DreamBuds',
      imageUrl: 'assets/images/dreambudscase.png',
    ),
    Product(
      id: 6,
      name: 'DreamByte Coder',
      category: 'Software',
      price: 399,
      description: 'Advanced IDE for modern development',
      imageUrl: 'assets/images/dreambytecoder.png',
    ),
    Product(
      id: 7,
      name: 'DreamByte OS',
      category: 'Software',
      price: 0,
      badge: BadgeType.gratis,
      description: 'Revolutionary operating system',
      imageUrl: 'assets/images/dreambyteos.png',
    ),
    Product(
      id: 8,
      name: 'DreamStation',
      category: 'Tecnología',
      price: 6999,
      badge: BadgeType.popular,
      description: 'Professional workstation for creators',
      imageUrl: 'assets/images/dreamstation.png',
    ),
  ];

  // Cart state: Map<productId, quantity>
  Map<String, int> _cart = {};
  String _selectedCategory = 'Todos';
  String _searchQuery = '';
  String _selectedPaymentMethod = '';

  // Getters
  List<Product> get products => _products;
  List<Product> get filteredProducts {
    var filtered = _products;

    if (_selectedCategory != 'Todos') {
      filtered = filtered.where((p) => p.category == _selectedCategory).toList();
    }

    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where((p) => p.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    return filtered;
  }

  Map<String, int> get cart => _cart;
  List<Product> get cartItems =>
      _cart.entries.map((e) => _products.firstWhere((p) => p.id.toString() == e.key)).toList();

  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;
  String get selectedPaymentMethod => _selectedPaymentMethod;

  Set<String> get categories {
    final set = {'Todos'};
    for (var product in _products) {
      set.add(product.category);
    }
    return set;
  }

  double get subtotal {
    double total = 0;
    for (var entry in _cart.entries) {
      final product = _products.firstWhere((p) => p.id.toString() == entry.key);
      total += product.price * entry.value;
    }
    return total;
  }

  double get tax => subtotal * 0.16; // 16% tax (IVA Mexico)
  double get total => subtotal + tax;

  int get totalItems => _cart.values.fold(0, (sum, qty) => sum + qty);

  // Constructor
  StoreController() {
    _initializeCart();
  }

  Future<void> _initializeCart() async {
    _cart = await _storageService.loadCart();
    notifyListeners();
  }

  // Methods
  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void addToCart(Product product) {
    final key = product.id.toString();
    if (_cart.containsKey(key)) {
      _cart[key] = _cart[key]! + 1;
    } else {
      _cart[key] = 1;
    }
    _persistCart();
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product.id.toString());
    _persistCart();
    notifyListeners();
  }

  void updateQuantity(Product product, int quantity) {
    if (quantity <= 0) {
      removeFromCart(product);
    } else {
      _cart[product.id.toString()] = quantity;
      _persistCart();
      notifyListeners();
    }
  }

  void clearCart() {
    _cart.clear();
    _storageService.clearCart();
    notifyListeners();
  }

  void setSelectedPaymentMethod(String method) {
    _selectedPaymentMethod = method;
    notifyListeners();
  }

  Future<void> _persistCart() async {
    await _storageService.saveCart(_cart);
  }

  int getProductQuantity(Product product) {
    return _cart[product.id.toString()] ?? 0;
  }
}
