import 'package:flutter/material.dart';

import 'package:iti_fl_day3/data/sharedPreferences.dart';
import 'package:iti_fl_day3/screens/cart_page.dart';
import 'package:iti_fl_day3/screens/home_page.dart';

import 'package:iti_fl_day3/screens/products.dart' ;
import 'package:iti_fl_day3/screens/profile_page.dart';
import 'package:iti_fl_day3/screens/sttings_page.dart';

class BuildDrawer extends StatefulWidget {
  const BuildDrawer({super.key});

  @override
  State<BuildDrawer> createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  String? userName;
  String? userEmail;
  String? userPhone;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    userName = await SharedPrefHelper.getUsername();
    userEmail = await SharedPrefHelper.getEmail();
    userPhone = await SharedPrefHelper.getPhoneNumber();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 33, 114, 84),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                userName ?? "Guest User",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "${userEmail ?? "No Email"}\n${userPhone ?? ""}",
                style: const TextStyle(fontSize: 13),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("assets/profile1.jpg"),
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 14, 79, 73),
                    Color.fromARGB(255, 19, 86, 99),
                    Color.fromARGB(255, 20, 110, 101),
                    Color.fromARGB(255, 33, 114, 84),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                // borderRadius: BorderRadius.vertical(
                //   bottom: Radius.circular(30),
                // ),
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
              route:  const CartPage(products: [], cart: [],),
            ),
            buildCardDrawer(
              title: "Products",
              icon: Icons.production_quantity_limits_sharp,
              context: context,
              route: const ProductsPage(),
            ),
            buildCardDrawer(
              title: "Settings",
              icon: Icons.settings,
              context: context,
              route: SettingsPage(),
            ),
            const Divider(color: Colors.white70),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () async {
                await SharedPrefHelper.clearData(); // مسح البيانات
                Navigator.pushReplacementNamed(context, '/LoginPage');
              },
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
    leading: Icon(icon, color: Colors.cyan),
    title: Text(title, style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500)),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => route));
    },
  );
}
