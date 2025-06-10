import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool _isNotificationsEnabled = true;

  void _toggleNotifications(bool value) {
    setState(() {
      _isNotificationsEnabled = value;
    });
  }

  void _sendTestNotification() {
    if (_isNotificationsEnabled) {
      NotificationService.showNotification(
        title: 'Test Bildirimi',
        body: 'Bu bir test bildirimidir.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bildirim Ayarları'),
        backgroundColor: Color(0xFF7C4DFF),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: SwitchListTile(
              title: Text(
                'Bildirimleri Etkinleştir',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Uygulama bildirimlerini aç/kapat',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              value: _isNotificationsEnabled,
              onChanged: _toggleNotifications,
              activeColor: Color(0xFF7C4DFF),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF7C4DFF),
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: _isNotificationsEnabled ? _sendTestNotification : null,
            child: Text(
              'Test Bildirimi Gönder',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
} 