package game;

public abstract class 캐릭터 {
    protected String 플레이어id;
    private String 캐릭터명;
    private int 레벨;
    private int hp;
    private int 공격력;
    protected 인벤토리 인벤토리; // Composition

    // v1.0 규칙에 v2.0 플레이어id와 인벤토리 조립 결합
    public 캐릭터(String 플레이어id, String 캐릭터명, int 레벨) {
        this.플레이어id = 플레이어id;
        this.캐릭터명 = 캐릭터명;
        this.레벨 = levelValidation(레벨);
        this.인벤토리 = new 인벤토리(); // 캐릭터 생성 시 빈 인벤토리 자동 생성 [Composition]
    }

    public abstract double 스킬발동();

    private int levelValidation(int 레벨) {
        return 레벨 < 1 ? 1 : 레벨;
    }

    // CD-SD-Java 추적성 확보를 위한 핵심 Getter
    public 인벤토리 get인벤토리() { return 인벤토리; }
    public String get캐릭터명() { return 캐릭터명; }
    public void set캐릭터명(String 캐릭터명) { this.캐릭터명 = 캐릭터명; }
    public int get레벨() { return 레벨; }
    public void set레벨(int 레벨) { this.레벨 = 레벨; }
    public int getHp() { return hp; }
    public void setHp(int hp) { this.hp = hp; }
    public int get공격력() { return 공격력; }
    public void set공격력(int 공격력) { this.공격력 = 공격력; }
}