import 'package:get/get.dart';
import 'package:mercado_libre/models/product.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
    Get.snackbar(
      "Producto agregado",
      "Acabas de agregar ${product.title} en el carrito",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
    );
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[products] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products.remove(product);
    }
  }

  get products => _products;

  void updateQuantity(Product product, int newQuantity) {
    if (_products.containsKey(product)) {
      if (newQuantity > 0) {
        _products[product] = newQuantity;
      } else {
        _products.remove(product);
      }
    }
  }

  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total {
    if (_products.isEmpty) {
      return '0.00';
    } else {
      return _products.entries
          .map((product) => product.key.price * product.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);
    }
  }
}
