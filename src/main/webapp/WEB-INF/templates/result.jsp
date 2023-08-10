<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Deep Learning Model Result</title>
</head>

<style>
/*폰트*/
@font-face {
	src: url("../fonts/GowunDodum-Regular.ttf");
	font-family: "Gowun Dodum";
}

@font-face {
	src: url("../fonts/Jua-Regular.ttf");
	font-family: "Jua";
}

body {
	font-size: 14pt;
}

/*전체 폰트 적용(fontawesome은 제외)*/
*:not(i) {
	font-family: "Gowun Dodum", "Jua";
}

/* nav */
.navbar-brand {
	margin-left: 4.2%;
}

.nav-item {
	margin-right: 50px;
}

.fa-solid.fa-shield-dog {
	margin-right: 5px;
}

/* about 페이지 */
#aboutNav {
	padding: 0;
	background-color: white;
	box-shadow: inset 0px 1px 0px #f7f7f8;
}

.about-header-icon {
	width: 10%;
	height: 10%;
	margin-bottom: 3%;
}

.dog-skin {
	border-radius: 25px;
	width: 100%;
	height: 92%;
}

.top-button {
	position: fixed;
	bottom: 11%;
	right: 15px;
	width: 40px;
	height: 40px;
	z-index: 1;
	opacity: 0.5;
}

.down-button {
	position: fixed;
	bottom: 5%;
	right: 15px;
	width: 40px;
	height: 40px;
	z-index: 1;
	opacity: 0.5;
}

.giphy-logo {
	width: 16px;
}
/*content*/
.contents {
	margin: 30px auto;
	text-align: center;
}

.container {
	display: flex;
	height: 100%;
	flex-direction: column;
}

.button {
	justify-content: center;
}

.sample-label {
	margin-top: 2%;
	width: 40%;
	height: 6%;
	margin-bottom: 2%;
	text-align: center;
	background-color: #f7f6dc;
	border-radius: 15px;
	cursor: default;
	font-size: 1em;
}

.sample-label.right {
	margin-top: 2%;
	width: 60%;
	height: 6%;
	margin-bottom: 2%;
	text-align: center;
	background-color: #eeeeee;
	border-radius: 15px;
	cursor: default;
}

.sample-image {
	width: 200px;
	height: 200px;
	margin-right: 2%;
}

.form-control {
	margin: 0 auto;
	width: 75%;
}

.submit-btn {
	margin-top: 2%;
	display: inline-block;
}

.col-md-6.detect, .col-md-6.result-col {
	text-align: center;
}

/*로딩 화면*/
#load {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	opacity: 0.8;
	background: white;
	position: fixed;
	text-align: center;
	z-index: 1000; /* 이 값으로 레이어의 위치를 조정합니다. */
}

#load>img {
	top: 50%;
	left: 50%;
}

/*logo*/
.bi.bi-arrow-up-right, .bi.bi-box-arrow-up-right {
	font-size: 0.7rem;
	vertical-align: 0.425em;
	margin-left: 0.1rem;
}

.giphy-logo {
	vertical-align: 0.03em;
	width: 1rem;
}

/*result page*/
.result-img {
	width: 580px;
	height: 580px;
}

.result-left {
	width: 50%;
	text-align: center;
	background-color: #f7f6dc;
	border-radius: 15px;
	margin: 0 auto 2%;
}

.result-right {
	width: 50%;
	text-align: center;
	background-color: #eeeeee;
	border-radius: 15px;
	margin: 0 auto 2%;
}

.result-sample-img {
	width: 105px;
	height: 118px;
	float: left;
	margin-right: 1rem;
}

.paragraph {
	margin-right: 10%;
}

.paragraph a {
	text-decoration: none;
	color: #969ea0;
	float: right;
}

#deck-container {
	margin: 0 auto 1%;
	width: 90vw;
	height: 80vh;
}

/*404 page*/
.clearfix:before, .clearfix:after {
	display: table;
	content: " ";
}

.clearfix:after {
	clear: both;
}

.page-404 .outer {
	position: absolute;
	top: 0;
	background: #f0f0f0 !important;
	display: table;
	width: 100%;
	height: 100%;
}

.page-404 .outer .middle {
	display: table-cell;
	vertical-align: middle;
}

.page-404 .outer .middle .inner {
	width: 300px;
	margin-right: auto;
	margin-left: auto;
}

.page-404 .outer .middle .inner .inner-circle {
	height: 300px;
	border-radius: 50%;
	background-color: #ffffff;
}

.page-404 .outer .middle .inner .inner-circle:hover i {
	color: #39bbdb !important;
	background-color: #f5f5f5;
	box-shadow: 0 0 0 15px #39bbdb;
}

.page-404 .outer .middle .inner .inner-circle:hover span {
	color: #39bbdb;
}

.page-404 .outer .middle .inner .inner-circle i {
	font-size: 5em;
	line-height: 1em;
	float: right;
	width: 1.6em;
	height: 1.6em;
	margin-top: -0.7em;
	margin-right: -0.5em;
	padding: 20px;
	-webkit-transition: all 0.4s;
	transition: all 0.4s;
	text-align: center;
	color: #f5f5f5 !important;
	border-radius: 50%;
	background-color: #39bbdb;
	box-shadow: 0 0 0 15px #f0f0f0;
}

