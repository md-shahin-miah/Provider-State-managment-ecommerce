import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../../data/model/bag.dart';
import '../../data/repository/repository.dart';
import 'bag_state.dart';

class BagProvider with ChangeNotifier {
  BagState _state;

  final Repository repository;

  BagProvider({required this.repository})
      : _state = BagState.initial(repository.getFurnitureList);

  BagState get state => _state;

  increaseQuantity(Bag furniture) {
    final List<Bag> mainItems = _state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return element.copyWith(quantity: furniture.quantity + 1);
      }
      return element;
    }).toList();
    _state = _state.copyWith(mainItems: mainItems);
    calculateTotalPrice();
    notifyListeners();
  }

  decreaseQuantity(Bag furniture) {
    if (furniture.quantity > 1) {
      final List<Bag> mainItems = _state.mainItems.map((element) {
        if (element.id == furniture.id) {
          return element.copyWith(quantity: furniture.quantity - 1);
        }
        return element;
      }).toList();

      _state = _state.copyWith(mainItems: mainItems);
    } else {
      deleteFromCart(furniture);
    }
    calculateTotalPrice();
    notifyListeners();
  }

  addToCart(Bag furniture) {
    final List<Bag> cartItems = _state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return element.copyWith(cart: true);
      }
      return element;
    }).toList();
    _state = _state.copyWith(mainItems: cartItems);
    calculateTotalPrice();
  }

  addToFavorite(Bag furniture) {
    final List<Bag> favoriteItems = _state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return element.copyWith(isFavorite: !furniture.isFavorite);
      }
      return element;
    }).toList();

    _state = _state.copyWith(
        mainItems: favoriteItems, totalPrice: _state.totalPrice);
    notifyListeners();
  }

  deleteFromCart(Bag furniture) {
    final List<Bag> cartItems = _state.mainItems.map((element) {
      if (element.id == furniture.id) {
        return element.copyWith(cart: false);
      }
      return element;
    }).toList();

    _state = _state.copyWith(mainItems: cartItems);
    notifyListeners();
  }

  clearCart() {
    List<Bag> mainItems = _state.mainItems
        .map((element) => element.copyWith(cart: false))
        .toList();

    _state = _state.copyWith(mainItems: mainItems);
    calculateTotalPrice();
    notifyListeners();
  }

  calculateTotalPrice() {
    double totalPrice = 0.0;

    for (var element in _state.mainItems) {
      if (element.cart) {
        totalPrice += element.quantity * element.price;
      }
    }
    _state =
        _state.copyWith(mainItems: _state.mainItems, totalPrice: totalPrice);
  }

  get getCartList => _state.mainItems.where((element) => element.cart).toList();

  get getFavoriteList =>
      _state.mainItems.where((element) => element.isFavorite).toList();
}
