package game;

public class 플레이어 {
    private String 플레이어id;

    public 플레이어() {
    }

    // CD 및 SD의 한글/영문 혼용 명세 동기화: 플레이어check
    public boolean 플레이어check(String 입력id) {
        // 요구사항: 반드시 플레이어 체크를 한다.(플레이어 id는 "hero")
        return "hero".equals(입력id);
    }

    public String get플레이어id() { return 플레이어id; }
    public void set플레이어id(String 플레이어id) { this.플레이어id = 플레이어id; }
}