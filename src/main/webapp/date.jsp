<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>日期计算</title>
    <style>
        body {
            font-family: sans-serif;
        }
        .container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="date"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        button {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        #result {
            margin-top: 20px;
            font-weight: bold;
        }

    </style>
</head>
<body>
<div class="container">
    <h1>日期计算</h1>
    <form method="post">
        <label for="startDate">开始日期:</label>
        <input type="date" id="startDate" name="startDate" value="<%= request.getParameter("startDate") != null ? request.getParameter("startDate") : "" %>">

        <label for="endDate">结束日期:</label>
        <input type="date" id="endDate" name="endDate" value="<%= request.getParameter("endDate") != null ? request.getParameter("endDate") : "" %>">

        <button type="submit">计算</button>
    </form>

    <div id="result">
        <%
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");

            if (startDateStr != null && endDateStr != null && !startDateStr.isEmpty() && !endDateStr.isEmpty()) {
                try {
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    LocalDate startDate = LocalDate.parse(startDateStr, formatter);
                    LocalDate endDate = LocalDate.parse(endDateStr, formatter);

                    long days = ChronoUnit.DAYS.between(startDate, endDate);
                    long months = ChronoUnit.MONTHS.between(startDate, endDate);
                    long years = ChronoUnit.YEARS.between(startDate, endDate);


                    out.println(years + "年, " + (months % 12) + "月, " + (days % 30) + "天<br>"); // Simplified month/day calculation
                    out.println(days + "天");



                } catch (Exception e) {
                    out.println("请输入有效的日期");
                }
            }
        %>
    </div>
</div>
</body>
</html>