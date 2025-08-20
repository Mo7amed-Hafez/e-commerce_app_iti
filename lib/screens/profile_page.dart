import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Page',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: ListView(
        children: [
          // 🔹 User Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    color: Colors.blueGrey.shade300,
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/profile1.jpg"),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 20,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit, color: Colors.white),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Mohamed Hafez",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Flutter Developer",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 10),
                        Text(
                          "mohamedafia@gmail.com",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 10),
                        Text("+201019371562", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Divider(),

          // 🔹 Wishlist Section
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Wishlist ❤️",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildWishlistCard("Camera", "assets/pr1.jpg", 250.5),
                buildWishlistCard("Electronics", "assets/pr5.jpg", 15000),
                buildWishlistCard("Watch", "assets/pr2.jpg", 90.0),
              ],
            ),
          ),

          const Divider(),

          // 🔹 Previous Orders Section
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Previous Orders 📦",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          buildOrderCard("Order #1001", ["Shoes", "Watch"], 179.9),
          buildOrderCard("Order #1002", ["T-Shirt"], 29.5),
          buildOrderCard("Order #1003", ["Headphones", "Shoes"], 144.9),
        ],
      ),
    );
  }
}

// Wishlist Product Card
Widget buildWishlistCard(String name, String image, double price) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 3,
    child: SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(image, fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("\$${price.toString()}",
                    style: const TextStyle(color: Colors.teal)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// Order Card
Widget buildOrderCard(String orderId, List<String> products, double totalPrice) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(orderId,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text("Products: ${products.join(", ")}"),
          const SizedBox(height: 6),
          Text("Total: \$${totalPrice.toString()}",
              style: const TextStyle(color: Colors.teal)),
        ],
      ),
    ),
  );
}
