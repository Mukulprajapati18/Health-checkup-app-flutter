import 'package:health_checkup_app/cart_page.dart';
import 'package:health_checkup_app/main_card.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<CartItem> cartItems = [];
  bool addedToCart = false;
  int cartItemCount = 0;

  void addToCart(CartItem item) {
    setState(() {
      cartItems.add(item);
      cartItemCount = cartItems.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LOGO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          // Wrap the IconButton with the Badge
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: badges.Badge(
              badgeContent: Text(cartItemCount.toString()),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Handle cart icon press
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartPage(cartItems: cartItems)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Popular lab tests",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Add your button press logic here
                          print('Text Button Pressed');
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'View more',
                              style: TextStyle(
                                  fontSize: 16,
                                  decoration: TextDecoration.underline),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: Center(
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,                        children: [
                  //         Expanded(child: MainCard(
                  //           title: 'Diabetes Test',
                  //           description: 'Description1',
                  //           price: '2000',
                  //           onAddToCart: addToCart,
                  //         )),

                  //         Expanded(child: MainCard(
                  //           title: 'CBC',
                  //           description: 'Description2',
                  //           price: '1400.00',
                  //           onAddToCart: addToCart,
                  //         )),
                  //       ],
                  //     ),
                  //   )
                  // ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Check the screen size and adjust UI accordingly
                      if (constraints.maxWidth > 600) {
                        // Desktop layout
                        
                        return 
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: MainCard(
                                title: 'Diabetes Test',
                                description: 'Description1',
                                price: '2000',
                                onAddToCart: addToCart,
                              ),
                            ),
                            Expanded(
                              child: MainCard(
                                title: 'CBC',
                                description: 'Description2',
                                price: '1400.00',
                                onAddToCart: addToCart,
                              ),
                            ),
                            Expanded(
                              child: MainCard(
                                title: 'Diabetes Test',
                                description: 'Description1',
                                price: '2000',
                                onAddToCart: addToCart,
                              ),
                            ),
                            Expanded(
                              child: MainCard(
                                title: 'CBC',
                                description: 'Description2',
                                price: '1400.00',
                                onAddToCart: addToCart,
                              ),
                            ),
                            
                          ],
                                                 );
                      } else {
                        // Mobile layout
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: MainCard(
                                  title: 'Diabetes Test',
                                  description: 'Description1',
                                  price: '2000',
                                  onAddToCart: addToCart,
                                )),
                                Expanded(
                                    child: MainCard(
                                  title: 'CBC',
                                  description: 'Description2',
                                  price: '1400.00',
                                  onAddToCart: addToCart,
                                )),
                              ],
                            ),
                            SizedBox(height: 14),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: MainCard(
                                  title: 'Thyroid Test',
                                  description: 'Description3',
                                  price: '2000',
                                  onAddToCart: addToCart,
                                )),
                                Expanded(
                                  child: MainCard(
                                    title: 'Iron Study Test',
                                    description: 'Description4',
                                    price: '1400.00',
                                    onAddToCart: addToCart,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Popular packages",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                // Check the screen size and adjust UI accordingly
                if (constraints.maxWidth > 600) {
                  // Desktop layout
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: MainCard(
                            title: 'Package 1',
                            description: 'Description 1',
                            price: '2500',
                            onAddToCart: addToCart,
                          ),
                        ),
                        Expanded(
                          child: MainCard(
                            title: 'Package 2',
                            description: 'Description 2',
                            price: '1800.00',
                            onAddToCart: addToCart,
                          ),
                        ),
                        Expanded(
                          child: MainCard(
                            title: 'Package 3',
                            description: 'Description 3',
                            price: '1200',
                            onAddToCart: addToCart,
                          ),
                        ),
                      ],
                    ),
                  );
                  
                } else {
                  // Mobile layout
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: MainCard(
                          title: 'Package 1',
                          description: 'Description 1',
                          price: '2500',
                          onAddToCart: addToCart,
                        ),
                      ),
                      SizedBox(height: 14),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: MainCard(
                          title: 'Package 2',
                          description: 'Description 2',
                          price: '1800.00',
                          onAddToCart: addToCart,
                        ),
                      ),
                      SizedBox(height: 14),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: MainCard(
                          title: 'Package 3',
                          description: 'Description 3',
                          price: '1200',
                          onAddToCart: addToCart,
                        ),
                      ),
                      SizedBox(
                    height: 16,
                  ),
                    ],
                    
                  );
                  
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
