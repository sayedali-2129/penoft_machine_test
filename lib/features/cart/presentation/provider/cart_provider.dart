import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:penoft_machine_test/features/materials/data/material_model.dart';

class CartProvider extends ChangeNotifier {
  final List<MaterialModel> _cart = [];
  List<MaterialModel> get cart => _cart;

  void addToCart(MaterialModel material) {
    final index = _cart.indexWhere(
      (element) => element.title == material.title,
    );
    if (index != -1) {
      _cart[index] = _cart[index].copyWith(qty: (_cart[index].qty ?? 0) + 1);
    } else {
      final newMaterial = material.copyWith(qty: 1);
      _cart.add(newMaterial);
    }
    notifyListeners();
  }

  void removeFromCart(MaterialModel material) {
    _cart.remove(material);
    notifyListeners();
  }

  void incrementQty(MaterialModel material) {
    log(material.qty.toString());
    final index = _cart.indexWhere(
      (element) => element.title == material.title,
    );
    if (index != -1) {
      _cart[index] = _cart[index].copyWith(qty: (_cart[index].qty ?? 0) + 1);
    }
    notifyListeners();
  }

  void decrementQty(MaterialModel material) {
    final index = _cart.indexWhere(
      (element) => element.title == material.title,
    );
    if (index != -1) {
      final currentQty = _cart[index].qty ?? 0;
      if (currentQty > 1) {
        _cart[index] = _cart[index].copyWith(qty: currentQty - 1);
      } else {
        _cart.removeAt(index);
      }
    }
    notifyListeners();
  }

  int getTotalItems() {
    return _cart.fold(
      0,
      (previousValue, element) => previousValue + (element.qty ?? 0),
    );
  }

  num getTotalAmount() {
    return _cart.fold(
      0,
      (previousValue, element) =>
          previousValue + (element.amountToNum * (element.qty ?? 0)),
    );
  }
}
