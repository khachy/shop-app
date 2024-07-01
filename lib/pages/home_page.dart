import 'package:flutter/material.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/pages/product_page.dart';
import 'package:shop_app/provider/cart_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final cart = CartProvider.of(context)!.cart;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: Colors.white,
        shadowColor: Colors.black38,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(
              Icons.space_dashboard_rounded,
            ),
            label: 'Products',
            selectedIcon: Icon(
              Icons.space_dashboard_rounded,
            ),
          ),
          NavigationDestination(
            icon: SizedBox(
              width: 50,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_rounded,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Visibility(
                      visible: cart.items.isEmpty ? false : true,
                      child: Container(
                        height: 20,
                        width: 20,
                        // padding: EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            '${cart.items.length}',
                            style: const TextStyle(
                              fontFamily: 'UberMove',
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            label: 'Cart',
            selectedIcon: SizedBox(
              height: 50,
              width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.shopping_cart_rounded,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Visibility(
                      visible: cart.items.isEmpty ? false : true,
                      child: Container(
                        height: 20,
                        width: 20,
                        // padding: EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            '${cart.items.length}',
                            style: const TextStyle(
                              fontFamily: 'UberMove',
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}

final screens = [
  const ProductsPage(),
  const CartPage(),
];
