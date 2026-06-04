package game;

public class 마법사 extends 캐릭터 {

    public 마법사(String 플레이어id, String 캐릭터명, int 레벨) {
        super(플레이어id, 캐릭터명, 레벨);
        // v1.0 요구사항 공식 보존
        this.setHp(레벨 * 60);
        this.set공격력(레벨 * 25);
    }

    @Override
    public double 스킬발동() {
        System.out.println("파이어볼!");
        return this.get공격력() * 2.0;
    }
}