import 'package:flutter/material.dart';

class OrderCompletePage extends StatefulWidget {
  const OrderCompletePage({super.key});

  @override
  State<OrderCompletePage> createState() => _OrderCompletePageState();
}

class _OrderCompletePageState extends State<OrderCompletePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            appBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      const Icon(
                        Icons.check_circle_rounded,
                        size: 120,
                        color: Colors.green,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Your order has been placed successfully!',
                        style: TextStyle(
                          fontFamily: 'UberMove',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'It is now very easy to reach the best quality among all the products on the internet!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                          fontFamily: 'UberMove',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
