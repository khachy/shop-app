import 'package:flutter/material.dart';
import 'package:shop_app/pages/checkout_page.dart';
import 'package:shop_app/provider/cart_provider.dart';
import 'package:shop_app/utils/cart_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var cartLength = 0;
  @override
  Widget build(BuildContext context) {
    final cart = CartProvider.of(context)!.cart;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            appBar(),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: cart.items.isNotEmpty
                      ? ListView.builder(
                          itemCount: cart.items.length,
                          itemBuilder: (context, index) {
                            return CartTile(
                              image: cart.items[index].image,
                              name: cart.items[index].name,
                              price: cart.items[index].price,
                              deleteCart: () {
                                cartLength = cart.items.length;
                                cart.removeItem(index);
                                final snackBar = SnackBar(
                                  backgroundColor: Colors.black,
                                  content: const Text(
                                    'Cart Deleted!',
                                    style: TextStyle(
                                      fontFamily: 'UberMove',
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 25),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              viewCart: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return SlideTransition(
                                          position: Tween<Offset>(
                                            begin: const Offset(1, 0),
                                            end: Offset.zero,
                                          ).animate(
                                            CurvedAnimation(
                                              parent: animation,
                                              curve: Curves.easeInOut,
                                            ),
                                          ),
                                          child: child,
                                        );
                                      },
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return CheckOutPage(
                                          name: cart.items[index].name,
                                          image: cart.items[index].image,
                                          price: cart.items[index].price,
                                        );
                                      },
                                    ));
                              },
                            );
                          },
                        )
                      : Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 200,
                              ),
                              const Icon(
                                Icons.cancel,
                                size: 100,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Your cart is empty!, try to add something in it.',
                                style: TextStyle(
                                  fontFamily: 'UberMove',
                                  fontSize: 15,
                                  color: Colors.grey.shade700,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // title
          Text(
            'Cart',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'UberMove',
            ),
          ),
        ],
      ),
    );
  }
}