.page-404 .outer .middle .inner .inner-circle span {
	font-size: 11em;
	font-weight: 700;
	line-height: 1.2em;
	display: block;
	-webkit-transition: all 0.4s;
	transition: all 0.4s;
	text-align: center;
	color: #e0e0e0;
}

.page-404 .outer .middle .inner .inner-status {
	font-size: 20px;
	display: block;
	margin-top: 20px;
	margin-bottom: 5px;
	text-align: center;
	color: #39bbdb;
}

.page-404 .outer .middle .inner .inner-detail {
	line-height: 1.4em;
	display: block;
	margin-bottom: 10px;
	text-align: center;
	color: #999999;
}
</style>

<body>
	<div class="grid ">

		<div class="row">
			<div class="col text-center">
				<p>
					📍 바운딩 박스 형태 : 증상명 + 숫자 <br>📍 숫자는 Confidence로 확률을 의미하며 0부터 1
					미만의 값을 가집니다 <br>📍 탐지가 되지 않았어요 ➡️ Petom은 confidence 값이 0.25
					이상인 경우에만 박스가 표시됩니다 <br>🐾 예: erosion_ulcer 0.69 ➡️ 69%의 확률로
					미란∙궤양 증상이라는 의미입니다
				</p>

			</div>
		</div>

		<div class="row">
			<div class="col-md-6 result-col">
				<p class="result-left">탐지 결과</p>
				<img class="result-img"
					src="data:image/jpeg;base64,{{ result_image }}" alt="결과">
			</div>
			<div class="col-md-6 result-explanation">
				<p class="result-right">결과 설명</p>
				<img class="result-sample-img"
					src="static/img/result_sample_eu.png" title="미란∙궤양 결과 샘플">
				<p class="paragraph">
					<strong>Erosion(미란)</strong> : 피부의 표층에 국한되는 조직결손을 말한다. 치유 후에 흉터를
					남기지 않고 완전히 치유된다. 표피까지 얕은 수준의 궤양을 말하며 반흔을 남기지 않는다. 고름딱지나 물집이 터진 후
					표피만 떨어져 나가 생기며 이곳은 딱지가 형성되거나 형성되지 않을 수도 있으나 흉터 없이 치유된다. <a
						href="http://www.kmle.co.kr/ebook_terminology_view.php?Num=625&Md=df2b823da96ba24548e102528f460dd5&TitleLetter=%B9%CC%B6%F5%3A+erosion"
						target="_blank">출처<i class="bi bi-box-arrow-up-right"></i></a>
				</p>
				<p class="paragraph">
					<strong>Ulcer(궤양)</strong> : 염증, 괴사로 인해 상피가 탈락하여 조직표면이 국소적으로 결손되거나
					함몰된 것을 의미한다. 궤양은 조직의 염증이 진행되어 발생하거나 조직으로의 산소 및 영양분의 공급이 원활하게 이루어지지
					못해 발생하게 된다. <a
						href="https://ko.wikipedia.org/wiki/%EA%B6%A4%EC%96%91"
						target="_blank">출처<i class="bi bi-box-arrow-up-right"></i></a>
				</p>

				<img class="result-sample-img"
					src="static/img/result_sample_nt.png" title="결정∙종괴 결과 샘플">
				<p class="paragraph">
					<strong>Nodule(결절) </strong> : 피부 안쪽이나 밑에 딱딱하고 솟아오른 조직이나 유체로, 지름은
					0.5cm를 초과한다. 결절은 상해를 입을 경우 힘줄이나 근육에 형성될 수 있다. 결절은 일반적으로 양성에 속하며 대부분
					무통이지만 장기의 기능에 영향을 줄 수 있다. <a
						href="https://ko.wikipedia.org/wiki/%EA%B2%B0%EC%A0%88"
						target="_blank">출처<i class="bi bi-box-arrow-up-right"></i></a>
				</p>

				<p class="paragraph">
					<strong>Tumor(종괴) </strong>: 종괴는 결절보다 큰 혹을 표현하는 말이다. 종괴는 덩이나 멍울,
					혹이란 말로 혼용된다. 혹이 염증이 뭉친 경우가 아니라, 세포가 자라서 혹이 된 경우 라면 종양이란 표현을 쓴다. 세포가
					얌전하게 자라고 몸에 문제를 끼치지 않으면 양성종양, 거침없이 자라서 여기저기 퍼지면 악성종양 즉 암이다. 종괴와 결절을
					칼로 베듯 구분하는 명확한 기준은 없다. 다만 각 장기의 원래 크기에 비추어 가늠하기도 한다. 예를 들어 피부 결절은
					1cm보다 작을 때, 폐에 생기는 결절은 3cm보다 작을 때 등이다. <a
						href="https://m.health.chosun.com/svc/news_view.html?contid=2016032901070"
						target="_blank">출처<i class="bi bi-box-arrow-up-right"></i></a>
				</p>
			</div>

		</div>
	</div>

</body>
</html>