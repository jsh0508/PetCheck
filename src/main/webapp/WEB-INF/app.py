from flask import Flask, render_template, jsonify
from PIL import Image
import io
import base64
import numpy as np

app = Flask(__name__)

# 딥러닝 모델 결과 이미지 생성 함수
def generate_result_image():
    result_image = Image.new("RGB", (300, 300), color=(255, 0, 0))
    result_image_byte = io.BytesIO()
    result_image.save(result_image_byte, format="JPEG")
    result_image_base64 = base64.b64encode(result_image_byte.getvalue()).decode("utf-8")
    return result_image_base64

@app.route('/')
def index():
    result_image_base64 = generate_result_image()
    return render_template('result.jsp', result_image=result_image_base64)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, threaded=True)