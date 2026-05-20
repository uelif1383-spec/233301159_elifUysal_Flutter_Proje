import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  // Ana sayfadan gelen dinamik veriyi yakalayan constructor
  final Map<String, dynamic> bookData;

  const BookDetailPage({Key? key, refinement, required this.bookData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookData['baslik']),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kitap Görseli (Merkezde)
            Center(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    bookData['resim'],
                    height: 250,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Kitap Başlık ve Yazar Bilgisi
            Text(
              bookData['baslik'],
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "Yazar: ${bookData['yazar']}",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 12),

            // Detay Etiketleri (Kategori & Stok)
            Row(
              children: [
                Chip(
                  label: Text(bookData['kategori']),
                  backgroundColor: Colors.deepPurple.withOpacity(0.1),
                  labelStyle: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Chip(
                  label: Text("Stok: ${bookData['stok']}"),
                  backgroundColor: Colors.orange.withOpacity(0.1),
                  labelStyle: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(height: 32),

            // Kitap Açıklaması
            const Text(
              "Kitap Açıklaması",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              bookData['acıklama'] ?? "Bu kitap için bir açıklama girilmemiş.",
              style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
            ),
            const SizedBox(height: 40),

            // Fiyatlandırma ve Aksiyon Alanı (Satın Al / Kirala)
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Satış Fiyatı: ${bookData['fiyat']} TL", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text("Günlük Kiralama: ${bookData['kiralikFiyat']} TL", style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Sepete ekleme fonksiyonu
                  },
                  icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                  label: const Text("Sepete Ekle", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}