package game;

public class 전사 extends 캐릭터 {

    // 생성자: 객체 생성(create) 시 능력치가 자동으로 설정됨
    public 전사(String 캐릭터명, int 레벨) {
        super(캐릭터명, 레벨);
        // 요구사항 공식: hp = 레벨 * 100, 공격력 = 레벨 * 15
        this.setHp(레벨 * 100);
        this.set공격력(레벨 * 15);
    }

    // 요구사항: 행위명(스킬발동 - 검 휘두르기)
    @Override
    public double 스킬발동() {
        // 요구사항 공식: "검 휘두르기!" -> 데미지 = 공격력 * 1.5
        System.out.println("검 휘두르기!"); 
        return this.get공격력() * 1.5;
    }
}