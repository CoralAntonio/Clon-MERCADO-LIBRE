import 'package:flutter/material.dart';
import 'package:mercado_libre/api_service.dart';
import 'package:mercado_libre/models/product.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos Fake Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = ApiService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos de Fake Store'),
      ),
      body: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay productos disponibles.'));
          } else {
            final productList = snapshot.data;

            return ListView.builder(
              itemCount: productList!.length,
              itemBuilder: (context, index) {
                final product = productList[index];

                return Container(
                  child: ListTile(
                    title: Text(product.title),
                    subtitle: Text('Precio: \$${product.price.toStringAsFixed(2)}'),
                    leading: Image.network(product.image),
                    onTap: () {
                      // Puedes manejar la acción al hacer clic en un producto aquí
                      // Por ejemplo, abrir una pantalla de detalles del producto.
                    },
                  ),
                );

              },
            );
          }
        },
      ),
    );
  }
}
