package game;

// 요구사항: 캐릭터(추상클래스)
public abstract class 캐릭터 {
    // 속성 (캡슐화를 위해 private 설정 및 한글 명칭)
    private String 캐릭터명;
    private int 레벨;
    private int hp;
    private int 공격력;

    // 생성자
    public 캐릭터(String 캐릭터명, int 레벨) {
        this.캐릭터명 = 캐릭터명;
        this.레벨 = levelValidation(레벨);
    }

    // 요구사항: 추상 메서드 스킬발동 (반환 타입 double)
    public abstract double 스킬발동();

    // 레벨 유효성 검사 매커니즘 (기본값 1 제공)
    private int levelValidation(int 레벨) {
        return 레벨 < 1 ? 1 : 레벨;
    }

    // Getter / Setter (JSP 및 자식 클래스에서 접근하기 위함)
    public String get캐릭터명() { return 캐릭터명; }
    public void set캐릭터명(String 캐릭터명) { this.캐릭터명 = 캐릭터명; }

    public int get레벨() { return 레벨; }
    public void set레벨(int 레벨) { this.레벨 = 레벨; }

    public int getHp() { return hp; }
    public void setHp(int hp) { this.hp = hp; }

    public int get공격력() { return 공격력; }
    public void set공격력(int 공격력) { this.공격력 = 공격력; }
}