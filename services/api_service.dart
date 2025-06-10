import 'dart:convert';
import 'package:http/http.dart' as http;

// API URL'si
const String baseUrl = 'https://8b71-176-220-143-199.ngrok-free.app';

// Görüntü tahmini için fonksiyon
Future<Map<String, dynamic>> predictImage(String base64Image) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/predict'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'image': base64Image,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("API Hatası: ${response.statusCode}\n${response.body}");
    }
  } catch (e) {
    throw Exception("Bağlantı hatası: $e");
  }
}

// Yemek bilgisi almak için fonksiyon
Future<String> getYemekBilgisi(String prompt) async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/yemekler'),
    );

    if (response.statusCode == 200) {
      List<dynamic> yemekler = jsonDecode(response.body);
      prompt = prompt.toLowerCase();
      
      for (var yemek in yemekler) {
        if (prompt.contains(yemek['ad'].toString().toLowerCase())) {
          return "${yemek['ad']} yaklaşık ${yemek['kalori']} kaloridir.";
        }
      }
      return "Üzgünüm, bu yemek hakkında bilgim yok. Lütfen başka bir yemek sorun.";
    } else {
      throw Exception("API Hatası: ${response.statusCode}");
    }
  } catch (e) {
    print("API hatası: $e");
    // Yerel yanıtlara geç
    return getLocalResponse(prompt);
  }
}

// Yerel yanıtlar için yedek fonksiyon
Future<String> getLocalResponse(String prompt) async {
  prompt = prompt.toLowerCase();
  if (prompt.contains('tavuk pilav') || prompt.contains('pilav')) {
    return 'Tavuk pilav yaklaşık 550 kaloridir. Bu porsiyon genellikle 200g pilav ve 150g tavuk içerir.';
  } else if (prompt.contains('mercimek')) {
    return 'Bir kase mercimek çorbası (250ml) yaklaşık 120 kaloridir.';
  } else if (prompt.contains('kırmızı et')) {
    return 'Orta boy bir porsiyon (150g) kırmızı et yaklaşık 250 kaloridir. Protein ve demir açısından zengindir.';
  } else if (prompt.contains('baklava')) {
    return 'Bir dilim baklava yaklaşık 320 kaloridir. Yüksek şeker ve yağ içeriğine sahiptir.';
  } else if (prompt.contains('elmalı')) {
    return 'Bir porsiyon elmalı tatlı yaklaşık 120 kaloridir. Diğer tatlılara göre daha düşük kalorilidir.';
  } else if (prompt.contains('kuru fasulye')) {
    return 'Bir porsiyon kuru fasulye yaklaşık 250 kaloridir. Protein ve lif açısından zengindir.';
  } else if (prompt.contains('hot dog')) {
    return 'Bir adet hot dog yaklaşık 400 kaloridir. İşlenmiş et ürünü olduğu için dikkatli tüketilmelidir.';
  } else if (prompt.contains('tiramisu')) {
    return 'Bir dilim tiramisu yaklaşık 550 kaloridir. Kafein ve şeker içeriği yüksektir.';
  } else {
    return "Üzgünüm, bu yemek hakkında bilgim yok. Lütfen başka bir yemek sorun.";
  }
}

// Ana fonksiyon - geriye uyumluluk için ismi aynı bırakıldı
Future<String> callClaudeAPI(String prompt) async {
  return getYemekBilgisi(prompt);
}