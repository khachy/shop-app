import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';

class CheckOutTile extends StatefulWidget {
  final String image;
  final String name;
  final int price;
  final int item;
  final VoidCallback onTapCalculate;
  final VoidCallback onTapDecalculate;

  const CheckOutTile({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.onTapCalculate,
    required this.item,
    required this.onTapDecalculate,
  });

  @override
  State<CheckOutTile> createState() => _CheckOutTileState();
}

class _CheckOutTileState extends State<CheckOutTile> {
  int item = 1;
  int totalPrice = 0;
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

  String calculatePrice(List<Product> products) {
    for (var i = 0; i < products.length; i++) {
      setState(() {
        totalPrice = products[i].price * item;
      });
    }
    return totalPrice.toString();
  }

  String decalculatePrice(List<Product> products) {
    for (var i = 0; i < products.length; i++) {
      setState(() {
        totalPrice = products[i].price * item;
      });
      if (totalPrice == products[i].price) {
        totalPrice = products[i].price;
      }
    }
    return totalPrice.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: Image.asset(
                    widget.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: 'UberMove',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '₦${widget.price.toString()}',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: widget.onTapDecalculate,
                          child: const Icon(
                            Icons.cancel,
                            size: 20,
                          ),
                        ),
                        Text(
                          widget.item.toString(),
                          style: const TextStyle(
                            fontFamily: 'UberMove',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.onTapCalculate,
                          child: const Icon(
                            Icons.add_circle_rounded,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
