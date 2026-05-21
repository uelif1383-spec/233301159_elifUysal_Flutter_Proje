import 'package:flutter/material.dart';

void main() {
  runApp(const DijitalKutuphaneApp());
}

class DijitalKutuphaneApp extends StatelessWidget {
  const DijitalKutuphaneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dijital Kütüphane',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const LoginPage(),
    );
  }
}


bool isSellerMode = false;


final List<Map<String, String>> inventoryBooks = [
  {"title": "Nutuk", "stock": "45", "price": "120 TL", "img": "https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=300&auto=format&fit=crop"},
  {"title": "Suç ve Ceza", "stock": "12", "price": "85 TL", "img": "https://images.unsplash.com/photo-1512820790803-83ca734da794?q=80&w=300&auto=format&fit=crop"},
  {"title": "Sapiens", "stock": "3", "price": "145 TL", "img": "https://images.unsplash.com/photo-1614849963640-9cc74b2a826f?q=80&w=300&auto=format&fit=crop"},
  {"title": "1984", "stock": "0", "price": "105 TL", "img": "https://images.unsplash.com/photo-1512820790803-83ca734da794?q=80&w=300&auto=format&fit=crop"},
];


final List<Map<String, String>> featuredBooks = [
  {
    "title": "Nutuk",
    "author": "M. Kemal Atatürk",
    "image": "https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=300&auto=format&fit=crop"
  },
  {
    "title": "Suç ve Ceza",
    "author": "F. Dostoyevski",
    "image": "https://images.unsplash.com/photo-1512820790803-83ca734da794?q=80&w=300&auto=format&fit=crop"
  },
  {
    "title": "Sapiens",
    "author": "Yuval Noah Harari",
    "image": "https://images.unsplash.com/photo-1614849963640-9cc74b2a826f?q=80&w=300&auto=format&fit=crop"
  },
  {
    "title": "Dune",
    "author": "Frank Herbert",
    "image": "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?q=80&w=300&auto=format&fit=crop"
  }
];

final List<Map<String, String>> trendBooks = [
  {
    "title": "Simyacı",
    "author": "Paulo Coelho",
    "price": "110.00 TL",
    "image": "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?q=80&w=300&auto=format&fit=crop"
  },
  {
    "title": "Kürk Mantolu Madonna",
    "author": "Sabahattin Ali",
    "price": "95.00 TL",
    "image": "https://images.unsplash.com/photo-1532012197267-da84d127e765?q=80&w=300&auto=format&fit=crop"
  },
  {
    "title": "1984",
    "author": "George Orwell",
    "price": "105.00 TL",
    "image": "https://images.unsplash.com/photo-1512820790803-83ca734da794?q=80&w=300&auto=format&fit=crop"
  },
  {
    "title": "Küçük Prens",
    "author": "Antoine de Saint-Exupéry",
    "price": "70.00 TL",
    "image": "https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=300&auto=format&fit=crop"
  }
];


class BookDetailPage extends StatelessWidget {
  final String title;
  final String author;
  final String image;
  final String? price;

