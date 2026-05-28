package game;

public class 플레이어 {
    // 속성 (데이터 타입 영문)
    private String 플레이어id;

    // 생성자
    public 플레이어() {
    }

    // 행위 (명칭 한글, 데이터 타입 및 매개변수 영문)
    public boolean 플레이어체크(String 입력id) {
        // 요구사항: 반드시 플레이어 체크를 한다.(플레이어 id는 "hero")
        if ("hero".equals(입력id)) {
            return true;
        }
        return false;
    }

    // Getter / Setter
    public String get플레이어id() {
        return 플레이어id;
    }

    public void set플레이어id(String 플레이어id) {
        this.플레이어id = 플레이어id;
    }
}