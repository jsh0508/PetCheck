from flask import Flask, render_template, jsonify, request
from PIL import Image
import io
import base64
import numpy as np
from flask_cors import CORS
import torch

app = Flask(__name__)

model = torch.hub.load('ultralytics/yolov5', 'custom', path='best_class3.pt', force_reload=True)


# 딥러닝 모델 결과 이미지 생성 함수
def generate_result_image():
    result_image = Image.new("RGB", (300, 300), color=(255, 0, 0))
    result_image_byte = io.BytesIO()
    result_image.save(result_image_byte, format="JPEG")
    result_image_base64 = base64.b64encode(result_image_byte.getvalue()).decode("utf-8")
    return result_image_base64

@app.route("/")
def index():
    return render_template('index.html')


@app.route('/result', methods=['GET', 'POST'])
def detect():
    im_file = request.files['image']
    if im_file.filename != '':
        im_bytes = im_file.read()
        img = Image.open(io.BytesIO(im_bytes))

        result = model(img)
        result.render()
        for img in result.ims:
            result_image_byte = io.BytesIO()
            img_base64 = Image.fromarray(img)
            img_base64.save(result_image_byte, format="JPEG")
            result_image_base64 = base64.b64encode(result_image_byte.getvalue()).decode("utf-8")
            return render_template('result.html', result_image = result_image_base64)
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, threaded=True, debug=True)