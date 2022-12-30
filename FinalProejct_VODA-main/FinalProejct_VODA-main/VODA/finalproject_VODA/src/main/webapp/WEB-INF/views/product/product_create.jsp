<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--BootStrap CSS-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style>
        @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');

        * {
            font-family: Pretendard,
                -apple-system, BlinkMacSystemFont,
                system-ui, Roboto, 'Helvetica Neue', 'Segoe UI', 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', sans-serif;
        }

        input:focus {
            outline: none;
        }

        button:focus {
            box-shadow: none !important;
        }

        .btn-logoc {
            color: #fff;
            border-color: #495FE9;
            background-color: #495FE9;
        }

        .btn-logoc:hover {
            background-color: #0b27db !important;
            border-color: #0b27db;
            color: #fff !important;
        }

        .btn {

            transition: background 0.2s ease-in-out,
                color 0.2s ease-in-out;
        }

        .btn-greyc {
            background-color: rgb(235, 236, 240);
            border: rgb(235, 236, 240);
            color: #000000;

        }

        .btn-greyc:hover {
            background-color: #c3c3c4b7 !important;
            border-color: #c3c3c4b7 !important;
            color: #000000 !important;


        }

        .table-active,
        .table-active>td,
        .table-active>th {
            background-color: rgb(235, 236, 240);
        }

        table * {
            font-size: 14.45px;
            color: #000000;
        }

        .table thead th {
            border-bottom: 1px;
        }

        .table {
            margin-bottom: 0rem;
        }


        .table td,
        .table th {
            padding: 10px;
        }

        .table th {
            padding-left: 13px;
        }

        .note-placeholder {
            font-size: 14.45px;
        }

        .dropdown-toggle::after {
            display: none;

        }
    </style>

    <!-- common CSS-->
    <link rel="stylesheet" type="text/css" href="../../CSS/Common/headerfooter.css">

    <!--BootStrap JS-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>

    <!-- summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <title>product_create</title>


</head>
<body>
<!-- 내용 전체 컨테이너 -->
    <div class="container mt-5">

        <div>
            <h3 style="text-align: center; color: #444343; font-size: 1.5rem;">상품 등록</h3>
        </div>
        <!-- 후기글 전체 -->
		<form action="${path}/product/product_create" method="post" enctype="multipart/form-data">
        <div class="mt-5" style="border: 1px solid rgb(238, 233, 233);">
            <div>
                <table class="table m-0">
                    <thead>
                        <tr>
                            <th class="table-active" style="width: 20%;">상품명</th>
                            <td style="width: 80%;"><input type="text" name="pname" placeholder="상품명을 입력해주세요." style="width: 80%;">
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th class="table-active">카테고리</th>
                            <td><input type="text" name="pcategory" placeholder="상품 카테고리를 입력해주세요" style="width: 50%;"></td>
                        </tr>
                        <tr>
                            <th class="table-active">제조사</th>
                            <td><input type="text" name="pmadecompany" placeholder="제조사를 입력해주세요" style="width: 50%;"></td>
                        </tr>
                        <tr>
                            <th class="table-active">원산지</th>
                            <td><input type="text" name="pmadelocal" placeholder="원산지를 입력해주세요" style="width: 50%;"></td>
                        </tr>
                        <tr>
                            <th class="table-active">상품 전체 수량</th>
                            <td><input type="number" name="pqtt" placeholder="수량를 입력해주세요" style="width: 50%;"></td>
                        </tr>
                        <tr>
                            <th class="table-active">상품 가격</th>
                            <td><input type="number" name="pprice" placeholder="상품 가격을 입력해주세요" style="width: 50%;"></td>
                        </tr>
                        <tr>
                            <th class="table-active">File</th>
                            <td>
							<input multiple="multiple" type="file" name="multiFile" />

                                
                            </td>
                        </tr>
                    </tbody>

                </table>
            </div>


            <!-- 내용 -->
            <div class="my-2 px-2">

                <textarea id="summernote" name="pcontents"></textarea>
                <script>
                    $('#summernote').summernote({
                        placeholder: '내용을 입력해주세요',
                        focus: true,
                        height: 400,
                        toolbar: [
                            // [groupName, [list of button]]
                            ['fontname', ['fontname']],
                            ['fontsize', ['fontsize']],
                            ['color', ['color']],
                            ['style', ['bold', 'italic', 'underline', 'clear']],
                            ['para', ['ul', 'ol', 'paragraph']],
                            ['insert', ['picture', 'video']],
                            ['height', ['height']]
                        ],
                        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋음체', '바탕체'],
                        // 추가한 폰트사이즈
                        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
                        // 줄간격
                        lineHeights: ['0.2', '0.3', '0.4', '0.5', '0.6', '0.8', '1.0', '1.2', '1.4', '1.5', '2.0', '3.0']
                        
                    });
                    $('#summernote').summernote('fontSize', 14);
                </script>

                <div class="text-right mt-2">
                    <button class="btn btn-primary py-1" style="width: 100px">Post</button>
                    <button type="button" class="btn btn-light py-1" style="width: 100px; height: 36px;" onclick="location.href='${path}/product/product_all_list'">Cancle</button>
                </div>
            </div>
        </div>
        </form>

        <div class="mb-5">
        </div>
    </div>
    </body>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>