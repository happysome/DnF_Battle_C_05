package game;

public class Battle {

    public GameCharacter createCharacter(String playerId, String characterName, String job, int level) {
        Player player = new Player(playerId);

        if (!player.checkPlayer()) {
            throw new IllegalArgumentException("Player check failed. Player ID must be hero.");
        }

        if (characterName == null || characterName.trim().isEmpty()) {
            throw new IllegalArgumentException("Character name is required.");
        }

        if (level <= 0) {
            throw new IllegalArgumentException("Level must be greater than 0.");
        }

        if ("Warrior".equals(job)) {
            return new Warrior(characterName, level);
        } else if ("Mage".equals(job)) {
            return new Mage(characterName, level);
        } else {
            throw new IllegalArgumentException("Job must be Warrior or Mage.");
        }
    }

    public String attackMonster(String playerId, GameCharacter character) {
        Player player = new Player(playerId);

        if (!player.checkPlayer()) {
            throw new IllegalArgumentException("Player check failed. Player ID must be hero.");
        }

        if (character == null) {
            throw new IllegalArgumentException("Character does not exist.");
        }

        double damage = character.useSkill();
        String skillName = character.getSkillName();
        String grade;

        if (damage >= 200) {
            grade = "S Grade Attack";
        } else if (damage >= 100) {
            grade = "A Grade Attack";
        } else {
            grade = "B Grade Attack";
        }

        StringBuilder result = new StringBuilder();

        result.append("스킬 이름: ").append(skillName).append("\n");
        result.append("데미지: ").append(damage).append("\n");
        result.append("공격 등급: ").append(grade);

        return result.toString();
    }
}