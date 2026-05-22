import 'package:flutter/material.dart';
import 'package:dijital_kutuphane/models/app_state.dart';
import 'package:dijital_kutuphane/pages/user_home_page.dart';
import 'package:dijital_kutuphane/pages/library_page.dart';
import 'package:dijital_kutuphane/pages/profile_page.dart';
import 'package:dijital_kutuphane/pages/seller_dashboard_page.dart';
import 'package:dijital_kutuphane/pages/seller_inventory_page.dart';
import 'package:dijital_kutuphane/pages/seller_orders_page.dart';

class MainNavigationHolder extends StatefulWidget {
  const MainNavigationHolder({super.key});

  @override
  State<MainNavigationHolder> createState() => _MainNavigationHolderState();
}

class _MainNavigationHolderState extends State<MainNavigationHolder> {
  int _selectedIndex = 0;

  List<Widget> get _pages => isSellerMode
      ? [const SellerDashboard(), const SellerInventory(), const SellerOrders(), const ProfilePage()]
      : [const UserHome(), const MyLibrary(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: isSellerMode ? Colors.indigo : Colors.deepPurple,
        items: isSellerMode
            ? const [
          BottomNavigationBarItem(icon: Icon(Icons.space_dashboard_rounded), label: 'Panel'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2_rounded), label: 'Stoklar'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_rounded), label: 'Siparişler'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profil'),
        ]
            : const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Anasayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.book_rounded), label: 'Kitaplığım'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profil'),
        ],
      ),
    );
  }
}
