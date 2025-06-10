import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Yemek Asistanı",
          style: TextStyle(
            color: Color(0xFF7C4DFF),
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Hoşgeldin Kartı
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.restaurant_menu, size: 48, color: Color(0xFF7C4DFF)),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hoş Geldiniz!",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF7C4DFF),
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Yemek Asistanı uygulamasına hoş geldiniz.",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Ana Butonlar
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  _HomeCardButton(
                    icon: Icons.camera_alt,
                    label: "Kamera",
                    onTap: () => Navigator.pushNamed(context, '/camera'),
                  ),
                  _HomeCardButton(
                    icon: Icons.chat_bubble_outline,
                    label: "Asistan",
                    onTap: () => Navigator.pushNamed(context, '/assistant'),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              // Alt açıklama veya logo
              Text(
                "Yemeklerin fotoğrafını çek, kalorisini öğren!",
                style: TextStyle(color: Colors.black38, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeCardButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _HomeCardButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        width: 140,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Color(0xFF7C4DFF)),
            const SizedBox(height: 18),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF7C4DFF),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 