<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="game.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    String action = request.getParameter("action");

    String createResult = "";
    String attackResult = "";
    String errorMessage = "";

    if ("execute".equals(action)) {
        try {
            String playerId = request.getParameter("playerId");
            String characterName = request.getParameter("characterName");
            String job = request.getParameter("job");
            int level = Integer.parseInt(request.getParameter("level"));

            Battle battle = new Battle();

            GameCharacter createdCharacter = battle.createCharacter(
                    playerId,
                    characterName,
                    job,
                    level
            );

            createResult =
                    "캐릭터가 생성되었습니다\n" +
                    "캐릭터 이름: " + createdCharacter.getCharacterName() + "\n" +
                    "직업: " + job + "\n" +
                    "Level: " + createdCharacter.getLevel() + "\n" +
                    "HP: " + createdCharacter.getHp() + "\n" +
                    "Attack Power: " + createdCharacter.getAttackPower();

            attackResult = battle.attackMonster(playerId, createdCharacter);

        } catch (NumberFormatException e) {
            errorMessage = "Level must be a number.";
        } catch (Exception e) {
            errorMessage = e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>던파 전투 시스템</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f5f5f5;
        }

        .container {
            width: 600px;
            background-color: white;
            padding: 24px;
            border: 1px solid #ccc;
        }

        h1 {
            font-size: 24px;
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            box-sizing: border-box;
        }

        button {
            margin-top: 20px;
            padding: 10px 16px;
            cursor: pointer;
        }

        .result {
            margin-top: 24px;
            padding: 16px;
            background-color: #eeeeee;
            white-space: pre-line;
        }

        .error {
            margin-top: 24px;
            padding: 16px;
            background-color: #ffd6d6;
            color: #900;
            white-space: pre-line;
        }
    </style>
</head>

<body>
<div class="container">
    <h1>던파 전투 시스템</h1>

    <form method="post" action="index.jsp">
        <input type="hidden" name="action" value="execute">

        <label>Player ID</label>
        <input type="text" name="playerId" value="hero">

        <label>캐릭터 이름</label>
        <input type="text" name="characterName" value="Ghost Knight">

        <label>직업</label>
        <select name="job">
            <option value="Warrior">전사</option>
            <option value="Mage">마법사</option>
        </select>

        <label>Level</label>
        <input type="number" name="level" value="10">

        <button type="submit">몬스터 생성하고 공격하기</button>
    </form>

    <% if (!errorMessage.isEmpty()) { %>
        <div class="error">
            <strong>Error</strong>
            <br>
            <%= errorMessage %>
        </div>
    <% } %>

    <% if (!createResult.isEmpty()) { %>
        <div class="result">
            <strong>Create Character Result</strong>
            <br>
            <%= createResult %>
        </div>
    <% } %>

    <% if (!attackResult.isEmpty()) { %>
        <div class="result">
            <strong>Attack Monster Result</strong>
            <br>
            <%= attackResult %>
        </div>
    <% } %>
</div>
</body>
</html>