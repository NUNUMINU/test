<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오류 페이지</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .error-container {
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #e9ecef;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .error-container h1 {
            color: #dc3545;
            font-size: 24px;
            margin-bottom: 10px;
        }
        .error-container p {
            color: #6c757d;
            margin-bottom: 20px;
        }
        .error-container a {
            display: inline-block;
            text-decoration: none;
            color: #ffffff;
            background-color: #007bff;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
        }
        .error-container a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1>오류 발생</h1>
    <p>
        <%
            String errorMessage = (String) session.getAttribute("errorMessage");
            if (errorMessage != null) {
                out.print(errorMessage);
            } else {
                out.print("알 수 없는 오류가 발생했습니다.");
            }
            session.removeAttribute("errorMessage");
        %>
    </p>
    <a href="/test/IndexServlet">메인 페이지로 이동</a>
</div>
</body>
</html>
