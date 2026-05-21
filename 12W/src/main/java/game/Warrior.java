package game;


public class Warrior extends GameCharacter {

    public Warrior(String characterName, int level) {
        super(characterName, level);
        this.hp = level * 100;
        this.attackPower = level * 15;
    }

    @Override
    public double useSkill() {
        return attackPower * 1.5;
    }

    @Override
    public String getSkillName() {
        return "Sword Slash";
    }
}