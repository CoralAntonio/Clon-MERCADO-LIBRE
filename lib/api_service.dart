import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mercado_libre/models/product.dart';

class ApiService {
  static Future<List<Product>> fetchProducts() async {
    final client = http.Client();
    
    final response = await client.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<Product> products = jsonData.map((data) => Product.fromJson(data)).toList();

      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
