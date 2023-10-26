import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercado_libre/controllers/cart_controller.dart';
import 'package:mercado_libre/models/product.dart';

class CarritoListItem extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  const CarritoListItem({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Image.network(
              product.image,
              alignment: Alignment.centerLeft,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 250,
                child: Flexible(
                  child: Text(
                    product.title,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  controller.removeProduct(product);
                },
                child: Text('Eliminar', style: TextStyle(color: Colors.blueAccent)),
              ),
             
              ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showQuantityDialog(controller, product, quantity, (newQuantity) {
                  controller.updateQuantity(product, newQuantity);
                });
                    },
                    child: SizedBox(child: Text('$quantity')),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      side: BorderSide(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
    
  }
  showQuantityDialog(CartController controller, Product product, int currentQuantity, Function(int) onQuantitySelected) {
    TextEditingController quantityController = TextEditingController();
    quantityController.text = currentQuantity.toString();

    Get.defaultDialog(
      title: 'Selecciona la cantidad',
      content: TextFormField(
        controller: quantityController,
        keyboardType: TextInputType.number,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            int newQuantity = int.tryParse(quantityController.text) ?? currentQuantity;
            onQuantitySelected(newQuantity);
            Get.back();
          },
          child: Text('Aceptar'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Cancelar'),
        ),
      ],
    );
  }
}
