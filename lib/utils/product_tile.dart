import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final double rating;
  final VoidCallback onTap;
  const ProductTile({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            image,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'UberMove',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '₦${price.toString()}/kg',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'UberMove',
                      ),
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 20,
                      color: Colors.yellow.shade600,
                    )
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: const Icon(
                Icons.add_circle_rounded,
                size: 35,
              ),
            ),
          ],
        )
      ],
    );
  }
}
