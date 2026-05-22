import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:dijital_kutuphane/models/book_data.dart';
import 'package:dijital_kutuphane/pages/cart_page.dart';
import 'package:dijital_kutuphane/pages/book_detail_page.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  // Türler için ikonlu yeni yapı
  final List<Map<String, dynamic>> _categories = [
    {"name": "Tümü", "icon": Icons.apps_rounded},
    {"name": "Roman", "icon": Icons.auto_stories_rounded},
    {"name": "Tarih", "icon": Icons.history_edu_rounded},
    {"name": "Bilim", "icon": Icons.science_rounded},
    {"name": "Yazılım", "icon": Icons.code_rounded},
  ];
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Teknolojik Arka Plan
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1451187580459-43490279c0fa?q=80&w=1000&auto=format&fit=crop',
              fit: BoxFit.cover,
            ),
          ),
          // Arka plan üzerine tema duyarlı katman
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: isDark 
                    ? Colors.black.withOpacity(0.4) 
                    : Colors.white.withOpacity(0.5), // Aydınlık modda daha belirgin beyazlık
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGlassAppBar(context, isDark),
                  _buildGlassWelcomeCard(),
                  _buildGlassCategories(isDark),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 24, bottom: 12),
                    child: Text(
                      "Öne Çıkanlar",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.deepPurple.shade900,
                      ),
                    ),
                  ),
                  _buildFeaturedBooks(isDark),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 20, bottom: 12),
                    child: Text(
                      "En Çok Okunanlar",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.deepPurple.shade900,
                      ),
                    ),
                  ),
                  _buildTrendBooks(isDark),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassAppBar(BuildContext context, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Dijital Kütüphane",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.deepPurple.shade900,
            ),
          ),
          Row(
            children: [
              _buildGlassIconButton(
                Icons.shopping_cart_outlined,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                ),
                isDark,
              ),
              const SizedBox(width: 10),
              _buildGlassIconButton(Icons.search_rounded, () {}, isDark),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGlassIconButton(IconData icon, VoidCallback onTap, bool isDark) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDark ? Colors.white.withOpacity(0.1) : Colors.deepPurple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: isDark ? Colors.white.withOpacity(0.2) : Colors.deepPurple.withOpacity(0.2)),
            ),
            child: Icon(icon, color: isDark ? Colors.white : Colors.deepPurple.shade800),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassWelcomeCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
        gradient: LinearGradient(
          colors: [
            Colors.cyanAccent.withOpacity(0.5),
            Colors.deepPurple.withOpacity(0.7),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hoş geldin 👋",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Geleceğin kütüphanesinde yeni dünyalar keşfetmeye hazır mısın?",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Türler Kısmı (İyileştirilmiş Tasarım) ---
  Widget _buildGlassCategories(bool isDark) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedCategoryIndex == index;
          final category = _categories[index];
          
          return Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 8, top: 8),
            child: InkWell(
              onTap: () => setState(() => _selectedCategoryIndex = index),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: isSelected 
                      ? Colors.cyanAccent.withOpacity(0.8) 
                      : (isDark ? Colors.white.withOpacity(0.1) : Colors.deepPurple.withOpacity(0.08)),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected 
                        ? Colors.cyanAccent 
                        : (isDark ? Colors.white.withOpacity(0.2) : Colors.deepPurple.withOpacity(0.2)),
                  ),
                  boxShadow: isSelected ? [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 1,
                    )
                  ] : null,
                ),
                child: Row(
                  children: [
                    Icon(
                      category["icon"],
                      size: 18,
                      color: isSelected 
                          ? Colors.black 
                          : (isDark ? Colors.white : Colors.deepPurple.shade800),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      category["name"],
                      style: TextStyle(
                        color: isSelected 
                            ? Colors.black 
                            : (isDark ? Colors.white : Colors.deepPurple.shade800),
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedBooks(bool isDark) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        itemCount: featuredBooks.length,
        itemBuilder: (context, index) {
          final book = featuredBooks[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailPage(
                    title: book["title"]!,
                    author: book["author"]!,
                    image: book["image"]!,
                  ),
                ),
              );
            },
            child: Container(
              width: 150,
              margin: const EdgeInsets.only(right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Hero(
                      tag: book["title"]!,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            book["image"]!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    book["title"]!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    book["author"]!,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTrendBooks(bool isDark) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: trendBooks.length,
      itemBuilder: (context, index) {
        final book = trendBooks[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailPage(
                  title: book["title"]!,
                  author: book["author"]!,
                  image: book["image"]!,
                  price: book["price"],
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: isDark ? Colors.white.withOpacity(0.1) : Colors.deepPurple.withOpacity(0.1)),
              color: isDark ? Colors.white.withOpacity(0.05) : Colors.white.withOpacity(0.7),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          book["image"]!,
                          width: 70,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book["title"]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: isDark ? Colors.white : Colors.black87,
                              ),
                            ),
                            Text(
                              book["author"]!,
                              style: TextStyle(
                                color: isDark ? Colors.white60 : Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              book["price"]!,
                              style: TextStyle(
                                color: isDark ? Colors.cyanAccent : Colors.deepPurple.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isDark ? Colors.cyanAccent.withOpacity(0.1) : Colors.deepPurple.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add_shopping_cart_rounded,
                          color: isDark ? Colors.cyanAccent : Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
