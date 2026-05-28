<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="game.*" %>
    <%
    request.setCharacterEncoding("UTF-8");
    String action = request.getParameter("action");

    String createResult = "";
    String errorMessage = "";

    if ("create".equals(action)) {
        try {
            String playerId = request.getParameter("playerId");
            String characterName = request.getParameter("characterName");
            String job = request.getParameter("job");
            int level = Integer.parseInt(request.getParameter("level"));

            // 제어 클래스 생성
            전투 전투객체 = new 전투();
            
            // 캐릭터 생성 실행 (내부에서 플레이어체크를 수행하며 실패 시 예외 발생한다고 가정)
            캐릭터 생성된캐릭터 = 전투객체.캐릭터생성(playerId, characterName, job, level);

            if (생성된캐릭터 != null) {
                // 핵심: 다음 화면에서 사용하기 위해 생성된 캐릭터와 플레이어 id를 세션에 저장
                session.setAttribute("savedCharacter", 생성된캐릭터);
                session.setAttribute("savedPlayerId", playerId);
                
                // 공격 화면으로 이동할 수 있도록 결과 메시지 구성
                createResult = "캐릭터가 성공적으로 생성되었습니다!<br>" +
                               "이름: " + 생성된캐릭터.get캐릭터명() + " | " +
                               "직업: " + job + " | " +
                               "레벨: " + 생성된캐릭터.get레벨() + "<br>" +
                               "<a href='Attack_Monster_UI.jsp'>👉 몬스터 공격 화면으로 이동하기</a>";
            }
        } catch (NumberFormatException e) {
            errorMessage = "레벨은 숫자만 입력 가능합니다.";
        } catch (Exception e) {
            errorMessage = e.getMessage(); // "플레이어체크 실패" 등의 에러 메시지 처리
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f5f5f5; }
        .container { width: 500px; background-color: white; padding: 24px; border: 1px solid #ccc; }
        label { display: block; margin-top: 12px; font-weight: bold; }
        input, select { width: 100%; padding: 8px; margin-top: 4px; box-sizing: border-box; }
        button { margin-top: 20px; padding: 10px 16px; cursor: pointer; width: 100%; }
        .result { margin-top: 24px; padding: 16px; background-color: #e6f7ff; border-left: 5px solid #1890ff; }
        .error { margin-top: 24px; padding: 16px; background-color: #fff1f0; color: #cf1322; border-left: 5px solid #ff4d4f; }
    </style>
</head>
<body>
<div class="container">
    <h2>[Boundary] 캐릭터 생성 화면</h2>
    <form method="post" action="Create_Character_UI.jsp">
        <input type="hidden" name="action" value="create">

        <label>플레이어 ID</label>
        <input type="text" name="playerId" value="hero" required>

        <label>캐릭터 이름</label>
        <input type="text" name="characterName" value="초보전사" required>

        <label>직업</label>
        <select name="job">
            <option value="전사">전사</option>
            <option value="마법사">마법사</option>
        </select>

        <label>레벨</label>
        <input type="number" name="level" value="1" min="1" required>

        <button type="submit">캐릭터 생성</button>
    </form>

    <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
        <div class="error"><strong>오류:</strong> <%= errorMessage %></div>
    <% } %>

    <% if (createResult != null && !createResult.isEmpty()) { %>
        <div class="result"><strong>생성 결과:</strong><br><%= createResult %></div>
    <% } %>
</div>
</body>
</html>