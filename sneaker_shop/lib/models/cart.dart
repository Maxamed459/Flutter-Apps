import 'package:get/get.dart';
import 'package:sneaker_shop/models/shoe.dart';

class Cart extends GetxController {
  // list of shoe's
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom Freak',
      price: '99.99',
      imagePath: 'assets/images/1.jpg',
      description:
          'The ultimate basketball shoe designed for speed, power, and ultimate court control.',
    ),
    Shoe(
      name: 'Air Max Edge',
      price: '129.99',
      imagePath: 'assets/images/2.jpg',
      description:
          'Classic air cushioning meets modern street style for all-day comfort.',
    ),
    Shoe(
      name: 'Lunar Glide',
      price: '89.99',
      imagePath: 'assets/images/3.jpg',
      description:
          'Lightweight running shoe featuring adaptive support and ultra-soft cushioning.',
    ),
    Shoe(
      name: 'React Phantom',
      price: '149.99',
      imagePath: 'assets/images/4.jpg',
      description:
          'A laceless, snug-fit trainer built with responsive foam for high-intensity workouts.',
    ),
    Shoe(
      name: 'Court Vision',
      price: '74.99',
      imagePath: 'assets/images/5.jpg',
      description:
          'A retro-inspired low-top sneaker perfect for everyday casual wear.',
    ),
  ].obs;

  // list of items in user cart
  RxList<Shoe> userCart = <Shoe>[].obs;

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUsercart() {
    return shoeShop;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
  }

  // remove items from the cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
  }
}
