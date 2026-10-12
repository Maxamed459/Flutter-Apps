import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/models/shoe.dart';
import 'package:sneaker_shop/widgets/shoe_tile.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart controller = Get.put(Cart());

    void addShoeToCart(Shoe shoe) {
      controller.addItemToCart(shoe);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Successfully added"),
          content: Text("check your cart"),
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              hintText: "Search Product",
              prefixStyle: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ),
        SizedBox(height: 25),
        Text(
          "Every One flies, some flie longer than other",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hot Picks 🔥",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
              ),
              Text(
                "See all",
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Obx(() {
          return Expanded(
            child: ListView.builder(
              itemCount: controller.getShoeList().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Shoe shoe = controller.getShoeList()[index];
                return Shoetile(shoe: shoe, onTap: () => addShoeToCart(shoe));
              },
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
          child: Divider(color: Colors.white),
        ),
      ],
    );
  }
}
