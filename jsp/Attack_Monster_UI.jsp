<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="game.전투" %>
<%
    request.setCharacterEncoding("UTF-8");
    String 결과메시지 = "";
    if ("submit".equals(request.getParameter("cmd"))) {
        전투 컨트롤러 = new 전투();
        String 플레이어id = request.getParameter("playerId");
        String 캐릭터명 = request.getParameter("charName");
        String 몬스터명 = request.getParameter("monsterName");
        int 몬스터체력 = Integer.parseInt(request.getParameter("monsterHp"));
        
        // v1.0 다형성 기반 몬스터 공격 및 데미지 등급(S, A, B) 판정 호출
        결과메시지 = 컨트롤러.몬스터공격(플레이어id, 캐릭터명, 몬스터명, 몬스터체력);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Attack_Monster_UI</title>
</head>
<body>
    <h2>[Boundary] Attack_Monster_UI (몬스터 공격)</h2>
    <form method="post">
        <input type="hidden" name="cmd" value="submit">
        플레이어 ID: <input type="text" name="playerId" value="hero"><br><br>
        캐릭터명: <input type="text" name="charName" value="카이엔"><br><br>
        대상 몬스터명: <input type="text" name="monsterName" value="데스나이트"><br><br>
        몬스터 체력: <input type="number" name="monsterHp" value="100"><br><br>
        <button type="submit">스킬 발동 및 공격 명령</button>
    </form>
    
    <br>
    <div style="background-color: #efe; padding: 10px; border: 1px solid #9b9; width: 500px; font-weight: bold;">
        🚨 실행 결과 리포트: <%= 결과메시지.isEmpty() ? "입력 대기 중" : 결과메시지 %>
    </div>
    
    <br><hr>
    <p><b>📍 UI 네비게이션 링크</b></p>
    <ul>
        <li><a href="Create_Character_UI.jsp">캐릭터 생성 화면(Create_Character_UI)으로 이동</a></li>
        <li><a href="Add_Item_UI.jsp">아이템 획득 화면(Add_Item_UI)으로 이동</a></li>
        <li><a href="Join_Guild_UI.jsp">길드 가입 화면(Join_Guild_UI)으로 이동</a></li>
    </ul>
</body>
</html>