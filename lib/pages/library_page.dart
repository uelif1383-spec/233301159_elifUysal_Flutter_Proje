import 'package:flutter/material.dart';
import 'package:dijital_kutuphane/pages/book_detail_page.dart';

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
