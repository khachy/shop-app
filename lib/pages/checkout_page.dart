import 'package:flutter/material.dart';
import 'package:shop_app/pages/order_complete_page.dart';

import 'package:shop_app/utils/checkout_tile.dart';

class CheckOutPage extends StatefulWidget {
  final String name;
  final String image;
  final int price;
  const CheckOutPage({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  int totalPrice = 0;
  int item = 1;
  String calculatePrice() {
    setState(() {
      totalPrice = widget.price * item;
    });

    return totalPrice.toString();
  }

  String decalculatePrice() {
    setState(() {
      totalPrice = widget.price * item;
    });
    if (totalPrice == widget.price) {
      totalPrice = widget.price;
    }

    return totalPrice.toString();
  }

  void increaseItem() {
    setState(() {
      item++;
    });
  }

  void Function()? decreaseItem() {
    setState(() {
      item--;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      bottomSheet: GestureDetector(
        onTap: () {
          // cart.clearCart();
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
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
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const OrderCompletePage();
                },
              ));
        },
        child: Container(
          height: 50,
          width: double.infinity,
          color: Colors.black,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Proceed to Checkout . ',
                  style: TextStyle(
                    fontFamily: 'UberMove',
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '₦${calculatePrice()}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // appBar
            appBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CheckOutTile(
                      image: widget.image,
                      name: widget.name,
                      price: widget.price,
                      item: item,
                      onTapCalculate: () {
                        increaseItem();

                        calculatePrice();

                        print(calculatePrice());
                      },
                      onTapDecalculate: () {
                        item == 1 ? null : decreaseItem();

                        decalculatePrice();

                        print(
                          decalculatePrice(),
                        );
                      },
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Subtotal',
                            style: TextStyle(
                              fontFamily: 'UberMove',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₦${calculatePrice()}',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: const Icon(
              Icons.close_rounded,
              size: 25,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          // title
          const Text(
            'Checkout',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'UberMove',
            ),
          ),
        ],
      ),
    );
  }
}
