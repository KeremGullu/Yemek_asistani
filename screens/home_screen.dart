import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 500;

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
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Color(0xFF7C4DFF)),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              children: [
                // Hoşgeldin Kartı
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding: const EdgeInsets.all(20),
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
                // Butonlar
                isWide
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildButtons(context, isWide),
                      )
                    : Column(
                        children: _buildButtons(context, isWide),
                      ),
                const SizedBox(height: 48),
                Text(
                  "Yemeklerin fotoğrafını çek, kalorisini öğren!",
                  style: TextStyle(color: Colors.black38, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildButtons(BuildContext context, bool isWide) {
    final buttonList = [
      _HomeCardButton(
        icon: Icons.camera_alt,
        label: "Kamera",
        onTap: () => Navigator.pushNamed(context, '/camera'),
      ),
      _HomeCardButton(
        icon: Icons.chat_bubble_outline,
        label: "Asistan",
        onTap: () => Navigator.pushNamed(context, '/chatbot'),
      ),
      _HomeCardButton(
        icon: Icons.history,
        label: "Geçmiş",
        onTap: () => Navigator.pushNamed(context, '/history'),
      ),
      _HomeCardButton(
        icon: Icons.person,
        label: "Profil",
        onTap: () => Navigator.pushNamed(context, '/profile'),
      ),
    ];

    if (isWide) {
      return buttonList
          .map((btn) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: btn,
              ))
          .toList();
    } else {
      return buttonList
          .map((btn) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: btn,
              ))
          .toList();
    }
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