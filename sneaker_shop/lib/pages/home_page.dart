import 'package:flutter/material.dart';
import 'package:sneaker_shop/pages/cart_page.dart';
import 'package:sneaker_shop/pages/shop_page.dart';
import 'package:sneaker_shop/widgets/bottom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // navigation
  int selectedIndex = 0;

  // update selected Index
  void updateSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> _pages = [ShopPage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, size: 30),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 210,
                    color: Colors.white,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(color: Colors.grey[900]),
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        title: Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(Icons.home, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        title: Text(
                          "About",
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(Icons.info, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0, left: 25.0),
              child: ListTile(
                title: Text("Logout", style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.logout_outlined, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavbar(
        onTabChange: (index) => updateSelectedIndex(index),
      ),
    );
  }
}
