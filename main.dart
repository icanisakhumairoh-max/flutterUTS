import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog QUEENDA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // PERBAIKAN: Huruf 'C' harus kapital dan tanpa 's' di akhir kata color
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// --- SCREEN 1: HALAMAN UTAMA ---
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QUEENDA Wedding Organizer"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_bag, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              "Selamat Datang di Katalog Kami",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductList()),
                );
              },
              icon: const Icon(Icons.list),
              label: const Text("Lihat Daftar Produk"),
            ),
          ],
        ),
      ),
    );
  }
}

// --- SCREEN 2: DAFTAR PRODUK ---
class ProductList extends StatelessWidget {
  const ProductList({super.key});

  final List<Map<String, String>> gadgetItems = const [
      {"nama": "Undangan", "harga": "Rp 2.000"},
      {"nama": "Frame Mahar", "harga": "Rp 150.000"},
      {"nama": "Sewa Box Seserahan", "harga": "Rp 50.000"},
      {"nama": "Souvenir", "harga": "Rp 11.000"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pilih Jenis Barang")),
      body: ListView.builder(
        itemCount: gadgetItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.devices),
            title: Text(gadgetItems[index]["nama"]!),
            subtitle: Text(gadgetItems[index]["harga"]!),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    item: gadgetItems[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// --- SCREEN 3: DETAIL PRODUK ---
class DetailScreen extends StatelessWidget {
  final Map<String, String> item;
  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Spesifikasi Produk")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(Icons.image, size: 80, color: Colors.grey),
            ),
            const SizedBox(height: 25),
            Text(
              item["nama"]!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Harga: ${item["harga"]}",
              style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
            const SizedBox(height: 20),
            const Text(
              "Produk ini untuk memenuhi kebutuhan Wedding anda",
              textAlign: TextAlign.justify,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Kembali"),
              ),
            )
          ],
        ),
      ),
    );
  }
}