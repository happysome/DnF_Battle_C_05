package game;

public class 마법사 extends 캐릭터 {

    // 생성자: 객체 생성(create) 시 능력치가 자동으로 설정됨
    public 마법사(String 캐릭터명, int 레벨) {
        super(캐릭터명, 레벨);
        // 요구사항 공식: hp = 레벨 * 60, 공격력 = 레벨 * 25
        this.setHp(레벨 * 60);
        this.set공격력(레벨 * 25);
    }

    // 요구사항: 행위명(스킬발동 - 파이어볼)
    @Override
    public double 스킬발동() {
        // 요구사항 공식: "파이어볼!" -> 데미지 = 공격력 * 2.0
        System.out.println("파이어볼!");
        return this.get공격력() * 2.0;
    }
}