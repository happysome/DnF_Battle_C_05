<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="game.전투" %>
<%
    request.setCharacterEncoding("UTF-8");
    String 결과메시지 = "";
    if ("submit".equals(request.getParameter("cmd"))) {
        전투 컨트롤러 = new 전투();
        String 플레이어id = request.getParameter("playerId");
        String 아이템명 = request.getParameter("itemName");
        String 아이템타입 = request.getParameter("itemType");
        int 아이템가치 = Integer.parseInt(request.getParameter("itemValue"));
        
        // v2.0 가치 기반 등급 판정 및 인벤토리 10칸 제한 검증 호출
        결과메시지 = 컨트롤러.아이템획득(플레이어id, 아이템명, 아이템타입, 아이템가치);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add_Item_UI</title>
</head>
<body>
    <h2>[Boundary] Add_Item_UI (아이템 획득)</h2>
    <form method="post">
        <input type="hidden" name="cmd" value="submit">
        플레이어 ID: <input type="text" name="playerId" value="hero"><br><br>
        아이템명: <input type="text" name="itemName" value="바람의 반지"><br><br>
        아이템 타입: 
        <select name="itemType">
            <option value="무기">무기</option>
            <option value="방어구">방어구</option>
            <option value="물약">물약</option>
        </select><br><br>
        아이템 가치 수치: <input type="number" name="itemValue" value="750"><br>
        <span style="font-size:0.9em; color:gray;">(1000 이상: 전설 / 500 이상: 희귀 / 500 미만: 일반)</span><br><br>
        <button type="submit">아이템 획득 실행</button>
    </form>
    
    <br>
    <div style="background-color: #fff3cd; padding: 10px; border: 1px solid #ffeeba; width: 500px; font-weight: bold;">
        🚨 실행 결과 리포트: <%= 결과메시지.isEmpty() ? "입력 대기 중" : 결과메시지 %>
    </div>
    
    <br><hr>
    <p><b>📍 UI 네비게이션 링크</b></p>
    <ul>
        <li><a href="Create_Character_UI.jsp">캐릭터 생성 화면(Create_Character_UI)으로 이동</a></li>
        <li><a href="Attack_Monster_UI.jsp">몬스터 공격 화면(Attack_Monster_UI)으로 이동</a></li>
        <li><a href="Join_Guild_UI.jsp">길드 가입 화면(Join_Guild_UI)으로 이동</a></li>
    </ul>
</body>
</html>