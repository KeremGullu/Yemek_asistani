from flask import Flask, jsonify, request, send_file
from flask_cors import CORS
import base64
import io

app = Flask(__name__)
CORS(app, resources={
    r"/*": {
        "origins": "*",
        "methods": ["GET", "POST", "OPTIONS"],
        "allow_headers": ["Content-Type", "Authorization"]
    }
})

yemekler = [
    {"ad": "Tavuk Pilav", "kalori": 550},
    {"ad": "Mercimek Çorbası", "kalori": 120},
    {"ad": "Kırmızı Et", "kalori": 250},
    {"ad": "Baklava", "kalori": 320},
    {"ad": "Elmalı Tatlı", "kalori": 120},
    {"ad": "Kuru Fasulye", "kalori": 250},
    {"ad": "hot dog", "kalori": 400},
    {"ad": "Tiramisu", "kalori": 550},
]

@app.route('/yemekler')
def get_yemekler():
    return jsonify(yemekler)

@app.route('/predict', methods=['POST', 'OPTIONS'])
def predict():
    if request.method == 'OPTIONS':
        return '', 200
        
    try:
        # Gelen veriyi kontrol et
        if 'file' not in request.files and 'image' not in request.json:
            return jsonify({
                "success": False,
                "error": "Dosya veya görüntü verisi bulunamadı"
            }), 400

        # Dosya veya base64 görüntü verisi al
        if 'file' in request.files:
            file = request.files['file']
            # Dosya işleme
        elif 'image' in request.json:
            # Base64 görüntü verisi işleme
            image_data = request.json['image']
            
        # Burada görüntü işleme yapılacak
        # Şimdilik sabit bir yanıt dönelim
        return jsonify({
            "success": True,
            "message": "Görüntüdeki yemek elmalı pasta olabilir. Yaklaşık 320 kalori içerir. Üzerindeki elma deseni dikkat çekici!",
            "predicted_food": "Elmalı Pasta",
            "estimated_calories": "320"
        })
        
    except Exception as e:
        print(f"Hata oluştu: {str(e)}")  # Hata logla
        return jsonify({
            "success": False,
            "error": str(e)
        }), 500

if __name__ == '__main__':
    app.run(host='localhost', port=8504, debug=True)
