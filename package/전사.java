package game;

public class 전사 extends 캐릭터 {

    public 전사(String 플레이어id, String 캐릭터명, int 레벨) {
        // 부모 생성자 시그니처 4개 인자 일치화
        super(플레이어id, 캐릭터명, "전사", 레벨);
        // v1.0 능력치 자동 설정 공식
        this.setHp(레벨 * 100);
        this.set공격력(레벨 * 15);
    }

    @Override
    public double 스킬발동() {
        System.out.println("검 휘두르기!"); 
        return this.get공격력() * 1.5;
    }
}