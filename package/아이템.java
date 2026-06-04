package game;

public class 아이템 {
    private String 아이템명;
    private String 타입; // 무기, 방어구, 물약
    private int 가치;
    private String 등급; // 전설, 희귀, 일반

    // 교정: 메서드명을 'check'에서 클래스명인 '아이템'으로 일치시켰습니다.
    public 아이템(String 아이템명, String 타입, int 가치, String 등급) {
        this.아이템명 = 아이템명;
        this.타입 = 타입;
        this.가치 = 가치;
        this.등급 = 등급;
    }

    // Getter / Setter
    public String get아이템명() { return 아이템명; }
    public void set아이템명(String 아이템명) { this.아이템명 = 아이템명; }

    public String get타입() { return 타입; }
    public void set타입(String 타입) { this.타입 = 타입; }

    public int get가치() { return 가치; }
    public void set가치(int 가치) { this.가치 = 가치; }

    public String get등급() { return 등급; }
    public void set등급(String 등급) { this.등급 = 등급; }
}