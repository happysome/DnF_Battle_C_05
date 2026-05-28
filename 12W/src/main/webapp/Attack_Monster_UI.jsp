<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="game.*" %>
    <%
    request.setCharacterEncoding("UTF-8");
    String action = request.getParameter("action");

    // 세션에서 앞서 생성한 캐릭터와 플레이어 ID를 가져옴
    캐릭터 캐릭터객체 = (캐릭터) session.getAttribute("savedCharacter");
    String 플레이어id = (String) session.getAttribute("savedPlayerId");

    String attackResult = "";
    String errorMessage = "";

    // 만약 세션에 캐릭터가 없다면 생성 화면으로 강제 리다이렉트 처리 가능
    if (캐릭터객체 == null) {
        errorMessage = "생성된 캐릭터가 없습니다. 캐릭터를 먼저 생성해 주세요.<br><a href='Create_Character_UI.jsp'>캐릭터 생성하러 가기</a>";
    }

    if ("attack".equals(action) && 캐릭터객체 != null) {
        try {
            // 제어 클래스 생성
            전투 전투객체 = new 전투();

            // 순차 다이어그램(SD) 구조 그대로 호출: 전투객체에 플레이어id와 캐릭터객체를 넘김
            attackResult = 전투객체.몬스터공격(플레이어id, 캐릭터객체);

        } catch (Exception e) {
            errorMessage = e.getMessage();
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
        .char-info { background-color: #f9f9f9; padding: 12px; margin-bottom: 20px; border: 1px dashed #bbb; }
        button { margin-top: 10px; padding: 12px 20px; cursor: pointer; width: 100%; background-color: #ff4d4f; color: white; border: none; font-size: 16px; font-weight: bold; }
        button:disabled { background-color: #cccccc; cursor: not-allowed; }
        .result { margin-top: 24px; padding: 16px; background-color: #f6ffed; border-left: 5px solid #52c41a; font-size: 16px; }
        .error { margin-top: 24px; padding: 16px; background-color: #fff1f0; color: #cf1322; border-left: 5px solid #ff4d4f; }
    </style>
</head>
<body>
<div class="container">
    <h2>[Boundary] 몬스터 공격 화면</h2>

    <% if (캐릭터객체 != null) { %>
        <div class="char-info">
            <strong>현재 보유 캐릭터 정보</strong><br>
            • 플레이어 ID: <%= 플레이어id %><br>
            • 캐릭터명: <%= 캐릭터객체.get캐릭터명() %><br>
            • 레벨: <%= 캐릭터객체.get레벨() %> Lv<br>
            • 현재 HP: <%= 캐릭터객체.getHp() %><br>
            • 기본 공격력: <%= 캐릭터객체.get공격력() %>
        </div>

        <form method="post" action="Attack_Monster_UI.jsp">
            <input type="hidden" name="action" value="attack">
            <button type="submit">⚔️ 몬스터 공격하기 (스킬 발동)</button>
        </form>
    <% } %>

    <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
        <div class="error"><strong>안내/오류:</strong><br><%= errorMessage %></div>
    <% } %>

    <% if (attackResult != null && !attackResult.isEmpty()) { %>
        <div class="result">
            <strong>공격 실행 결과:</strong><br>
            등급: <b><%= attackResult %></b>
        </div>
        <br>
        <a href="Create_Character_UI.jsp">🔄 새 캐릭터 만들러 가기</a>
    <% } %>
</div>
</body>
</html>