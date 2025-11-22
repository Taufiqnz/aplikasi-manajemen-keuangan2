import 'package:flutter/material.dart';
import 'kategori_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,

      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 50),
            menuButton("Day"),
            menuButton("Week"),
            menuButton("Month"),
            menuButton("Year"),
            menuButton("All"),
            menuButton("Interval"),
          ],
        ),
      ),

      endDrawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 50),
            iconMenu(Icons.category, "Categories"),
            const SizedBox(height: 30),
            iconMenu(Icons.settings, "Setting"),
            const SizedBox(height: 30),
            iconMenu(Icons.chat, "Chatbot"),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(36),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => _scaffoldKey.currentState!.openDrawer(),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey[400],
                        ),
                      ),

                      Column(
                        children: const [
                          Text(
                            'Hii, Username',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Good Morning',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      GestureDetector(
                        onTap: () => _scaffoldKey.currentState!.openEndDrawer(),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),
                  const Text(
                    'Your Money',
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '\$ 10,000,000',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '\$ 2,000,000',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(height: 18),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: const Text('+ Add Transaction'),
                ),
              ),
            ),

            const SizedBox(height: 18),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KategoriPage(),
                          ),
                        );
                      },
                      child: const CategoryCard(
                        title: "Kategori kategori",
                        percent: "50%",
                      ),
                    ),
                    const SizedBox(height: 12),

                    const CategoryCard(
                      title: "Kategori kategori",
                      percent: "20%",
                    ),
                    const SizedBox(height: 12),

                    const CategoryCard(
                      title: "Kategori kategori",
                      percent: "20%",
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String percent;

  const CategoryCard({super.key, required this.title, required this.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 18, backgroundColor: Colors.grey[400]),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 14))),
          Text(percent, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

Widget menuButton(String text) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(child: Text(text)),
  );
}

Widget iconMenu(IconData icon, String text) {
  return Column(
    children: [Icon(icon, size: 40), const SizedBox(height: 6), Text(text)],
  );
}
