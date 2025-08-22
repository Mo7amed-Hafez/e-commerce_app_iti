import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, String> product;
  final VoidCallback onAddToCart;

  const ProductDetailsPage({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product["title"]!)),
      body: Column(
        children: [
          Image.asset(widget.product["image"]!,
              width: double.infinity, height: 250, fit: BoxFit.cover),
          const SizedBox(height: 16),
          Text(widget.product["title"]!,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold)),
          Text(widget.product["subtitle"]!,
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 20),

          // counter
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() => quantity--);
                    }
                  },
                  icon: const Icon(Icons.remove)),
              Text("$quantity", style: const TextStyle(fontSize: 18)),
              IconButton(
                  onPressed: () {
                    setState(() => quantity++);
                  },
                  icon: const Icon(Icons.add)),
            ],
          ),
          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () {
              widget.onAddToCart();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        "${widget.product["title"]} added to cart 🛒 (x$quantity)")),
              );
            },
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text("Add to Cart"),
          )
        ],
      ),
    );
  }
}
