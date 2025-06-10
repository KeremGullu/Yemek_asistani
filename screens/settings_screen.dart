import 'package:flutter/material.dart';
import 'notification_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
        backgroundColor: Color(0xFF7C4DFF),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildSettingCard(
            icon: Icons.notifications,
            title: 'Bildirimler',
            subtitle: 'Bildirim ayarlarını düzenle',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationSettingsScreen(),
              ),
            ),
          ),
          _buildSettingCard(
            icon: Icons.language,
            title: 'Dil',
            subtitle: 'Uygulama dilini değiştir',
            onTap: () {},
          ),
          _buildSettingCard(
            icon: Icons.dark_mode,
            title: 'Tema',
            subtitle: 'Koyu/Açık tema seçimi',
            onTap: () {},
          ),
          _buildSettingCard(
            icon: Icons.info,
            title: 'Hakkında',
            subtitle: 'Uygulama bilgileri',
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Yemek Asistanı',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2024 Yemek Asistanı',
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFF7C4DFF).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Color(0xFF7C4DFF)),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
} 