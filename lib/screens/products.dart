import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProductsPage(),
    );
  }
}

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
      "title": "Elctronics",
      "subtitle": "Laptop and others",
      "image": "assets/pr5.jpg"
    },
    {
      "title": "Makeup",
      "subtitle": "Beauty kit",
      "image": "assets/pr6.jpg"
    },
  ];

  // حالة الـ Wishlist لكل منتج
  final Set<int> wishlist = {};

  // حالة الـ Cart
  final List<int> cart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Gallery"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Cart contains ${cart.length} items 🛒")),
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
              product["title"]!,
              product["subtitle"]!,
              product["image"]!,
              isFav,
            );
          },
        ),
      ),
    );
  }

  //  Card للمنتج
  Widget buildProductCard(
    BuildContext context,
    int index,
    String title,
    String subtitle,
    String imagePath,
    bool isFav,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("$title removed from Wishlist ❌")),
                      );
                    } else {
                      wishlist.add(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("$title added to Wishlist ❤️")),
                      );
                    }
                  });
                },
              ),
            ),
          ),

          // العنوان + الزر
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(height: 6),

                  // زر Add to Cart
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          cart.add(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("$title added to Cart 🛒")),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart, size: 18,color: Colors.white,),
                      label: const Text("Add to Cart",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
