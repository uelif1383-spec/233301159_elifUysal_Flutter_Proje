import 'package:flutter/material.dart';
import 'package:dijital_kutuphane/models/app_state.dart';
import 'package:dijital_kutuphane/pages/main_navigation.dart';
import 'package:dijital_kutuphane/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          "Profilim",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple.shade800,
                    Colors.deepPurple.shade500,
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 33,
                      backgroundColor: Colors.deepPurple,
                      child: Icon(Icons.person, size: 35, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Elif Uysal",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "deneme12@gmail.com",
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
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
                  ValueListenableBuilder<ThemeMode>(
                    valueListenable: themeNotifier,
                    builder: (context, currentMode, _) {
                      return SwitchListTile(
                        title: const Text(
                          "Karanlık Mod",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text("Uygulama temasını değiştirir"),
                        value: currentMode == ThemeMode.dark,
                        activeColor: Colors.deepPurple,
                        secondary: Icon(
                          currentMode == ThemeMode.dark
                              ? Icons.dark_mode_rounded
                              : Icons.light_mode_rounded,
                          color: currentMode == ThemeMode.dark
                              ? Colors.amber
                              : Colors.grey,
                        ),
                        onChanged: (val) {
                          themeNotifier.value = val
                              ? ThemeMode.dark
                              : ThemeMode.light;
                        },
                      );
                    },
                  ),
                  SwitchListTile(
                    title: const Text(
                      "Satıcı Modu",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      "Mağaza yönetim arayüzüne geçiş yapar",
                    ),
                    value: isSellerMode,
                    activeColor: Colors.deepPurple,
                    secondary: Icon(
                      Icons.storefront_rounded,
                      color: isSellerMode ? Colors.deepPurple : Colors.grey,
                    ),
                    onChanged: (val) {
                      setState(() {
                        isSellerMode = val;
                      });
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (c) => const MainNavigationHolder(),
                        ),
                        (r) => false,
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.favorite_rounded,
                      color: Colors.redAccent,
                    ),
                    title: const Text(
                      "Sık Kullanılanlar",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings_rounded,
                      color: Colors.blueGrey,
                    ),
                    title: const Text(
                      "Uygulama Ayarları",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout_rounded,
                      color: Colors.red,
                    ),
                    title: const Text(
                      "Çıkış Yap",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Çıkış Yap"),
                          content: const Text(
                            "Hesabınızdan çıkış yapmak istediğinize emin misiniz?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Vazgeç"),
                            ),
                            TextButton(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (c) => const LoginPage(),
                                  ),
                                  (route) => false,
                                );
                              },
                              child: const Text(
                                "Çıkış Yap",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
