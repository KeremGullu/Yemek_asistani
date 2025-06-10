import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            SizedBox(height: 16),
            Text('Kullanıcı Adı', style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text('kullanici@mail.com'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Profili Düzenle'),
            ),
          ],
        ),
      ),
    );
  }
}
