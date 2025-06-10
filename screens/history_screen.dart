import 'package:flutter/material.dart';
import 'camera_screen.dart'; // globalHistory'yi kullanmak için

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Geçmiş')),
      body: ListView.builder(
        itemCount: globalHistory.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.fastfood),
              title: Text(globalHistory[index]),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          globalHistory.clear();
          // Ekranı yenilemek için
          (context as Element).reassemble();
        },
        child: Icon(Icons.delete),
        tooltip: "Geçmişi Temizle",
      ),
    );
  }
}
