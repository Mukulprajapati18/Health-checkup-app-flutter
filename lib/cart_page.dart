import 'package:flutter/material.dart';
import 'package:health_checkup_app/bill_page.dart';

class CartPage extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  DateTime selectedDate = DateTime.now();
  double discount = 10.0;

  @override
  Widget build(BuildContext context) {
    // Calculate total price
    double total = widget.cartItems.fold(0, (sum, item) => sum + item.price);

    // Apply discount (adjust as needed)
     // Example discount percentage
    double discountedTotal = total * (1 - discount / 100);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(widget.cartItems[index].title),
                    subtitle: Text(widget.cartItems[index].description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                            '\$${widget.cartItems[index].price.toStringAsFixed(2)}'),
                        IconButton(
                          icon: Icon(Icons.remove_shopping_cart),
                          
                          onPressed: () {
                            // Remove the item from the cart
                            setState(() {
                              widget.cartItems.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                ListTile(
                  title: Text('Select Appointment Date'),
                  subtitle: Text(
                      'Selected Date: ${selectedDate.toLocal()}'.split(' ')[0]),
                  trailing: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(
                            days: 30)), // Allow booking within the next 30 days
                      );
                      if (pickedDate != null && pickedDate != selectedDate) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                  ),
                ),
                 ElevatedButton(
                  onPressed: () {
                    // Navigate to the BillPage with the generated bill details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BillPage(
                          selectedDate: selectedDate,
                          total: getTotalPrice(),
                          discount: 10.0,
                   ),
                      ),
                    );
                  },
                  child: Text('Generate Bill'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void generateBill() {
    print('Selected Appointment Date: ${selectedDate.toLocal()}');
    print('Total Price: \$${getTotalPrice().toStringAsFixed(2)}');
    print('Discount: $discount%');
    print('Discounted Total: \$${getDiscountedTotal().toStringAsFixed(2)}');
    // ... print other details as needed ...
  }

  double getTotalPrice() {
    return widget.cartItems.fold(0, (sum, item) => sum + item.price);
  }

  double getDiscountedTotal() {
    double discount = 10.0; // Example discount percentage
    return getTotalPrice() * (1 - discount / 100);
  }
}

// cart_item

class CartItem {
  final String title;
  final String description;
  final double price;

  CartItem(
      {required this.title, required this.description, required this.price});
}
