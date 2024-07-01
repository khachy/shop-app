import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/provider/cart_provider.dart';
import 'package:shop_app/utils/grocery_options.dart';
import 'package:shop_app/utils/product_tile.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Product> products = [
    Product(
      name: 'Fresh Onions Market',
      price: 200,
      image: 'assets/fresh-onions.jpg',
      rating: 4.7,
    ),
    Product(
      name: 'Garlic Shop',
      price: 100,
      image: 'assets/fresh-garlic.jpg',
      rating: 4.4,
    ),
    Product(
      name: 'Chilli Peppers Spot',
      price: 150,
      image: 'assets/peppers.jpg',
      rating: 4.1,
    ),
    Product(
      name: 'Pure Sweetened Milk Palace',
      price: 500,
      image: 'assets/fresh-milk.jpg',
      rating: 4.8,
    ),
  ];

  var cartLength = 0;

  void addToCart() {
    final snackBar = SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        cartLength < 2
            ? 'Added $cartLength item to cart'
            : 'Added $cartLength items to cart',
        style: const TextStyle(
          fontFamily: 'UberMove',
          fontSize: 15,
        ),
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar
            appBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            'What are you looking for?',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'UberMove',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // list of options
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GroceryOption(
                            image: 'assets/tomato.png',
                            option: 'Tomato',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GroceryOption(
                            image: 'assets/garlic.png',
                            option: 'Garlic',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GroceryOption(
                            image: 'assets/red-chili-pepper.png',
                            option: 'Pepper',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GroceryOption(
                            image: 'assets/milk.png',
                            option: 'Milk',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Popular near you',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'UberMove',
                            ),
                          ),
                          Text(
                            'Fresh groceries delivered to your door',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade700,
                              fontFamily: 'UberMove',
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // groceries list
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 15,
                                  ),
                                  child: ProductTile(
                                    image: products[index].image,
                                    name: products[index].name,
                                    price: products[index].price,
                                    rating: products[index].rating,
                                    onTap: () {
                                      final cart =
                                          CartProvider.of(context)!.cart;
                                      cart.addItemByIndex(products, index);

                                      cartLength = cart.getItemLength();
                                      // itemPrice = cart.items[index].price;

                                      addToCart();
                                    },
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      )
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
            'JustGroceries',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'UberMove',
            ),
          ),
          Icon(
            Icons.search,
            size: 30,
          )
        ],
      ),
    );
  }
}
