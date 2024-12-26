<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>进制转换</title>
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
        input[type="text"], select {
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
    <h1>进制转换</h1>
    <form method="post">
        <label for="number">输入数字:</label>
        <input type="text" id="number" name="number" value="<%= request.getParameter("number") != null ? request.getParameter("number") : "" %>">

        <label for="fromBase">原始进制:</label>
        <select id="fromBase" name="fromBase">
            <option value="2" <%= "2".equals(request.getParameter("fromBase")) ? "selected" : "" %>>二进制</option>
            <option value="8" <%= "8".equals(request.getParameter("fromBase")) ? "selected" : "" %>>八进制</option>
            <option value="10"<%= "10".equals(request.getParameter("fromBase")) ? "selected" : "" %>>十进制</option>
            <option value="16"<%= "16".equals(request.getParameter("fromBase")) ? "selected" : "" %>>十六进制</option>
        </select>

        <label for="toBase">目标进制:</label>
        <select id="toBase" name="toBase">
            <option value="2" <%= "2".equals(request.getParameter("toBase")) ? "selected" : "" %>>二进制</option>
            <option value="8" <%= "8".equals(request.getParameter("toBase")) ? "selected" : "" %>>八进制</option>
            <option value="10"<%= "10".equals(request.getParameter("toBase")) ? "selected" : "" %>>十进制</option>
            <option value="16"<%= "16".equals(request.getParameter("toBase")) ? "selected" : "" %>>十六进制</option>
        </select>

        <button type="submit">转换</button>
    </form>

    <div id="result">
        <%
            String numberStr = request.getParameter("number");
            String fromBaseStr = request.getParameter("fromBase");
            String toBaseStr = request.getParameter("toBase");

            if (numberStr != null && fromBaseStr != null && toBaseStr != null
                    && !numberStr.isEmpty() && !fromBaseStr.isEmpty() && !toBaseStr.isEmpty()) {
                try {
                    int fromBase = Integer.parseInt(fromBaseStr);
                    int toBase = Integer.parseInt(toBaseStr);

                    // Convert to base 10 first
                    int decimalValue = Integer.parseInt(numberStr, fromBase);


                    // Convert from base 10 to target base
                    String convertedValue = Integer.toString(decimalValue, toBase);
                    out.println("结果: " + convertedValue);

                } catch (NumberFormatException e) {
                    out.println("请输入有效的数字和进制");
                }
            }
        %>
    </div>
</div>

</body>
</html>