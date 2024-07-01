import 'package:flutter/material.dart';

class GroceryOption extends StatelessWidget {
  final String image;
  final String option;
  const GroceryOption({
    super.key,
    required this.image,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 80,
      child: Column(
        children: [
          Image.asset(
            image,
            height: 30,
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            option,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'UberMove',
            ),
          )
        ],
      ),
    );
  }
}
