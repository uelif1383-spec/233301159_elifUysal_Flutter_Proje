import 'package:flutter/material.dart';

class SellerDashboard extends StatelessWidget {
  const SellerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        title: const Text("Kütüphane Yönetimi", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.deepPurple.shade800,
        actions: [
          IconButton(
            icon: const Icon(Icons.bolt_rounded, color: Colors.amber),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Turbo Satış Modu Aktif! Performans optimize edildi.")),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.deepPurple.shade900, Colors.indigo.shade800]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Yönetici Paneli", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(height: 5),
                  Text("Genel Mağaza Kazancı ve İstatistikleri", style: TextStyle(color: Colors.white60, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildModernPurpleCard("Toplam Ciro", "4.850 TL", Icons.wallet_rounded, Colors.purple.shade700),
                _buildModernPurpleCard("Kiralama Akışı", "74 Adet", Icons.autorenew_rounded, Colors.indigo.shade700),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildModernPurpleCard("Yeni İstekler", "9 Mesaj", Icons.mark_chat_unread_rounded, Colors.deepPurple.shade600),
                _buildModernPurpleCard("Tükenen Stok", "2 Kitap", Icons.gpp_maybe_rounded, Colors.red.shade700),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24, bottom: 12, left: 4),
              child: Text("Haftalık Satış Analizi (TL)   ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildBarSim("Pzt", 40, context),
                    _buildBarSim("Sal", 70, context),
                    _buildBarSim("Çar", 110, context),
                    _buildBarSim("Per", 60, context),
                    _buildBarSim("Cum", 130, context),
                    _buildBarSim("Cmt", 160, context),
                    _buildBarSim("Paz", 95, context),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 12, left: 4),
              child: Text("Hızlı İşlemler", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(context, Icons.campaign_rounded, "Kampanya", Colors.orange),
                _buildActionButton(context, Icons.analytics_rounded, "Rapor Al", Colors.teal),
                _buildActionButton(context, Icons.support_agent_rounded, "Destek", Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernPurpleCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 12),
              Text(title, style: const TextStyle(color: Colors.grey, fontSize: 13)),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBarSim(String day, double height, BuildContext context) {
    return Column(
      children: [
        Container(
          height: height,
          width: 12,
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade400,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 6),
        Text(day, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18, color: Colors.white),
      label: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
