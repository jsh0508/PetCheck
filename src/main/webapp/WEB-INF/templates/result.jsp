<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Deep Learning Model Result</title>
</head>
<body>
    <h1>Deep Learning Model Result</h1>
    <img id="resultImage" src="" alt="Result Image">
    <script>
        // 백엔드에서 받은 이미지 데이터를 <img> 태그의 src 속성에 설정
        const resultImage = document.getElementById("resultImage");
        const resultImageData = "{{ result_image }}";  // Flask로부터 전달받은 이미지 데이터
        resultImage.src = `data:image/jpeg;base64,${resultImageData}`;
    </script>
</body>
</html>