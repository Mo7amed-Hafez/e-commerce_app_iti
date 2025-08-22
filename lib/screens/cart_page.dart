import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, String>> products;
  final List<int> cart;

  const CartPage({super.key, required this.products, required this.cart});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: widget.cart.isEmpty
          ? const Center(child: Text("Cart is empty 🛒"))
          : ListView.builder(
              itemCount: widget.cart.length,
              itemBuilder: (context, index) {
                final productIndex = widget.cart[index];
                final product = widget.products[productIndex];
                return ListTile(
                  leading: Image.asset(product["image"]!, width: 50),
                  title: Text(product["title"]!),
                  subtitle: Text(product["subtitle"]!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        widget.cart.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
