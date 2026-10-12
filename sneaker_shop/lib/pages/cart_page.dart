import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/models/shoe.dart';
import 'package:sneaker_shop/widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Cart controller = Get.put(Cart());
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          Text(
            "My Cart",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 10),
          Obx(() {
            return Expanded(
              child: ListView.builder(
                itemCount: controller.getUsercart().length,
                itemBuilder: (context, index) {
                  Shoe individualSHoe = controller.getUsercart()[index];
                  return CartItem(shoe: individualSHoe);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
