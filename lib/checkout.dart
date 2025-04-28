import 'package:flutter/material.dart';
import 'order.dart'; // for MenuItem definition

class CheckoutPage extends StatelessWidget {
  final Map<String, int> cart;

  const CheckoutPage({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allItems = <MenuItem>[
      MenuItem(name: 'Blue Babe Matcha', price: '\$7.50'),
      MenuItem(name: 'Brunei Dirty Matcha', price: '\$7.50'),
      MenuItem(name: 'Honey Veil Matcha', price: '\$7.00'),
      MenuItem(name: 'New York Summer Matcha', price: '\$7.50'),
      MenuItem(name: 'Coffee Cold Latte', price: '\$6.00'),
      MenuItem(name: 'Matcha + Milk', price: '\$6.00'),
      MenuItem(name: 'Classic Americano', price: '\$5.00'),
      MenuItem(name: 'Matcha Spritz', price: '\$7.00'),
      MenuItem(name: '7‑Grain Sourdough Loaf', price: '\$12.00'),
      MenuItem(name: 'Gluten‑Free Cinnamon Crunch Banana Bread', price: '\$5.00'),
      MenuItem(name: 'Rosemary Olive Loaf', price: '\$12.00'),
      MenuItem(name: 'Sourdough Blueberry Lemon Scones', price: '\$4.00'),
      MenuItem(name: 'Sourdough Chocolate Chip Cookies', price: '\$5.00'),
      MenuItem(name: 'Sourdough Cinnamon Rolls', price: '\$5.00'),
      MenuItem(name: 'Sourdough Loaf', price: '\$10.00'),
      MenuItem(name: 'Sourdough Carrot Cake Loaf', price: '\$6.00'),
      MenuItem(name: 'Gluten‑Free Lemon Poppy Seed Loaf', price: '\$5.00'),
      MenuItem(name: 'Strawberry Tart', price: '\$5.00'),
      MenuItem(name: 'Athon Apollo', price: '\$4.00'),
      MenuItem(name: 'Athon Athena', price: '\$4.00'),
      MenuItem(name: 'Fiji Water', price: '\$3.00'),
      MenuItem(name: 'Coconut Water', price: '\$4.00'),
    ];

    double subtotal = 0;

    final cartDetails = cart.entries.map((entry) {
      final item = allItems.firstWhere((i) => i.name == entry.key);
      final price = double.parse(item.price.replaceAll('\$', ''));
      final total = price * entry.value;
      subtotal += total;

      return ListTile(
        title: Text('${entry.key} x${entry.value}'),
        trailing: Text('\$${total.toStringAsFixed(2)}'),
      );
    }).toList();

    final tax = subtotal * 0.07;
    final totalWithTax = subtotal + tax;

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Your Cart', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(child: ListView(children: cartDetails)),
            const Divider(thickness: 1),
            _summaryRow('Subtotal', subtotal),
            _summaryRow('Tax (7%)', tax),
            _summaryRow('Total', totalWithTax, isBold: true),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: cart.isEmpty
                    ? null
                    : () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Order Placed'),
                            content: const Text('Thank you! Your order has been submitted.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                child: const Text('Checkout'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String label, double value, {bool isBold = false}) {
    final style = TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text('\$${value.toStringAsFixed(2)}', style: style),
        ],
      ),
    );
  }
}