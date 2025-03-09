import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String menu;
  final int price;
  final String imagePath;

  const OrderPage(
      {super.key,
      required this.menu,
      required this.price,
      required this.imagePath});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _quantityController = TextEditingController();
  String _errorText = "";
  int? _totalPrice;

  void _calculateTotal() {
    String input = _quantityController.text.trim();

    if (input.isEmpty) {
      setState(() {
        _errorText = "Jumlah tidak boleh kosong!";
        _totalPrice = null;
      });
      return;
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(input)) {
      setState(() {
        _errorText = "Masukkan angka yang valid!";
        _totalPrice = null;
      });
      return;
    }

    int quantity = int.parse(input);
    setState(() {
      _errorText = "";
      _totalPrice = widget.price * quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Page")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(widget.imagePath, height: 150, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(widget.menu,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Harga: Rp ${widget.price}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Jumlah Pesanan",
                border: const OutlineInputBorder(),
                errorText: _errorText.isNotEmpty ? _errorText : null,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateTotal,
              child: const Text("Submit"),
            ),
            const SizedBox(height: 20),
            if (_totalPrice != null)
              Text(
                "Total: Rp $_totalPrice",
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
