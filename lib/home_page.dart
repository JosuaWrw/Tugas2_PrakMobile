import 'package:flutter/material.dart';
import 'order_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Column(
        children: [
          Image.asset('assets/banner.jpg', height: 200, fit: BoxFit.cover),
          const SizedBox(height: 20),
          const Text("Menu Makanan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ListTile(
            leading: Image.asset('assets/nasgor.jpg', width: 50, height: 50),
            title: const Text("Nasi Goreng"),
            subtitle: const Text("Rp 15.000"),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderPage(
                      menu: "Nasi Goreng",
                      price: 20000,
                      imagePath: "assets/nasgor.jpg",
                    ),
                  ),
                );
              },
              child: const Text("Pesan"),
            ),
          ),
          ListTile(
            leading: Image.asset('assets/miegor.jpg', width: 50, height: 50),
            title: const Text("Mie Goreng"),
            subtitle: const Text("Rp 13.000"),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderPage(
                      menu: "Mie Goreng",
                      price: 18000,
                      imagePath: "assets/miegor.jpg",
                    ),
                  ),
                );
              },
              child: const Text("Pesan"),
            ),
          ),
        ],
      ),
    );
  }
}
