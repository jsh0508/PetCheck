<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Image Upload and Preview</title>
<style>
#root {
	width: 100%;
	margin: 0 auto;
	max-width: 800px;
}

.title {
	text-align: center;
}

.contents {
	display: flex;
	flex-direction: row;
	margin-top: 30px;
}

.contents .upload-box {
	width: 100%;
	margin-right: 30px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.contents .upload-box .drag-file {
	position: relative;
	width: 100%;
	height: 360px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	border: 3px dashed #dbdbdb;
}

.contents .upload-box .drag-file.highlight {
	border: 3px dashed red;
}

.contents .upload-box .drag-file .image {
	width: 40px;
}

.contents .upload-box .drag-file .message {
	margin-bottom: 0;
}

.contents .upload-box .drag-file .preview {
	display: none;
	position: absolute;
	left: 0;
	height: 0;
	width: 100%;
	height: 100%;
}

.contents .upload-box .file-label {
	margin-top: 30px;
	background-color: #5b975b;
	color: #fff;
	text-align: center;
	padding: 10px 0;
	width: 65%;
	border-radius: 6px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div id="root">
		<h2 class="title">File Upload</h2>
		<hr>
		<form action="http://172.30.1.65:5000/result" method="post" enctype="multipart/form-data">
			<div class="contents">
				<div class="upload-box">
					<div id="drop-file" class="drag-file">
						<img src="https://img.icons8.com/pastel-glyph/2x/image-file.png"
							alt="파일 아이콘" class="image">
						<p class="message">Drag files to upload</p>
						<img src="" alt="미리보기 이미지" class="preview">
					</div>
					<label class="file-label" for="image-input">Choose File</label> 
					<input name = "image" class="file" id="image-input" type="file" onchange="dropFile.handleFiles(this.files)" accept="image/png, image/jpeg, image/gif">
					<input type="submit" value="Upload">
				</div>
			</div>
		</form>
	</div>
</body>
</html>


<script>

function DropFile(dropAreaId, fileListId) {
	  let dropArea = document.getElementById(dropAreaId);
	  let fileList = document.getElementById(fileListId);

	  function preventDefaults(e) {
	    e.preventDefault();
	    e.stopPropagation();
	  }

	  function highlight(e) {
	    preventDefaults(e);
	    dropArea.classList.add("highlight");
	  }

	  function unhighlight(e) {
	    preventDefaults(e);
	    dropArea.classList.remove("highlight");
	  }

	  function handleDrop(e) {
	    unhighlight(e);
	    let dt = e.dataTransfer;
	    let files = dt.files;

	    handleFiles(files);

	    const fileList = document.getElementById(fileListId);
	    if (fileList) {
	      fileList.scrollTo({ top: fileList.scrollHeight });
	    }
	  }

	  function handleFiles(files) {
	    files = [...files];
	    // files.forEach(uploadFile);
	    files.forEach(previewFile);
	  }

	  function previewFile(file) {
	    console.log(file);
	    renderFile(file);
	  }

	  function renderFile(file) {
	    let reader = new FileReader();
	    reader.readAsDataURL(file);
	    reader.onloadend = function () {
	      let img = dropArea.getElementsByClassName("preview")[0];
	      img.src = reader.result;
	      img.style.display = "block";
	    };
	  }

	  dropArea.addEventListener("dragenter", highlight, false);
	  dropArea.addEventListener("dragover", highlight, false);
	  dropArea.addEventListener("dragleave", unhighlight, false);
	  dropArea.addEventListener("drop", handleDrop, false);

	  return {
	    handleFiles
	  };
	}

	const dropFile = new DropFile("drop-file", "files");
</script>
