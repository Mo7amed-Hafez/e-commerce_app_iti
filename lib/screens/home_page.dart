import 'package:flutter/material.dart';
import 'package:iti_fl_day3/widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MAFIA STORE",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 74, 195, 159),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          )
        ],
      ),

      drawer: buildDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView( // ✅ عشان الصفحة تتسحب كلها
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Banner Scroll
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildBanner("assets/banr3.png"),
                    buildBanner("assets/banar1.jpg"),
                    buildBanner("assets/banr2.jpg"),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Welcome to MAFIA store 🛍️",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),

              const SizedBox(height: 20),

              // 🔹 Categories Section
              const Text(
                "Categories",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),

              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCategory("Electronics", Icons.phone_android),
                    buildCategory("Fashion", Icons.checkroom),
                    buildCategory("Sports", Icons.sports_soccer),
                    buildCategory("Beauty", Icons.brush),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 New Arrivals Section
              const Text(
                "New Arrivals",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),

              GridView.count(
                shrinkWrap: true, // ✅ عشان يشتغل جوه ScrollView
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.75,
                children: [
                  buildProductCard("Camera", "assets/pr1.jpg", 1200),
                  buildProductCard("Electronics", "assets/pr5.jpg", 1400),
                  buildProductCard("Watch", "assets/pr2.jpg", 350.0),
                  buildProductCard("T-Shirt ", "assets/pr4.jpg", 25.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  Banner Widget
Widget buildBanner(String imageAsset) {
  return Container(
    width: 350,
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: DecorationImage(image: AssetImage(imageAsset), fit: BoxFit.cover),
    ),
  );
}

//  Category Widget
Widget buildCategory(String title, IconData icon) {
  return Container(
    width: 100,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.teal.shade100,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 30, color: Colors.teal),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    ),
  );
}

// Product Card
Widget buildProductCard(String name, String image, double price) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 3,
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text("\$${price.toString()}",
                  style: const TextStyle(color: Colors.teal)),
            ],
          ),
        ),
      ],
    ),
  );
}
