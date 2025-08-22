import 'package:flutter/material.dart';
import 'package:iti_fl_day3/data/consts.dart';
import 'package:iti_fl_day3/screens/cart_page.dart';
import 'package:iti_fl_day3/screens/products.dart' ;
import 'package:iti_fl_day3/screens/profile_page.dart';
import 'package:iti_fl_day3/widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeContent(), 
      const ProductsPage(),
      const CartPage(products: [], cart: [],),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MAFIA STORE",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: ConstsData.primaryColor,
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
          ),
        ],
      ),

      drawer: BuildDrawer (),

      body: _pages[_selectedPageIndex], 

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        selectedItemColor: ConstsData.primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Products"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// HomePage
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
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
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),

            const SizedBox(height: 20),

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

            const Text(
              "New Arrivals",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),

            GridView.count(
              shrinkWrap: true,
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
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(
                "\$${price.toString()}",
                style: const TextStyle(color: Colors.teal),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
