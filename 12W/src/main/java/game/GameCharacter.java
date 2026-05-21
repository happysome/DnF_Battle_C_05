package game;

public abstract class GameCharacter {
    protected String characterName;
    protected int level;
    protected int hp;
    protected int attackPower;

    public GameCharacter(String characterName, int level) {
        this.characterName = characterName;
        this.level = level;
    }

    public abstract double useSkill();

    public abstract String getSkillName();

    public String getCharacterName() {
        return characterName;
    }

    public int getLevel() {
        return level;
    }

    public int getHp() {
        return hp;
    }

    public int getAttackPower() {
        return attackPower;
    }
}