<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="game.전투" %>
<%
    request.setCharacterEncoding("UTF-8");
    String 결과메시지 = "";
    if ("submit".equals(request.getParameter("cmd"))) {
        전투 컨트롤러 = new 전투();
        String 플레이어id = request.getParameter("playerId");
        String 캐릭터명 = request.getParameter("charName");
        String 직업 = request.getParameter("job");
        int 레벨 = Integer.parseInt(request.getParameter("level"));
        
        // v1.0 캐릭터 생성 호출 (내부적으로 v2.0 빈 인벤토리 자동 생성됨)
        결과메시지 = 컨트롤러.캐릭터생성(플레이어id, 캐릭터명, 직업, 레벨);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create_Character_UI</title>
</head>
<body>
    <h2>[Boundary] Create_Character_UI (캐릭터 생성)</h2>
    <form method="post">
        <input type="hidden" name="cmd" value="submit">
        플레이어 ID (반드시 'hero' 입력): <input type="text" name="playerId" value="hero"><br><br>
        캐릭터명: <input type="text" name="charName" value="카이엔"><br><br>
        직업 선택: 
        <select name="job">
            <option value="전사">전사 (HP: 레벨*100 / 공격력: 레벨*15)</option>
            <option value="마법사">마법사 (HP: 레벨*60 / 공격력: 레벨*25)</option>
        </select><br><br>
        레벨 설정: <input type="number" name="level" value="10"><br><br>
        <button type="submit">캐릭터 생성 요청</button>
    </form>
    
    <br>
    <div style="background-color: #eef; padding: 10px; border: 1px solid #99b; width: 500px; font-weight: bold;">
        🚨 실행 결과 리포트: <%= 결과메시지.isEmpty() ? "입력 대기 중" : 결과메시지 %>
    </div>
    
    <br><hr>
    <p><b>📍 UI 네비게이션 링크</b></p>
    <ul>
        <li><a href="Attack_Monster_UI.jsp">몬스터 공격 화면(Attack_Monster_UI)으로 이동</a></li>
        <li><a href="Add_Item_UI.jsp">아이템 획득 화면(Add_Item_UI)으로 이동</a></li>
        <li><a href="Join_Guild_UI.jsp">길드 가입 화면(Join_Guild_UI)으로 이동</a></li>
    </ul>
</body>
</html>