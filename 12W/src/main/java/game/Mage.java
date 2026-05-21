package game;

public class Mage extends GameCharacter {

    public Mage(String characterName, int level) {
        super(characterName, level);
        this.hp = level * 60;
        this.attackPower = level * 25;
    }

    @Override
    public double useSkill() {
        return attackPower * 2.0;
    }

    @Override
    public String getSkillName() {
        return "Fireball";
    }
}