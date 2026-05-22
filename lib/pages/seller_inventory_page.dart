import 'package:flutter/material.dart';
import 'package:dijital_kutuphane/models/book_data.dart';

class SellerInventory extends StatelessWidget {
  const SellerInventory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stoklar", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: inventoryBooks.length,
        itemBuilder: (context, index) {
          final book = inventoryBooks[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(book["img"]!, width: 45, height: 65, fit: BoxFit.cover),
              ),
              title: Text(book["title"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Stok Adedi: ${book["stock"]}"),
              trailing: Text(book["price"]!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
            ),
          );
        },
      ),
    );
  }
}
