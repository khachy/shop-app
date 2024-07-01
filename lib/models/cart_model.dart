import 'package:shop_app/models/product_model.dart';

class Cart {
  final List<Product> _items = [];

  List<Product> get items => _items;

  int item = 1;
  int totalPrice = 0;

  void addItemByIndex(List<Product> products, int index) {
    _items.add(products[index]);
  }

  void removeItem(int index) {
    _items.removeAt(index);
  }

  void clearCart() {
    _items.clear();
  }

  int getItemLength() {
    return _items.length;
  }
}
