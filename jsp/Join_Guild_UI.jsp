<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="game.전투" %>
<%
    request.setCharacterEncoding("UTF-8");
    String 결과메시지 = "";
    if ("submit".equals(request.getParameter("cmd"))) {
        전투 컨트롤러 = new 전투();
        String 플레이어id = request.getParameter("playerId");
        String 길드명 = request.getParameter("guildName");
        
        // v2.0 의존성이 완벽 분리된 형태의 길드 가입 및 5명 제한 검증 호출
        결과메시지 = 컨트롤러.길드가입(플레이어id, 길드명);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Join_Guild_UI</title>
</head>
<body>
    <h2>[Boundary] Join_Guild_UI (길드 가입)</h2>
    <form method="post">
        <input type="hidden" name="cmd" value="submit">
        플레이어 ID: <input type="text" name="playerId" value="hero"><br><br>
        가입할 길드명: <input type="text" name="guildName" value="아발론"><br><br>
        <button type="submit">길드 가입 신청</button>
    </form>
    
    <br>
    <div style="background-color: #f8d7da; padding: 10px; border: 1px solid #f5c6cb; width: 500px; font-weight: bold;">
        🚨 실행 결과 리포트: <%= 결과메시지.isEmpty() ? "입력 대기 중" : 결과메시지 %>
    </div>
    
    <br><hr>
    <p><b>📍 UI 네비게이션 링크</b></p>
    <ul>
        <li><a href="Create_Character_UI.jsp">캐릭터 생성 화면(Create_Character_UI)으로 이동</a></li>
        <li><a href="Attack_Monster_UI.jsp">몬스터 공격 화면(Attack_Monster_UI)으로 이동</a></li>
        <li><a href="Add_Item_UI.jsp">아이템 획득 화면(Add_Item_UI)으로 이동</a></li>
    </ul>
</body>
</html>