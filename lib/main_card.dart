import 'package:health_checkup_app/cart_page.dart';
import 'package:flutter/material.dart';

class MainCard extends StatefulWidget {
  final String title;
  final String description;
  final String price;
  final Function(CartItem) onAddToCart;

  MainCard({
    required this.title,
    required this.description,
    required this.price,
    required this.onAddToCart,
  });

  @override
  _MainCardState createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  bool addedToCart = false;

  @override
  Widget build(BuildContext context) {
    // Capture values from widget properties
    String title = widget.title;
    String description = widget.description;
    String price = widget.price;

    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Title ---
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // --- Subtitle ---
            Text(
              description,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 5),

            // --- Other details ---
            Text(
              description,
              style: TextStyle(color: Colors.grey),
            ),
            // ... Add other details from the image

            const SizedBox(height: 15),

            // --- Price ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price, // Replace with actual price
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  price, // Replace with original price
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // --- Buttons ---
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    double parsedPrice = double.tryParse(widget.price) ?? 0.0;
                    CartItem item = CartItem(
                        title: widget.title,
                        description: widget.description,
                        price: parsedPrice);
                    widget.onAddToCart(item);

                    // Update the state to change the text
                    setState(() {
                      addedToCart = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: addedToCart
                        ? Colors.green // Change the color when added to cart
                        : Color.fromARGB(139, 34, 8, 235),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 32),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: Text(
                    addedToCart ? 'Added to Cart' : 'Add to Cart',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('View Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}