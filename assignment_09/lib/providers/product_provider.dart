import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _service = ProductService();

  List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get products => List.unmodifiable(_products);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;
  bool get isEmpty => !_isLoading && _products.isEmpty && !hasError;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await _service.fetchProducts();
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      final created = await _service.createProduct(product);
      _products = [..._products, created];
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      notifyListeners();
      rethrow;
    }
  }

  Future<void> updateProduct(Product product) async {
    try {
      await _service.updateProduct(product);
      final index = _products.indexWhere((p) => p.id == product.id);
      if (index != -1) {
        final updated = List<Product>.from(_products);
        updated[index] = product;
        _products = updated;
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      notifyListeners();
      rethrow;
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      await _service.deleteProduct(id);
      _products = _products.where((p) => p.id != id).toList();
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      notifyListeners();
      rethrow;
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}