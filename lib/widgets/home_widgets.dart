import 'package:flutter/material.dart';
import 'package:iti_fl_day3/screens/cart_page.dart';
import 'package:iti_fl_day3/screens/home_page.dart';
import 'package:iti_fl_day3/screens/products.dart';
import 'package:iti_fl_day3/screens/profile_page.dart';
import 'package:iti_fl_day3/screens/sttings_page.dart';

// Drawer 

class buildDrawer extends StatelessWidget {
  const buildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(176, 48, 101, 87),
        child: ListView(
          padding: EdgeInsets.all(17),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Mohamed Hafez",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                "MohamedHafez@gmail.com",
                style: TextStyle(fontSize: 13),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/profile1.jpg"),
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent[300],
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
            ),
            buildCardDrawer(
              title: "Home",
              icon: Icons.home,
              context: context,
              route: const HomePage(),
            ),
            buildCardDrawer(
              title: "Profile",
              icon: Icons.person,
              context: context,
              route: const ProfilePage(),
            ),
            buildCardDrawer(
              title: "Cart",
              icon: Icons.shopping_cart,
              context: context,
              route: const CartPage(),
            ),
            buildCardDrawer(
              title: "Products",
              icon: Icons.production_quantity_limits_sharp,
              context: context,
              route: const ProductsPage (),
            ),
            buildCardDrawer(
              title: "Settings",
              icon: Icons.settings,
              context: context,
              route: SettingsPage (),
            ),
          ],
        ),
      ),
    );
  }
}

// Card Drawer
Widget buildCardDrawer({
  required String title,
  required IconData icon,
  required BuildContext context,
  required Widget route,
}) {
  return ListTile(
    leading: Icon(
      icon,
      color: const Color.fromARGB(255, 109, 47, 226),
    ), 
    title: Text(title, style: const TextStyle(color: Colors.white)),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => route));
    },
  );
}


