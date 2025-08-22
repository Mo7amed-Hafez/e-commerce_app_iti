import 'package:flutter/material.dart';
import 'package:iti_fl_day3/screens/product_details.dart';
import 'cart_page.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  // بيانات المنتجات
  final List<Map<String, String>> products = const [
    {
      "title": "Camera ",
      "subtitle": "Sony A7s",
      "image": "assets/pr1.jpg",
    },
    {
      "title": "Watch",
      "subtitle": "Apple Watch Series 7",
      "image": "assets/pr2.jpg",
    },
    {
      "title": "PS5",
      "subtitle": "Playstation 5",
      "image": 'assets/pr3.jpg',
    },
    {
      "title": "Makeup",
      "subtitle": "Beauty kit",
      "image": "assets/pr6.jpg"
    },
    {
      "title": "T shirt",
      "subtitle": "Hoodie T shirt",
      "image": "assets/pr4.jpg",
    },
    {
      "title": "Electronics",
      "subtitle": "Laptop and others",
      "image": "assets/pr5.jpg"
    },
  ];

  final Set<int> wishlist = {};
  final List<int> cart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Gallery"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartPage(products: products, cart: cart),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            final isFav = wishlist.contains(index);
            return buildProductCard(
              context,
              index,
              product,
              isFav,
            );
          },
        ),
      ),
    );
  }

  Widget buildProductCard(
    BuildContext context,
    int index,
    Map<String, String> product,
    bool isFav,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsPage(
              product: product,
              onAddToCart: () {
                setState(() {
                  cart.add(index);
                });
              },
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                product["image"]!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: CircleAvatar(
                backgroundColor: Colors.white70,
                child: IconButton(
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border_outlined,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      if (isFav) {
                        wishlist.remove(index);
                      } else {
                        wishlist.add(index);
                      }
                    });
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product["title"]!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text(product["subtitle"]!,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
