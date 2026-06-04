package game;

import java.util.ArrayList;
import java.util.List;

public class 길드 {
    private String 길드명;
    // CD 표기법: List~캐릭터~ 매핑
    private List<캐릭터> 캐릭터리스트;
    private int 최대인원;

    public 길드(String 길드명) {
        this.길드명 = 길드명;
        this.캐릭터리스트 = new ArrayList<>();
        this.최대인원 = 5; // 요구사항: 길드 정원은 최대 5명
    }

    // 핵심: 외부에서 인원수를 체크해 가입시키지 않고, 길드가 스스로 정원을 판단함 (의존성 제거)
    public boolean 캐릭터가입(캐릭터 캐릭터객체) {
        if (캐릭터리스트.size() >= 최대인원) {
            return false; // 정원 초과 시 가입 거부
        }
        return 캐릭터리스트.add(캐릭터객체); // 가입 성공
    }

    // Getter / Setter
    public String get길드명() { return 길드명; }
    public void set길드명(String 길드명) { this.길드명 = 길드명; }

    public int get현재인원() {
        return 캐릭터리스트.size();
    }
}