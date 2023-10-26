import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercado_libre/controllers/cart_controller.dart';
import 'package:mercado_libre/models/product.dart';
import 'package:mercado_libre/views/formaEntrega.dart';
import 'package:mercado_libre/widgets/carritoList.dart';
import 'package:mercado_libre/api_service.dart';

class CarritoView extends StatefulWidget {
  CarritoView({Key? key}) : super(key: key);

  @override
  State<CarritoView> createState() => _CarritoViewState();
}

class _CarritoViewState extends State<CarritoView> {
  late List<Product> productsFromApi = [];
  bool isLoading = true;
  final CartController controller = Get.find();

  @override
  void initState() {
    super.initState();
    ApiService.fetchProducts().then((apiProducts) {
      setState(() {
        productsFromApi = apiProducts;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: Text('Carrito de compras'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7.0),
                  child: Text(
                    'CP 97800',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Color.fromARGB(189, 214, 210, 210),
                    child: Card(
                      elevation: 0,
                      color: Colors.white,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Productos',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Obx(
                            () => SizedBox(
                              height: 440,
                              child: ListView.builder(
                                itemCount: controller.products.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CarritoListItem(
                                    controller: controller,
                                    product: controller.products.keys
                                        .toList()[index],
                                    quantity: controller.products.values
                                        .toList()[index],
                                    index: index,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(() 
                   =>  Container(
                      color: Color.fromARGB(189, 214, 210, 210),
                      child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Productos (5)',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text('\$12000',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Envío',
                                  ),
                                  Text(
                                    'Gratis',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text('\$${controller.total}',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 17)),
                                ],
                              ),
                              Container(
                                child: ButtonBar(
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
                                                builder: (context) =>
                                                    formaEntrega()),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: Colors.blueAccent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        child: const Text(
                                          'Continuar compra',
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