  const BookDetailPage({
    super.key,
    required this.title,
    required this.author,
    required this.image,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: image.startsWith('http')
                      ? Image.network(image, height: 280, width: 190, fit: BoxFit.cover)
                      : Container(
                    height: 280,
                    width: 190,
                    color: Colors.deepPurple.shade100,
                    child: const Icon(Icons.book_rounded, size: 80, color: Colors.deepPurple),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 6),
            Text(author, style: const TextStyle(fontSize: 16, color: Colors.grey), textAlign: TextAlign.center),
            const SizedBox(height: 15),
            if (price != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(color: Colors.deepPurple.shade50, borderRadius: BorderRadius.circular(20)),
                child: Text(price!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
              ),
            const SizedBox(height: 25),
            const Divider(),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Kitap Açıklaması", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            Text(
              "Bu eser, kütüphanemizin en seçkin parçalarından biridir. Dijital yayın formatında hemen okumaya başlayabilir veya kiralama seçeneklerini değerlendirebilirsiniz. Keyifli okumalar dileriz.",
              style: TextStyle(fontSize: 15, color: Colors.grey.shade700, height: 1.5),
            ),
            const SizedBox(height: 35),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_add_outlined),
                    label: const Text("Listeme Ekle"),
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(price != null ? "Satın Al" : "Okumaya Başla"),
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


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController(text: 'deneme12@gmail.com');
  final TextEditingController _passwordController = TextEditingController(text: 'mobil12');

  void _handleLogin() {
    if (_emailController.text == 'deneme12@gmail.com' && _passwordController.text == 'mobil12') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavigationHolder()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hatalı giriş! Bilgileri kontrol edin.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.deepPurple.shade900, Colors.deepPurple.shade400]),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.menu_book_rounded, size: 80, color: Colors.deepPurple),
                    const SizedBox(height: 15),
                    const Text("Dijital Kütüphane", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 25),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: "E-posta", prefixIcon: Icon(Icons.email)),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Şifre", prefixIcon: Icon(Icons.lock)),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text("Giriş Yap", style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Hesabınız yok mu? "),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterPage()),
                            );
                          },
                          child: const Text("Kayıt Ol", style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.deepPurple.shade900, Colors.deepPurple.shade500]),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.person, size: 70, color: Colors.deepPurple),
                    const SizedBox(height: 10),
                    const Text("Yeni Hesap Oluştur", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: "Ad Soyad", prefixIcon: Icon(Icons.person)),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: "E-posta", prefixIcon: Icon(Icons.email)),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Şifre", prefixIcon: Icon(Icons.lock)),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Kayıt Başarılı! Giriş yapabilirsiniz.')),
                          );
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text("Kayıt Ol", style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class MainNavigationHolder extends StatefulWidget {
  const MainNavigationHolder({super.key});

  @override
  State<MainNavigationHolder> createState() => _MainNavigationHolderState();
}

class _MainNavigationHolderState extends State<MainNavigationHolder> {
  int _selectedIndex = 0;

  List<Widget> get _pages => isSellerMode
      ? [const SellerDashboard(), const SellerInventory(), const ProfilePage()]
      : [const UserHome(), const MyLibrary(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: isSellerMode ? Colors.indigo : Colors.deepPurple,
        items: isSellerMode
            ? const [
          BottomNavigationBarItem(icon: Icon(Icons.space_dashboard_rounded), label: 'Panel'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2_rounded), label: 'Stoklar'),
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


class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final List<String> _categories = ["Tümü", "Roman", "Tarih", "Bilim", "Yazılım"];
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text("Dijital Kitaplığım", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.search_rounded), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.deepPurple.shade700, Colors.deepPurple.shade400]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hoş geldin, Elif 👋", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("Bugün yeni dünyalar keşfetmeye ne dersin?", style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),


            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedCategoryIndex == index;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                      label: Text(_categories[index]),
                      selected: isSelected,
                      selectedColor: Colors.deepPurple,
                      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black87),
                      onSelected: (val) => setState(() => _selectedCategoryIndex = index),
                    ),
                  );
                },
              ),
            ),


            const Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
              child: Text("Öne Çıkanlar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 220,
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
                      width: 130,
                      margin: const EdgeInsets.only(right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(book["image"]!, fit: BoxFit.cover, width: double.infinity),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(book["title"]!, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                          Text(book["author"]!, style: const TextStyle(color: Colors.grey, fontSize: 12), maxLines: 1),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),


            const Padding(
              padding: EdgeInsets.only(left: 16, top: 20, bottom: 12),
              child: Text("En Çok Okunanlar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ListView.builder(
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
                  child: Card(
                    margin: const EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(book["image"]!, width: 60, height: 80, fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(book["title"]!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Text(book["author"]!, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                                const SizedBox(height: 8),
                                Text(book["price"]!, style: TextStyle(color: Colors.deepPurple.shade700, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          IconButton(icon: const Icon(Icons.add_shopping_cart_rounded, color: Colors.deepPurple), onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


class MyLibrary extends StatelessWidget {
  const MyLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Kitaplığım", style: TextStyle(fontWeight: FontWeight.bold)),
          bottom: const TabBar(
            indicatorColor: Colors.deepPurple,
            labelColor: Colors.deepPurple,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Okunanlar"),
              Tab(text: "Bitenler"),
              Tab(text: "Alınanlar"),
            ],
          ),
        ),
        body: TabBarView(
          children: [

            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildLibraryBookItem(context, "Nutuk", "M. Kemal Atatürk", 0.65, "Sayfa 240 / 400", "https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=300&auto=format&fit=crop"),
                _buildLibraryBookItem(context, "Sapiens", "Yuval Noah Harari", 0.15, "Sayfa 45 / 420", "https://images.unsplash.com/photo-1614849963640-9cc74b2a826f?q=80&w=300&auto=format&fit=crop"),
              ],
            ),

            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildFinishedLibraryItem(context, "Suç ve Ceza", "F. Dostoyevski", "https://images.unsplash.com/photo-1512820790803-83ca734da794?q=80&w=300&auto=format&fit=crop"),
                _buildFinishedLibraryItem(context, "Küçük Prens", "A. Saint-Exupéry", "https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=300&auto=format&fit=crop"),
              ],
            ),

            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildDownloadedLibraryItem(context, "Simyacı", "Paulo Coelho", "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?q=80&w=300&auto=format&fit=crop"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLibraryBookItem(BuildContext context, String title, String author, double progress, String pageInfo, String imgUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailPage(title: title, author: author, image: imgUrl)));
      },
      child: Card(
        margin: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(6), child: Image.network(imgUrl, width: 45, height: 65, fit: BoxFit.cover)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(author, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    const SizedBox(height: 6),
                    LinearProgressIndicator(value: progress, color: Colors.deepPurple, backgroundColor: Colors.grey.shade200),
                    const SizedBox(height: 4),
                    Text(pageInfo, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFinishedLibraryItem(BuildContext context, String title, String author, String imgUrl) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailPage(title: title, author: author, image: imgUrl)));
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: ListTile(
          leading: ClipRRect(borderRadius: BorderRadius.circular(4), child: Image.network(imgUrl, width: 40, height: 55, fit: BoxFit.cover)),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(author),
          trailing: const Icon(Icons.check_circle_rounded, color: Colors.green),
        ),
      ),
    );
  }

  Widget _buildDownloadedLibraryItem(BuildContext context, String title, String author, String imgUrl) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailPage(title: title, author: author, image: imgUrl)));
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: ListTile(
          leading: ClipRRect(borderRadius: BorderRadius.circular(4), child: Image.network(imgUrl, width: 40, height: 55, fit: BoxFit.cover)),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(author),
          trailing: const Icon(Icons.cloud_done_rounded, color: Colors.blue),
        ),
      ),
    );
  }
}


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
              child: Text("Haftalık Satış Analizi (TL)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
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

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 4),
              child: Text("Son Satış ve Sipariş Logları", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            ),


            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                final String invoiceId = "#2026-${100 + index}";
                final String details = index == 0 ? "1984 - Dijital Satış" : "Dune - Kiralama";
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple.shade100,
                      child: Icon(Icons.receipt_long_rounded, color: Colors.deepPurple.shade800),
                    ),
                    title: Text("Fatura $invoiceId"),
                    subtitle: Text(details),
                    trailing: const Text("+145 TL", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                    onTap: () {
                      _showInvoiceActionSheet(context, invoiceId, details);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernPurpleCard(String title, String val, IconData icon, Color mainColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: mainColor.withOpacity(0.2), width: 1.5),
          boxShadow: [BoxShadow(color: mainColor.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w600)),
                Icon(icon, color: mainColor, size: 20),
              ],
            ),
            const SizedBox(height: 12),
            Text(val, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: mainColor)),
          ],
        ),
      ),
    );
  }

  Widget _buildBarSim(String day, double height, BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("$day günü ciro performansı: %${height.toInt()}")),
            );
          },
          child: Container(
            height: height,
            width: 14,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.deepPurple.shade300, Colors.deepPurple.shade700],
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(day, style: const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label, Color color) {
    return Expanded(
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$label modülü tetiklendi.")));
          },
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              children: [
                Icon(icon, color: color, size: 24),
                const SizedBox(height: 4),
                Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showInvoiceActionSheet(BuildContext context, String id, String item) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text("$id Detayları"),
                subtitle: Text(item),
              ),
              ListTile(
                leading: const Icon(Icons.print_rounded, color: Colors.indigo),
                title: const Text("Faturayı Yazdır / PDF İndir"),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.refresh_rounded, color: Colors.orange),
                title: const Text("İşlemi İade Et"),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }
}


