// bill_page.dart

import 'package:flutter/material.dart';

class BillPage extends StatelessWidget {
  final DateTime selectedDate;
  final double total;
  final double discount;

  BillPage({required this.selectedDate, required this.total, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Details'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shadowColor: Color.fromARGB(0, 0, 0, 0),
          // shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(10)),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              const ListTile(title: Column(
                    children: [
                       Padding(
                         padding: EdgeInsets.all(12.0),
                         child: Icon(Icons.verified_rounded, size: 100, color: Colors.blue),
                       ), // Calendar icon
                     
                     Column(
                       children: [
                         Center(
                           child: Text('Your appointment have been scheduled successfully',
                           
                                           style: TextStyle(
                                             fontWeight: FontWeight.bold,
                                             fontSize: 18,
                                           ),),
                         ),
                       ],
                     ),
                   ],
                 ),),
               Divider(),
               ListTile(
                 title: Text('Selected Appointment Date'),
                 subtitle: Text(selectedDate.toLocal().toString().split(' ')[0]),
               ),
               Divider(),
               ListTile(
                 title: Text('M.R.P Price'),
                 subtitle: Text('\$${total.toStringAsFixed(2)}'),
               ),
               
               ListTile(
                 title: Text('Discount'),
                 subtitle: Text('$discount%', style: TextStyle(color:Colors.green ),),
               ),
               Divider(),
               ListTile(
                 title: Text('Amount to be paid ',style: TextStyle(fontWeight: FontWeight.bold),),
                 subtitle: Text('\$${getDiscountedTotal().toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold),),
               ),
             ],
           ),
        ),
      ),
    );
  }

  double getDiscountedTotal() {
    return total * (1 - discount / 100);
  }
}
