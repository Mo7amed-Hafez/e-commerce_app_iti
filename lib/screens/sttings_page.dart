import 'package:flutter/material.dart';
import 'package:iti_fl_day3/data/sharedPreferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: isDarkMode,
            secondary: const Icon(Icons.dark_mode),
            onChanged: (val) {
              setState(() => isDarkMode = val);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      "Dark Mode ${isDarkMode ? "Enabled 🌙" : "Disabled ☀️"}"),
                ),
              );
            },
          ),
          const Divider(),

          SwitchListTile(
            title: const Text("Enable Notifications"),
            value: notificationsEnabled,
            secondary: const Icon(Icons.notifications),
            onChanged: (val) {
              setState(() => notificationsEnabled = val);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      "Notifications ${notificationsEnabled ? "ON 🔔" : "OFF 🔕"}"),
                ),
              );
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.info, color: Colors.teal),
            title: const Text("About App"),
            subtitle: const Text("Version 1.0.0"),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "E-commerce App",
                applicationVersion: "1.0.0",
                applicationIcon: const Icon(Icons.store, size: 40),
                children: [
                  const Text("This is Flutter E-commerce application is Developed by Mohamed Hafez"),
                ],
              );
            },
          ),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () async {
                await SharedPrefHelper.clearData(); // مسح البيانات
                Navigator.pushReplacementNamed(context, '/LoginPage');
              },
            ),
        ],
      ),
    );
  }
}