class SellerInventory extends StatefulWidget {
  const SellerInventory({super.key});

  @override
  State<SellerInventory> createState() => _SellerInventoryState();
}

class _SellerInventoryState extends State<SellerInventory> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();

  void _openAddBookSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Yeni Kitap Tanımla", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
              const SizedBox(height: 15),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Kitap Adı", prefixIcon: Icon(Icons.book_rounded)),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: "Birim Fiyat (Örn: 120 TL)", prefixIcon: Icon(Icons.sell_rounded)),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _stockController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Stok Adeti", prefixIcon: Icon(Icons.unarchive_rounded)),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
                  onPressed: () {
                    if (_titleController.text.isNotEmpty && _priceController.text.isNotEmpty) {
                      setState(() {
                        inventoryBooks.add({
                          "title": _titleController.text,
                          "stock": _stockController.text.isEmpty ? "1" : _stockController.text,
                          "price": _priceController.text.contains("TL") ? _priceController.text : "${_priceController.text} TL",
                          "img": "icon_placeholder"
                        });
                      });
                      _titleController.clear();
                      _priceController.clear();
                      _stockController.clear();
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Yeni kitap envantere eklendi!")));
                    }
                  },
                  child: const Text("Envantere İşle"),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        title: const Text("Envanter & Stok", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple.shade800,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: inventoryBooks.length,
        itemBuilder: (context, index) {
          final item = inventoryBooks[index];
          final int stockCount = int.parse(item["stock"]!);
          final bool isPlaceholder = item["img"] == "icon_placeholder";

          return Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: isPlaceholder
                        ? Container(
                      width: 55,
                      height: 75,
                      color: Colors.deepPurple.shade50,
                      child: const Icon(Icons.book_rounded, color: Colors.deepPurple),
                    )
                        : Image.network(item["img"]!, width: 55, height: 75, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item["title"]!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text("Birim Fiyat: ${item["price"]}", style: const TextStyle(color: Colors.grey, fontSize: 13)),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: stockCount == 0 ? Colors.red.shade50 : Colors.deepPurple.shade50,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                "Stok: $stockCount Adet",
                                style: TextStyle(
                                  color: stockCount == 0 ? Colors.red.shade700 : Colors.deepPurple.shade700,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_note_rounded, color: Colors.indigo),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurple.shade800,
        foregroundColor: Colors.white,
        onPressed: _openAddBookSheet,
        icon: const Icon(Icons.add_to_photos_rounded),
        label: const Text("Yeni Barkod Tanımla"),
      ),
    );
  }
}


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text("Profilim", style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.deepPurple.shade800, Colors.deepPurple.shade500]),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: Colors.deepPurple.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 5))],
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(radius: 33, backgroundColor: Colors.deepPurple, child: Icon(Icons.person, size: 35, color: Colors.white)),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Elif Uysal", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                        SizedBox(height: 4),
                        Text("deneme12@gmail.com", style: TextStyle(color: Colors.white70, fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatWidget("2", "Okunan"),
                  _buildStatWidget("2", "Biten"),
                  _buildStatWidget("1", "Alınan"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Divider(indent: 16, endIndent: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text("Satıcı Modu", style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text("Mağaza yönetim arayüzüne geçiş yapar"),
                    value: isSellerMode,
                    activeColor: Colors.deepPurple,
                    secondary: Icon(Icons.storefront_rounded, color: isSellerMode ? Colors.deepPurple : Colors.grey),
                    onChanged: (val) {
                      setState(() {
                        isSellerMode = val;
                      });
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c) => const MainNavigationHolder()), (r) => false);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite_rounded, color: Colors.redAccent),
                    title: const Text("Sık Kullanılanlar", style: TextStyle(fontWeight: FontWeight.w500)),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings_rounded, color: Colors.blueGrey),
                    title: const Text("Uygulama Ayarları", style: TextStyle(fontWeight: FontWeight.w500)),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout_rounded, color: Colors.red),
                    title: const Text("Çıkış Yap", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.red)),
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const LoginPage())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatWidget(String value, String label) {
    return Expanded(
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
              const SizedBox(height: 2),
              Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}