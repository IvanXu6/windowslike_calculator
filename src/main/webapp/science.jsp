<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="calculator" class="calculator.CalculatorBean" scope="session" />
<!DOCTYPE html>
<html>
<head>
    <title>科学计算器</title>
    <style>
        
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
    background-color: #f4f4f4; 
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}


.calculator {
    background-color: #808080; 
    border-radius: 15px; 
    padding: 30px; 
    width: 350px; 
    text-align: center;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); 
}


h2 {
    font-size: 26px; 
    color: #333; 
    margin-bottom: 25px; /
}


input[type="text"] {
    width: 100%;
    padding: 15px;
    font-size: 36px; 
    color: #333;
    background-color: #f1f1f1; 
    border: 1px solid #ccc;
    border-radius: 10px;
    text-align: right;
    box-sizing: border-box;
    margin-bottom: 25px; 
}


input[type="button"] {
    width: 60px; 
    height: 60px;
    font-size: 24px;
    color: white;
    background-color: #505050; 
    border: none;
    border-radius: 12px; 
    margin: 8px; 
    cursor: pointer;
    transition: background-color 0.2s ease, transform 0.1s ease; 
}


input[type="button"]:hover {
    background-color: #707070;
    transform: translateY(-3px); 
}


input[type="button"]:active {
    background-color: #404040;
    transform: translateY(1px); 
}


input[type="button"].equal {
    background-color: #00b8d4; 
    color: white;
}

input[type="button"].equal:hover {
    background-color: #0098a6;
}

input[type="button"].equal:active {
    background-color: #007c8b;
}


.button-container {
    display: grid;
    grid-template-columns: repeat(4, 1fr); 
    grid-gap: 15px; 
}


.extra-buttons {
    grid-column: span 2; 
}


input[type="button"].clear {
    background-color: #ff7043; 
}

input[type="button"].clear:hover {
    background-color: #f4511e;
}

input[type="button"].clear:active {
    background-color: #d32f2f; 
}


    </style>
</head>
<body>
    <div class="calculator">
        <h2>科学计算器</h2>
        <form method="post">
            <input type="text" id="resultInput" name="result" value="<%= request.getParameter("result") != null ? request.getParameter("result") : "" %>" disabled />
            <div class="button-container">
                <input type="button" value="C" onclick="clearResult()" />
                <input type="button" value="1" onclick="addToResult('1')" />
                <input type="button" value="2" onclick="addToResult('2')" />
                <input type="button" value="3" onclick="addToResult('3')" />
                <input type="button" value="4" onclick="addToResult('4')" />
                <input type="button" value="5" onclick="addToResult('5')" />
                <input type="button" value="6" onclick="addToResult('6')" />
                <input type="button" value="7" onclick="addToResult('7')" />
                <input type="button" value="8" onclick="addToResult('8')" />
                <input type="button" value="9" onclick="addToResult('9')" />
                <input type="button" value="0" onclick="addToResult('0')" />
                <input type="button" value="+" onclick="addToResult('+')" />
                <input type="button" value="-" onclick="addToResult('-')" />
                <input type="button" value="x" onclick="addToResult('*')" />
                <input type="button" value="/" onclick="addToResult('/')" />
                <input type="button" value="sqrt" onclick="addToResult('Math.sqrt(')" />
                <input type="button" value="pow" onclick="addToResult('Math.pow(')" />
                <input type="button" value="sin" onclick="addToResult('Math.sin(')" />
                <input type="button" value="cos" onclick="addToResult('Math.cos(')" />
                <input type="button" value="tan" onclick="addToResult('Math.tan(')" />
                <input type="button" value="ln" onclick="addToResult('Math.log(')" />
                <input type="button" value="log_x" onclick="logX()"  />
                <input type="button" value="(" onclick="addToResult('(')" />
                <input type="button" value=")" onclick="addToResult(')')" />
                <input type="button" value="=" onclick="calculate()" class="equal" />
                <input type="button" value="ANS" onclick="useLastResult()" />
            </div>
        </form>
    </div>

    <script>
        let lastResult = ${calculator.lastResult};

        function addToResult(value) {
            const resultInput = document.querySelector('input[name="result"]');
            resultInput.value += value;
        }

        function clearResult() {
            document.querySelector('input[name="result"]').value = '';
        }

        function useLastResult() {
            const resultInput = document.querySelector('input[name="result"]');
            if (resultInput.value === '') {
                resultInput.value = lastResult;
            }
        }

        function calculate() {
            const resultInput = document.querySelector('input[name="result"]');
            try {
                const result = eval(resultInput.value);
                resultInput.value = result;
                lastResult = result;
                
                // 使用AJAX更新JavaBean中的结果
                const xhr = new XMLHttpRequest();
                xhr.open('POST', 'UpdateResult.jsp', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.send('result=' + result);
            } catch (e) {
                resultInput.value = '算术错误';
            }
        }
    </script>
</body>
</html>
