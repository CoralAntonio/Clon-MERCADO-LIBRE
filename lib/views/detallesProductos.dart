import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercado_libre/api_service.dart';
import 'package:mercado_libre/controllers/cart_controller.dart'; // Importa tu controlador
import 'package:mercado_libre/models/product.dart';
import 'package:mercado_libre/views/inicioSesion.dart';
import 'package:mercado_libre/widgets/productList.dart';

class detalleProducto extends StatefulWidget {
  final Product product;

  detalleProducto({Key? key, required this.product}) : super(key: key);

  @override
  State<detalleProducto> createState() => _detalleProductoState();
}

class _detalleProductoState extends State<detalleProducto> {
  //llamamos al controlador
  final CartController cartController = Get.put<CartController>(CartController());

  late List<Product> productsFromApi = [];

  @override
  void initState() {
    super.initState();
    ApiService.fetchProducts().then((apiProducts) {
      setState(() {
        productsFromApi = apiProducts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Producto'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  ' ${widget.product.title}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: Image.network(
                      widget.product.image,
                      height: 160,
                      width: 150,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${widget.product.price.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 240),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 380,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => inicioSesion()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              'Comprar ahora',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 380,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              // Agrega el producto actual al carrito
                              cartController.addProduct(widget.product);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  Color.fromARGB(255, 210, 222, 244),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              'Agregar al carrito',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 17,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 260,
                      color: Colors.white,
                      padding: EdgeInsets.all(6),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productsFromApi.length,
                        itemBuilder: (context, index) {
                          final product = productsFromApi[index];
                          return ProductCard(product: product);
                        },
                      ),
                    ),
                    Text('Agregar al carrito'),
                    Text(
                      'Descripción: ${widget.product.description}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
