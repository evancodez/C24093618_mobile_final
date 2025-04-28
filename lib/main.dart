import 'package:flutter/material.dart';
import 'order.dart';  
import 'checkout.dart';              

void main() => runApp(const HoneyVeilApp());

/// App root with a single Scaffold that owns the NavigationBar.
class HoneyVeilApp extends StatelessWidget {
  const HoneyVeilApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Honey Veil',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: const _RootNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _RootNavigation extends StatefulWidget {
  const _RootNavigation({Key? key}) : super(key: key);

  @override
  State<_RootNavigation> createState() => _RootNavigationState();
}

class _RootNavigationState extends State<_RootNavigation> {
  int _currentIndex = 0;
  final Map<String, int> _cart = {};

  void _addItem(String name) {
    setState(() => _cart[name] = (_cart[name] ?? 0) + 1);
  }

  void _removeItem(String name) {
    if (!_cart.containsKey(name)) return;
    setState(() {
      if (_cart[name]! <= 1) {
        _cart.remove(name);
      } else {
        _cart[name] = _cart[name]! - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
      OrderPage(cart: _cart, add: _addItem, remove: _removeItem),
      CheckoutPage(cart: _cart),
      const AboutPage(),
    ];

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.local_cafe), label: 'Order'),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Checkout'),
          NavigationDestination(icon: Icon(Icons.info_outline), label: 'About'),
        ],
      ),
    );
  }
}

const _cream = Color(0xFFFFF9E6);
const _midBlue = Color(0xFF4C7FD9);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: _cream,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SizedBox(
            height: 120,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.network(
                'https://130b1cc8ff38c5ad6d1c.cdn6.editmysite.com/uploads/b/130b1cc8ff38c5ad6d1cc9ccf95ea659928aaa4a936cce8b45727073eb94c9be/LOGO%20AZUL%20_1737626356.png?width=2400&optimize=medium',
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: _midBlue,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://130b1cc8ff38c5ad6d1c.cdn6.editmysite.com/uploads/b/130b1cc8ff38c5ad6d1cc9ccf95ea659928aaa4a936cce8b45727073eb94c9be/05%20ORDER_1742658617.png?width=2400&optimize=medium',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'At Honey Veil, we drizzle every pastry with warmth and craft every cup with care. '
                      'From sun‑kissed honey‑glazed croissants to velvety cappuccinos, our food‑truck‑turned‑café '
                      'has one goal: wrap your day in a sweet, golden veil of comfort.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white, height: 1.4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Text('About Honey Veil', style: const TextStyle(fontSize: 24)),
      );
}