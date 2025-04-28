import 'package:flutter/material.dart';
import 'checkout.dart';

const _cream = Color(0xFFFFF9E6);
const _midBlue = Color(0xFF4C7FD9);

class OrderPage extends StatelessWidget {
  final Map<String, int> cart;
  final void Function(String) add;
  final void Function(String) remove;

  const OrderPage({
    Key? key,
    required this.cart,
    required this.add,
    required this.remove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
        backgroundColor: _midBlue,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_checkout),
            tooltip: 'Checkout',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(cart: cart),
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          const _LogoHeader(),
          Expanded(
            child: Container(
              color: _midBlue,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _MenuSection(title: 'SIGNATURE', items: _signatureItems, cart: cart, add: add, remove: remove),
                    _MenuSection(title: 'CLASSICS', items: _classicsItems, cart: cart, add: add, remove: remove),
                    _MenuSection(title: 'WATER‑BASED REFRESHMENTS', items: _waterItems, cart: cart, add: add, remove: remove),
                    _MenuSection(title: 'BAKED GOODS', items: _bakedItems, cart: cart, add: add, remove: remove),
                    _MenuSection(title: 'OTHER DRINKS', items: _otherItems, cart: cart, add: add, remove: remove),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoHeader extends StatelessWidget {
  const _LogoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: _cream,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 100,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image.network(
            'https://130b1cc8ff38c5ad6d1c.cdn6.editmysite.com/uploads/b/130b1cc8ff38c5ad6d1cc9ccf95ea659928aaa4a936cce8b45727073eb94c9be/LOGO%20AZUL%20_1737626356.png?width=2400&optimize=medium',
          ),
        ),
      ),
    );
  }
}

class _MenuSection extends StatelessWidget {
  final String title;
  final List<MenuItem> items;
  final Map<String, int> cart;
  final void Function(String) add;
  final void Function(String) remove;

  const _MenuSection({
    required this.title,
    required this.items,
    required this.cart,
    required this.add,
    required this.remove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        ...items.map((item) => _MenuItemTile(
              item: item,
              quantity: cart[item.name] ?? 0,
              onAdd: () => add(item.name),
              onRemove: () => remove(item.name),
            )),
      ],
    );
  }
}

class _MenuItemTile extends StatelessWidget {
  final MenuItem item;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const _MenuItemTile({
    required this.item,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  if (item.subtitle != null)
                    Text(item.subtitle!, style: Theme.of(context).textTheme.bodySmall),
                  if (item.description != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(item.description!, style: Theme.of(context).textTheme.bodySmall),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(item.price, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: quantity > 0 ? onRemove : null,
                ),
                Text('$quantity', style: Theme.of(context).textTheme.titleMedium),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: onAdd,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String name;
  final String? subtitle;
  final String? description;
  final String price;
  const MenuItem({
    required this.name,
    this.subtitle,
    this.description,
    required this.price,
  });
}



const _signatureItems = [
  MenuItem(name: 'Blue Babe Matcha', subtitle: 'Blueberry Matcha Latte', description: 'Ceremonial‑grade matcha, honey‑sweetened blueberry jam, and your choice of milk. Try it with blueberry cold foam!', price: '\$7.50'),
  MenuItem(name: 'Brunei Dirty Matcha', subtitle: 'Matcha latte with a shot of espresso', description: 'Ceremonial‑grade matcha, a bold espresso shot, maple syrup, and your choice of milk.', price: '\$7.50'),
  MenuItem(name: 'Honey Veil Matcha', description: 'Ceremonial‑grade matcha blended with our honey‑vanilla bean syrup and your choice of milk for natural sweetness.', price: '\$7.00'),
  MenuItem(name: 'New York Summer Matcha', subtitle: 'Strawberry Matcha Latte', description: 'Honey‑sweetened strawberry jam layered with ceremonial matcha and milk. Perfect with pink strawberry cold foam.', price: '\$7.50'),
];

const _classicsItems = [
  MenuItem(name: 'Coffee Cold Latte', price: '\$6.00'),
  MenuItem(name: 'Matcha + Milk', price: '\$6.00'),
];

const _waterItems = [
  MenuItem(name: 'Classic Americano', description: 'Espresso diluted with water for a bold yet smooth cup.', price: '\$5.00'),
  MenuItem(name: 'Matcha Spritz', description: 'Matcha, lemon juice, maple syrup, sparkling water — bright & zesty.', price: '\$7.00'),
];

const _bakedItems = [
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
];

const _otherItems = [
  MenuItem(name: 'Athon Apollo', subtitle: 'Orange & Mango • Sugar‑free', price: '\$4.00'),
  MenuItem(name: 'Athon Athena', subtitle: 'Strawberry Lavender • Sugar‑free', price: '\$4.00'),
  MenuItem(name: 'Fiji Water', subtitle: 'Alkaline', price: '\$3.00'),
  MenuItem(name: 'Coconut Water', price: '\$4.00'),
];
